// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  id: (json['id'] as num?)?.toInt(),
  username: json['username'] as String?,
  country: json['country'] == null
      ? null
      : Country.fromJson(json['country'] as Map<String, dynamic>),
  deviceToken: json['device_token'] as String?,
  role: json['role'] as String?,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
  station: json['station'] == null
      ? null
      : Station.fromJson(json['station'] as Map<String, dynamic>),
  shift: json['shift'] == null
      ? null
      : Shift.fromJson(json['shift'] as Map<String, dynamic>),
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'id': instance.id,
  'username': instance.username,
  'country': instance.country,
  'device_token': instance.deviceToken,
  'role': instance.role,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'station': instance.station,
  'shift': instance.shift,
};
