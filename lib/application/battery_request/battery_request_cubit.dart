import 'dart:async';
import 'dart:developer';

import 'package:cloudinary/cloudinary.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:simple_connection_checker/simple_connection_checker.dart';
import 'package:zembo_agent_app/application/battery_request/i_battery_facade.dart';
import 'package:zembo_agent_app/application/local_db/i_localdb_facade.dart';
import 'package:zembo_agent_app/core/constants/enum.dart';
import 'package:zembo_agent_app/domain/battery_request/battery_request.dart';
import 'package:zembo_agent_app/domain/location/app_location.dart';
import 'package:zembo_agent_app/domain/user/user.dart';

part 'battery_request_cubit.freezed.dart';
part 'battery_request_state.dart';

@injectable
class BatteryRequestCubit extends Cubit<BatteryRequestState> {
  BatteryRequestCubit(this._batteryRequestFacade, this._localDBFacade)
    : super(BatteryRequestState.initial());

  final IBatteryRequestFacade _batteryRequestFacade;
  final ILocalDBFacade _localDBFacade;

  Future<bool> localDBhasUnsyncedData() async {
    final batteryRequests = await _localDBFacade.fetchBatteryRequests();
    final unsyncedBatteryRequests = batteryRequests
        .where((battery) => battery.synced == false)
        .toList();
    return unsyncedBatteryRequests.isNotEmpty;
  }

  Future<void> getBatteryRequests(int swapperId) async {
    try {
      emit(state.copyWith(fetchBatteryRequestsStatus: AppStatus.submitting));

      final isConnected = await SimpleConnectionChecker.isConnectedToInternet();
      var requests = <BatteryRequest>[];

      if (isConnected) {
        final batteryRequests = await _batteryRequestFacade
            .getBatteryRequests();
        requests = batteryRequests
            .where(
              (request) => request.swapper!.id! == swapperId,
            )
            .toList();
        unawaited(syncLocalToRemoteBatteryRequest(swapperId));
      } else {
        //
        requests = await _localDBFacade.fetchBatteryRequests();
      }

      emit(
        state.copyWith(
          batteryRequests: requests,
          fetchBatteryRequestsStatus: AppStatus.success,
        ),
      );
    } on DioException catch (e) {
      emit(
        state.copyWith.call(
          fetchBatteryRequestError:
              e.response?.data['error']['message'] as String?,
          fetchBatteryRequestsStatus: AppStatus.failure,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith.call(
          fetchBatteryRequestError: 'An error occurred',
          fetchBatteryRequestsStatus: AppStatus.failure,
        ),
      );
    }
  }

  Future<void> createBatteryRequest({
    required int numberOfBatteries,
    required AppLocation destination,
    required User swapper,
  }) async {
    try {
      emit(state.copyWith(batteryRequestStatus: AppStatus.submitting));

      final isConnected = await SimpleConnectionChecker.isConnectedToInternet();

      if (isConnected) {
        await _batteryRequestFacade.createBatteryRequest(
          swapperId: swapper.id!,
          numberOfBatteries: numberOfBatteries,
          destination: destination.id!,
        );
      } else {
        await _localDBFacade.saveBatteryRequest(
          BatteryRequest.initial().copyWith.call(
            id: DateTime.now().millisecondsSinceEpoch,
            synced: false,
            numberOfBatteries: numberOfBatteries,
            swapper: swapper,
            destination: destination,
            status: 'requested',
            createdAt: DateTime.now().toIso8601String(),
            updatedAt: DateTime.now().toIso8601String(),
          ),
        );
      }

      await getBatteryRequests(swapper.id!);
      emit(state.copyWith(batteryRequestStatus: AppStatus.success));
    } on DioException catch (e) {
      emit(
        state.copyWith.call(
          batteryRequestError: e.response?.data['error']['message'] as String?,
          batteryRequestStatus: AppStatus.failure,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith.call(
          batteryRequestError: 'An error occurred',
          batteryRequestStatus: AppStatus.failure,
        ),
      );
    }
  }

  Future<void> syncLocalToRemoteBatteryRequest(int userId) async {
    try {
      final isConnected = await SimpleConnectionChecker.isConnectedToInternet();

      if (!isConnected) {
        return;
      }

      // get unsynced battery Requests
      final allBatteryRequests = await _localDBFacade.fetchBatteryRequests();
      final unsyncedBatteryRequests = allBatteryRequests
          .where((battery) => battery.synced == false)
          .toList();

      if (unsyncedBatteryRequests.isEmpty) {
        // get latest battery requests from remote
        final latestBatteryRequests = await _batteryRequestFacade
            .getBatteryRequests();
        final requests = latestBatteryRequests
            .where(
              (request) => request.swapper!.id! == userId,
            )
            .toList();

        // merge to remote battery requests to local battery request
        await _localDBFacade.batchUpdateBatteryRequest(requests);
        return;
      }

      emit(state.copyWith(syncBatteryRequestsStatus: AppStatus.submitting));

      // upload unsynced battery requess to cloud
      for (final batteryRequest in unsyncedBatteryRequests) {
        await _batteryRequestFacade.createBatteryRequest(
          swapperId: batteryRequest.swapper!.id!,
          numberOfBatteries: batteryRequest.numberOfBatteries!,
          destination: batteryRequest.destination!.id!,
        );
      }

      // get latest battery requests from remote
      final latestBatteryRequests = await _batteryRequestFacade
          .getBatteryRequests();
      final requests = latestBatteryRequests
          .where(
            (request) => request.swapper!.id! == userId,
          )
          .toList();

      // merge to remote battery requests to local battery request
      await _localDBFacade.batchUpdateBatteryRequest(requests);

      // rehydrate state
      await rehydrateState(userId);

      emit(state.copyWith(syncBatteryRequestsStatus: AppStatus.success));
    } catch (e) {
      emit(state.copyWith(syncBatteryRequestsStatus: AppStatus.failure));
      log(e.toString());
    }
  }

  Future<void> rehydrateState(int userId) async {
    await getBatteryRequests(userId);
  }
}
