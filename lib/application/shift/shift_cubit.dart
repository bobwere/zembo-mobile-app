import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:jiffy/jiffy.dart';
import 'package:zembo_agent_app/application/shift/i_shift_facade.dart';
import 'package:zembo_agent_app/core/constants/enum.dart';
import 'package:zembo_agent_app/core/utils/core_util.dart';
import 'package:zembo_agent_app/domain/shift/shift.dart';
import 'package:zembo_agent_app/domain/shift_history/shift_history.dart';
import 'package:zembo_agent_app/domain/station/station.dart';

part 'shift_cubit.freezed.dart';
part 'shift_state.dart';

@injectable
class ShiftCubit extends Cubit<ShiftState> {
  ShiftCubit(this._shiftFacade) : super(ShiftState.initial());

  final IShiftFacade _shiftFacade;

  void updateShiftMessagingAnStatus() {
    if (state.currentShift == null) return;

    final shiftStartTime = getCurrentShiftTime(state.currentShift!.startTime!);
    final shiftEndTime = getCurrentShiftTime(state.currentShift!.endTime!);

    final hasActiveShift = state.currentShift != null;

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
                "You're all set! Start your shift starts at ${shiftStartTime.format(pattern: 'h:mmA')}.",
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
          shiftMessaging: "That's a wrap—your shift is over!",
        ),
      );
      return;
    }
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
      final shift = await _shiftFacade.fetchActiveShift(userId: userId);
      if (shift == null) {
        emit(state.copyWith.call(hasActiveShift: false));
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
    required int userId,
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

      await _shiftFacade.startShift(
        userId: userId,
        startTime: startTime,
        startLocationLng: startLocationLng,
        startLocationLat: startLocationLat,
        startPhotoUrl: startPhotoUrl,
      );

      await fetchActiveShift(userId);

      emit(
        state.copyWith.call(
          startShiftStatus: AppStatus.success,
        ),
      );

      await fetchCurrentDaysShiftHistory();
      await fetchAllShiftHistory();
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

      await _shiftFacade.endShift(
        id: id,
        endTime: endTime,
        endLocationLng: endLocationLng,
        endLocationLat: endLocationLat,
        endPhotoUrl: endPhotoUrl,
      );

      await fetchActiveShift(userId);

      emit(
        state.copyWith.call(
          endShiftStatus: AppStatus.success,
        ),
      );

      await fetchCurrentDaysShiftHistory();
      await fetchAllShiftHistory();
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

      final shiftHistory = await _shiftFacade.fetchCurrentDaysShiftHistory();
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

  Future<void> fetchAllShiftHistory() async {
    try {
      emit(
        state.copyWith.call(
          fetchAllShiftHistoryStatus: AppStatus.submitting,
        ),
      );

      final shiftHistory = await _shiftFacade.fetchAllShiftHistory();
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
}
