import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zembo_agent_app/domain/location/app_location.dart';
import 'package:zembo_agent_app/domain/user/user.dart';

part 'battery_request.freezed.dart';
part 'battery_request.g.dart';

@freezed
abstract class BatteryRequest with _$BatteryRequest {
  @JsonSerializable(explicitToJson: true)
  factory BatteryRequest({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'swapper') User? swapper,
    @JsonKey(name: 'dispatch_officer') User? dispatchOfficer,
    @JsonKey(name: 'rider') User? rider,
    @JsonKey(name: 'number_of_batteries') int? numberOfBatteries,
    @JsonKey(name: 'pickup_time') String? pickupTime,
    @JsonKey(name: 'delivery_time') String? deliveryTime,
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'comment') String? comment,
    @JsonKey(name: 'destination') AppLocation? destination,
    @JsonKey(name: 'synced') bool? synced,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _BatteryRequest;

  factory BatteryRequest.fromJson(Map<String, dynamic> json) =>
      _$BatteryRequestFromJson(json);

  factory BatteryRequest.initial() => BatteryRequest();
}
