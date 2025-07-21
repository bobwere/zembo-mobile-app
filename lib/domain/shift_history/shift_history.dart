import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zembo_agent_app/domain/location/app_location.dart';
import 'package:zembo_agent_app/domain/shift/shift.dart';
import 'package:zembo_agent_app/domain/user/user.dart';
part 'shift_history.freezed.dart';
part 'shift_history.g.dart';

@freezed
abstract class ShiftHistory with _$ShiftHistory {
  factory ShiftHistory({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'user') User? user,
    @JsonKey(name: 'shift') Shift? shift,
    @JsonKey(name: 'start_time') String? startTime,
    @JsonKey(name: 'start_location') AppLocation? startLocation,
    @JsonKey(name: 'start_photo_url') String? startPhotoUrl,
    @JsonKey(name: 'end_time') String? endTime,
    @JsonKey(name: 'end_location') AppLocation? endLocation,
    @JsonKey(name: 'end_photo_url') String? endPhotoUrl,
    @JsonKey(name: 'created_at') String? createdAt,
  }) = _ShiftHistory;

  factory ShiftHistory.fromJson(Map<String, dynamic> json) =>
      _$ShiftHistoryFromJson(json);

  factory ShiftHistory.initial() => ShiftHistory();
}
