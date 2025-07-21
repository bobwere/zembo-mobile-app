// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppLocation _$AppLocationFromJson(Map<String, dynamic> json) => _AppLocation(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  latitude: (json['lat'] as num?)?.toDouble(),
  longitude: (json['lng'] as num?)?.toDouble(),
);

Map<String, dynamic> _$AppLocationToJson(_AppLocation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'lat': instance.latitude,
      'lng': instance.longitude,
    };
