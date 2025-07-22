part of 'shift_cubit.dart';

@freezed
abstract class ShiftState with _$ShiftState {
  factory ShiftState({
    // current station
    Station? currentStation,
    // current Shift
    Shift? currentShift,

    // current shift
    ShiftHistory? activeShift,

    // current days shift history
    List<ShiftHistory>? currentDaysShiftHistory,
    AppStatus? fetchCurrentDaysShiftHistoryStatus,
    String? fetchDaysShiftHistoryError,

    // all shift history
    List<ShiftHistory>? allShiftHistory,
    AppStatus? fetchAllShiftHistoryStatus,
    String? fetchAllShiftHistoryError,

    // has active shift
    bool? hasActiveShift,
    AppStatus? fetchHasActiveShiftStatus,
    String? fetchHasActiveShiftError,

    // start shift
    AppStatus? startShiftStatus,
    String? startShiftError,

    // end shift
    AppStatus? endShiftStatus,
    String? endShiftError,

    // shift messaging
    bool? showStartShiftButton,
    bool? showEndShiftButton,
    String? shiftMessaging,
  }) = _ShiftState;

  factory ShiftState.initial() => ShiftState(
    currentDaysShiftHistory: [],
    allShiftHistory: [],
    showEndShiftButton: false,
    showStartShiftButton: false,
    shiftMessaging: '',
  );
}
