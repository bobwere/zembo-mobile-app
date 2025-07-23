import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloudinary/cloudinary.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:jiffy/jiffy.dart';
import 'package:simple_connection_checker/simple_connection_checker.dart';
import 'package:zembo_agent_app/application/local_db/i_localdb_facade.dart';
import 'package:zembo_agent_app/application/shift/i_shift_facade.dart';
import 'package:zembo_agent_app/core/constants/enum.dart';
import 'package:zembo_agent_app/core/utils/core_util.dart';
import 'package:zembo_agent_app/domain/location/app_location.dart';
import 'package:zembo_agent_app/domain/shift/shift.dart';
import 'package:zembo_agent_app/domain/shift_history/shift_history.dart';
import 'package:zembo_agent_app/domain/station/station.dart';
import 'package:zembo_agent_app/domain/user/user.dart';

part 'shift_cubit.freezed.dart';
part 'shift_state.dart';

@injectable
class ShiftCubit extends Cubit<ShiftState> {
  ShiftCubit(this._shiftFacade, this._localDBFacade)
    : super(ShiftState.initial());

  final IShiftFacade _shiftFacade;
  final ILocalDBFacade _localDBFacade;

  void updateShiftMessagingAnStatus() {
    if (state.currentShift == null) return;

    final shiftStartTime = getCurrentShiftTime(
      Jiffy.parse(
        state.currentShift!.startTime!,
        pattern: 'HH:mm:ssZ',
      ).toString(),
    );
    final shiftEndTime = getCurrentShiftTime(
      Jiffy.parse(
        state.currentShift!.endTime!,
        pattern: 'HH:mm:ssZ',
      ).toString(),
    );

    final hasActiveShift = state.activeShift != null;

    // show start shift button
    final isNotPastShiftTime = Jiffy.now().isBefore(shiftEndTime);
    if (isNotPastShiftTime && !hasActiveShift) {
      emit(
        state.copyWith.call(
          showStartShiftButton: true,
          showEndShiftButton: false,
        ),
      );

      if (state.currentDaysShiftHistory!.isNotEmpty) {
        emit(
          state.copyWith.call(
            shiftMessaging: "You're on the clock!. Continue with your shift.",
          ),
        );
        return;
      }

      final shiftHasNotStarted = Jiffy.now().isBefore(shiftStartTime);
      if (shiftHasNotStarted) {
        emit(
          state.copyWith.call(
            shiftMessaging:
                "You're all set! Start your shift starts at ${shiftStartTime.format(pattern: 'h:mm a')}.",
          ),
        );
        return;
      }

      if (!shiftHasNotStarted) {
        emit(
          state.copyWith.call(
            shiftMessaging: "Your shift is underway let's go!",
          ),
        );
        return;
      }
    }

    // show end shift button
    if (hasActiveShift) {
      emit(
        state.copyWith.call(
          showStartShiftButton: false,
          showEndShiftButton: true,
          shiftMessaging: 'Your shift is in progress.',
        ),
      );
      return;
    }

    // show no shift button
    final isPastShiftTime = Jiffy.now().isAfter(shiftEndTime);
    if (isPastShiftTime && !hasActiveShift) {
      // show no shift button
      emit(
        state.copyWith.call(
          showStartShiftButton: false,
          showEndShiftButton: false,
          shiftMessaging: "That's a wrap—your shift is over! See tomorrow",
        ),
      );
      return;
    }
  }

  bool hasCompletedAtleastOneShift() {
    final hasActiveShift = state.activeShift != null;

    if (state.currentDaysShiftHistory!.length > 1) {
      return true;
    }
    final hasAShiftUnderWay = state.currentDaysShiftHistory!.isNotEmpty;

    if (!hasActiveShift && hasAShiftUnderWay) {
      return true;
    }
    return false;
  }

  void updateShiftAndStation(Shift? shift, Station? station) {
    emit(
      state.copyWith.call(
        currentShift: shift,
        currentStation: station,
      ),
    );
    updateShiftMessagingAnStatus();
  }

  Future<void> fetchActiveShift(int userId) async {
    try {
      emit(
        state.copyWith.call(
          fetchHasActiveShiftStatus: AppStatus.submitting,
        ),
      );

      final isConnected = await SimpleConnectionChecker.isConnectedToInternet();
      final shift = isConnected
          ? await _shiftFacade.fetchActiveShift(userId: userId)
          : await _localDBFacade.fetchActiveShift(userId: userId);

      if (shift == null) {
        emit(state.copyWith.call(hasActiveShift: false, activeShift: null));
      } else {
        emit(
          state.copyWith.call(
            hasActiveShift: true,
            activeShift: shift,
          ),
        );
      }
      emit(
        state.copyWith.call(
          fetchHasActiveShiftStatus: AppStatus.success,
        ),
      );
      updateShiftMessagingAnStatus();
    } catch (e) {
      emit(
        state.copyWith.call(
          fetchHasActiveShiftStatus: AppStatus.failure,
        ),
      );
    }
  }

  Future<void> startShift({
    required User user,
    required String startTime,
    required String startLocationLng,
    required String startLocationLat,
    required String startPhotoUrl,
  }) async {
    try {
      emit(
        state.copyWith.call(
          startShiftStatus: AppStatus.submitting,
        ),
      );

      final isConnected = await SimpleConnectionChecker.isConnectedToInternet();

      if (isConnected) {
        final photoUrl = await uploadFileToCloud(startPhotoUrl);

        await _shiftFacade.startShift(
          userId: user.id!,
          startTime: startTime,
          startLocationLng: startLocationLng,
          startLocationLat: startLocationLat,
          startPhotoUrl: photoUrl,
        );
      } else {
        await _localDBFacade.createShiftHistory(
          ShiftHistory.initial().copyWith.call(
            id: DateTime.now().millisecondsSinceEpoch,
            user: user,
            synced: false,
            startTime: startTime,
            startLocation: AppLocation.initial().copyWith.call(
              latitude: startLocationLat,
              longitude: startLocationLng,
            ),
            startPhotoUrl: startPhotoUrl,
          ),
        );
      }

      await fetchActiveShift(user.id!);

      emit(
        state.copyWith.call(
          startShiftStatus: AppStatus.success,
        ),
      );

      await fetchCurrentDaysShiftHistory();
      await fetchAllShiftHistory(user.id!);
      updateShiftMessagingAnStatus();
    } on DioException catch (e) {
      emit(
        state.copyWith.call(
          startShiftError: e.response?.data['error']['message'] as String?,
          startShiftStatus: AppStatus.failure,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith.call(
          startShiftError: 'An error occurred',
          startShiftStatus: AppStatus.failure,
        ),
      );
    }
  }

  Future<void> syncLocalToRemoteShiftHistory(int userId) async {
    try {
      final isConnected = await SimpleConnectionChecker.isConnectedToInternet();

      if (!isConnected) {
        return;
      }

      // get unsynced shift history
      final allShiftHistory = await _localDBFacade.fetchAllShiftHistory();
      final unsyncedShiftHistory = allShiftHistory
          .where((shiftHistory) => shiftHistory.synced == false)
          .toList();

      if (unsyncedShiftHistory.isEmpty) {
        // get latest battery requests from remote
        final latestShiftHistory = await _shiftFacade.fetchAllShiftHistory();

        // merge to remote battery requests to local battery request
        await _localDBFacade.batchUpdateLocalShiftHistory(latestShiftHistory);
        return;
      }

      emit(
        state.copyWith(
          syncLocalToRemoteShiftHistoryStatus: AppStatus.submitting,
        ),
      );

      // upload unsynced shift history to cloud
      for (final shiftHistory in unsyncedShiftHistory) {
        if (shiftHistory.id! < 100000) {
          // started and not synced
          final photoUrl = shiftHistory.endPhotoUrl != null
              ? await uploadFileToCloud(shiftHistory.endPhotoUrl!)
              : null;

          await _shiftFacade.endShift(
            id: shiftHistory.id!,
            endTime: shiftHistory.endTime,
            endLocationLng: shiftHistory.endLocation?.longitude,
            endLocationLat: shiftHistory.endLocation?.latitude,
            endPhotoUrl: photoUrl,
          );
          continue;
        }

        // not started and not synced
        final startPhotoUrl = await uploadFileToCloud(
          shiftHistory.startPhotoUrl!,
        );
        final savedShift = await _shiftFacade.startShift(
          userId: userId,
          startTime: shiftHistory.startTime!,
          startLocationLng: shiftHistory.startLocation?.longitude ?? '',
          startLocationLat: shiftHistory.startLocation?.latitude ?? '',
          startPhotoUrl: startPhotoUrl,
        );

        final endPhotoUrl = shiftHistory.endPhotoUrl != null
            ? await uploadFileToCloud(shiftHistory.endPhotoUrl!)
            : null;

        await _shiftFacade.endShift(
          id: savedShift.id!,
          endTime: shiftHistory.endTime,
          endLocationLng: shiftHistory.endLocation?.longitude,
          endLocationLat: shiftHistory.endLocation?.latitude,
          endPhotoUrl: endPhotoUrl,
        );
      }

      // get latest shift history from remote
      final latestShiftHistory = await _shiftFacade.fetchAllShiftHistory();

      // merge to remote shift history to local shift history
      await _localDBFacade.batchUpdateLocalShiftHistory(latestShiftHistory);

      // rehydrate state
      await rehydrateState(userId);

      emit(
        state.copyWith(
          syncLocalToRemoteShiftHistoryStatus: AppStatus.success,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          syncLocalToRemoteShiftHistoryStatus: AppStatus.failure,
        ),
      );
      //
    }
  }

  Future<void> rehydrateState(int userId) async {
    await fetchActiveShift(userId);
    await fetchCurrentDaysShiftHistory();
    await fetchAllShiftHistory(userId);
    updateShiftMessagingAnStatus();
  }

  Future<String> uploadFileToCloud(String path) async {
    try {
      final cloudinary = Cloudinary.signedConfig(
        apiKey: dotenv.get('apiKey'),
        apiSecret: dotenv.get('apiSecret'),
        cloudName: dotenv.get('cloudName'),
      );

      final response = await cloudinary.upload(
        file: path,
        fileBytes: File(path).readAsBytesSync(),
        resourceType: CloudinaryResourceType.image,
      );

      return response.secureUrl ?? '';
    } catch (e) {
      return '';
    }
  }

  Future<void> endShift({
    required int id,
    required int userId,
    String? endTime,
    String? endLocationLng,
    String? endLocationLat,
    String? endPhotoUrl,
  }) async {
    try {
      emit(
        state.copyWith.call(
          endShiftStatus: AppStatus.submitting,
        ),
      );

      final isConnected = await SimpleConnectionChecker.isConnectedToInternet();

      if (isConnected) {
        final photoUrl = await uploadFileToCloud(endPhotoUrl!);

        await _shiftFacade.endShift(
          id: id,
          endTime: endTime,
          endLocationLng: endLocationLng,
          endLocationLat: endLocationLat,
          endPhotoUrl: photoUrl,
        );
      } else {
        final shiftHistories = await _localDBFacade.fetchAllShiftHistory();

        final shiftHistory = shiftHistories.where((s) => s.id == id).first;

        await _localDBFacade.updateShiftHistory(
          id,
          shiftHistory.copyWith.call(
            synced: false,
            endTime: endTime,
            endLocation: AppLocation.initial().copyWith.call(
              latitude: endLocationLat,
              longitude: endLocationLng,
            ),
            endPhotoUrl: endPhotoUrl,
          ),
        );
      }

      await fetchActiveShift(userId);

      emit(
        state.copyWith.call(
          endShiftStatus: AppStatus.success,
        ),
      );

      await fetchCurrentDaysShiftHistory();
      await fetchAllShiftHistory(userId);
      updateShiftMessagingAnStatus();
    } on DioException catch (e) {
      emit(
        state.copyWith.call(
          endShiftError: e.response?.data['error']['message'] as String?,
          endShiftStatus: AppStatus.failure,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith.call(
          endShiftError: 'An error occurred',
          endShiftStatus: AppStatus.failure,
        ),
      );
    }
  }

  Future<void> fetchCurrentDaysShiftHistory() async {
    try {
      emit(
        state.copyWith.call(
          fetchCurrentDaysShiftHistoryStatus: AppStatus.submitting,
        ),
      );

      final isConnected = await SimpleConnectionChecker.isConnectedToInternet();
      final shiftHistory = isConnected
          ? await _shiftFacade.fetchCurrentDaysShiftHistory()
          : await _localDBFacade.fetchCurrentDaysShiftHistory();

      emit(
        state.copyWith.call(
          fetchCurrentDaysShiftHistoryStatus: AppStatus.success,
          currentDaysShiftHistory: shiftHistory,
        ),
      );
      updateShiftMessagingAnStatus();
    } on DioException catch (e) {
      emit(
        state.copyWith.call(
          fetchAllShiftHistoryError:
              e.response?.data['error']['message'] as String?,
          fetchCurrentDaysShiftHistoryStatus: AppStatus.failure,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith.call(
          fetchAllShiftHistoryError: 'An error occurred',
          fetchCurrentDaysShiftHistoryStatus: AppStatus.failure,
        ),
      );
    }
  }

  Future<void> fetchAllShiftHistory(int userId) async {
    try {
      emit(
        state.copyWith.call(
          fetchAllShiftHistoryStatus: AppStatus.submitting,
        ),
      );

      final isConnected = await SimpleConnectionChecker.isConnectedToInternet();

      var shiftHistory = <ShiftHistory>[];
      if (isConnected) {
        shiftHistory = await _shiftFacade.fetchAllShiftHistory();
        unawaited(syncLocalToRemoteShiftHistory(userId));
      } else {
        shiftHistory = await _localDBFacade.fetchAllShiftHistory();
      }

      emit(
        state.copyWith.call(
          fetchAllShiftHistoryStatus: AppStatus.success,
          allShiftHistory: shiftHistory,
        ),
      );
      updateShiftMessagingAnStatus();
    } on DioException catch (e) {
      emit(
        state.copyWith.call(
          fetchAllShiftHistoryError:
              e.response?.data['error']['message'] as String?,
          fetchAllShiftHistoryStatus: AppStatus.failure,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith.call(
          fetchAllShiftHistoryError: 'An error occurred',
          fetchAllShiftHistoryStatus: AppStatus.failure,
        ),
      );
    }
  }

  Future<bool> isWithinGeofenceRadiusCheck(Position currentPosition) async {
    try {
      emit(
        state.copyWith.call(
          geoRadiusStatus: AppStatus.submitting,
        ),
      );

      if (state.currentStation == null) return false;
      if (state.currentStation?.location == null) return false;

      final distanceInMeters = Geolocator.distanceBetween(
        currentPosition.latitude,
        currentPosition.longitude,
        double.parse(state.currentStation!.location!.latitude!),
        double.parse(state.currentStation!.location!.longitude!),
      );

      emit(
        state.copyWith.call(
          geoRadiusStatus: AppStatus.success,
        ),
      );
      if (distanceInMeters <= 50) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      emit(
        state.copyWith.call(
          geoRadiusStatus: AppStatus.failure,
        ),
      );
      return false;
    }
  }

  Future<Map<String, dynamic>> isWithinGeofenceRadius() async {
    try {
      emit(
        state.copyWith.call(
          geoLocationStatus: AppStatus.submitting,
        ),
      );

      final currentPosition = await getCurrentPosition();

      final isWithinGeofenceRadius = await isWithinGeofenceRadiusCheck(
        currentPosition,
      );

      emit(
        state.copyWith.call(
          geoLocationStatus: AppStatus.success,
        ),
      );

      return {
        'isWithinGeofenceRadius': isWithinGeofenceRadius,
        'currentPosition': currentPosition,
      };
    } catch (e) {
      emit(
        state.copyWith.call(
          geoLocationStatus: AppStatus.failure,
        ),
      );
      return {
        'isWithinGeofenceRadius': false,
        'currentPosition': null,
      };
    }
  }

  Future<Position> getCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.

      return Future.error(
        'Oops! It looks like location permissions are disabled. Enable them to unlock full functionality.',
      );
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error(
          'Oops! It looks like location permissions are disabled. Enable them to unlock full functionality.',
        );
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }
}
