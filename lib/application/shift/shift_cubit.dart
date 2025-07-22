import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zembo_agent_app/application/shift/i_shift_facade.dart';
import 'package:zembo_agent_app/core/constants/enum.dart';
import 'package:zembo_agent_app/domain/shift/shift.dart';
import 'package:zembo_agent_app/domain/shift_history/shift_history.dart';
import 'package:zembo_agent_app/domain/station/station.dart';

part 'shift_cubit.freezed.dart';
part 'shift_state.dart';

@injectable
class ShiftCubit extends Cubit<ShiftState> {
  ShiftCubit(this._shiftFacade) : super(ShiftState.initial());

  final IShiftFacade _shiftFacade;

  void updateShiftAndStation(Shift shift, Station station) {
    emit(
      state.copyWith.call(
        currentShift: shift,
        currentStation: station,
      ),
    );
  }

  Future<void> fetchActiveShift(int userId) async {
    try {
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
    } catch (e) {
      emit(
        state.copyWith.call(),
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
