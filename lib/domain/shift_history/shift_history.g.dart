// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ShiftHistory _$ShiftHistoryFromJson(Map<String, dynamic> json) =>
    _ShiftHistory(
      id: (json['id'] as num?)?.toInt(),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      shift: json['shift'] == null
          ? null
          : Shift.fromJson(json['shift'] as Map<String, dynamic>),
      startTime: json['start_time'] as String?,
      startLocation: json['start_location'] == null
          ? null
          : AppLocation.fromJson(
              json['start_location'] as Map<String, dynamic>,
            ),
      startPhotoUrl: json['start_photo_url'] as String?,
      endTime: json['end_time'] as String?,
      endLocation: json['end_location'] == null
          ? null
          : AppLocation.fromJson(json['end_location'] as Map<String, dynamic>),
      endPhotoUrl: json['end_photo_url'] as String?,
      createdAt: json['created_at'] as String?,
      synced: json['synced'] as bool?,
    );

Map<String, dynamic> _$ShiftHistoryToJson(_ShiftHistory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user?.toJson(),
      'shift': instance.shift?.toJson(),
      'start_time': instance.startTime,
      'start_location': instance.startLocation?.toJson(),
      'start_photo_url': instance.startPhotoUrl,
      'end_time': instance.endTime,
      'end_location': instance.endLocation?.toJson(),
      'end_photo_url': instance.endPhotoUrl,
      'created_at': instance.createdAt,
      'synced': instance.synced,
    };
