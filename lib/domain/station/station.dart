import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zembo_agent_app/domain/country/country.dart';
import 'package:zembo_agent_app/domain/location/app_location.dart';

part 'station.freezed.dart';
part 'station.g.dart';

@freezed
abstract class Station with _$Station {
  factory Station({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'country') Country? country,
    @JsonKey(name: 'location') AppLocation? location,
  }) = _Station;

  factory Station.fromJson(Map<String, dynamic> json) =>
      _$StationFromJson(json);

  factory Station.initial() => Station();
}
