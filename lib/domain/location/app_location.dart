import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_location.freezed.dart';
part 'app_location.g.dart';

@freezed
abstract class AppLocation with _$AppLocation {
  factory AppLocation({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'lat') double? latitude,
    @JsonKey(name: 'lng') double? longitude,
  }) = _AppLocation;

  factory AppLocation.fromJson(Map<String, dynamic> json) =>
      _$AppLocationFromJson(json);

  factory AppLocation.initial() => AppLocation();
}
