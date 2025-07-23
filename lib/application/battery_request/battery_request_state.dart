part of 'battery_request_cubit.dart';

@freezed
abstract class BatteryRequestState with _$BatteryRequestState {
  factory BatteryRequestState({
    AppStatus? batteryRequestStatus,
    String? batteryRequestError,

    List<BatteryRequest>? batteryRequests,
    AppStatus? fetchBatteryRequestsStatus,
    String? fetchBatteryRequestError,
  }) = _BatteryRequestState;

  factory BatteryRequestState.initial() => BatteryRequestState();
}
