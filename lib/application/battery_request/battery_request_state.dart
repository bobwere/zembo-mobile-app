part of 'battery_request_cubit.dart';

@freezed
abstract class BatteryRequestState with _$BatteryRequestState {
  factory BatteryRequestState({
    AppStatus? batteryRequestStatus,
    String? batteryRequestError,

    List<BatteryRequest>? batteryRequests,
    AppStatus? fetchBatteryRequestsStatus,
    String? fetchBatteryRequestError,

    AppStatus? syncBatteryRequestsStatus,

    List<BatteryRequest>? riderBatteryRequests,
    AppStatus? fetchRiderBatteryRequestsStatus,
    String? fetchRiderBatteryRequestsError,

    AppStatus? syncRiderBatteryRequestsStatus,
    int? syncRiderBatteryRequestsStatusID,
    String? syncRiderBatteryRequestsError,
  }) = _BatteryRequestState;

  factory BatteryRequestState.initial() => BatteryRequestState(
    batteryRequests: [],
  );
}
