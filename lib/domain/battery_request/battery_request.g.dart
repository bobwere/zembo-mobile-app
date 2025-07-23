// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'battery_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BatteryRequest _$BatteryRequestFromJson(Map<String, dynamic> json) =>
    _BatteryRequest(
      id: (json['id'] as num?)?.toInt(),
      swapper: json['swapper'] == null
          ? null
          : User.fromJson(json['swapper'] as Map<String, dynamic>),
      dispatchOfficer: json['dispatch_officer'] == null
          ? null
          : User.fromJson(json['dispatch_officer'] as Map<String, dynamic>),
      rider: json['rider'] == null
          ? null
          : User.fromJson(json['rider'] as Map<String, dynamic>),
      numberOfBatteries: (json['number_of_batteries'] as num?)?.toInt(),
      pickupTime: json['pickup_time'] as String?,
      deliveryTime: json['delivery_time'] as String?,
      status: json['status'] as String?,
      comment: json['comment'] as String?,
      destination: json['destination'] == null
          ? null
          : AppLocation.fromJson(json['destination'] as Map<String, dynamic>),
      synced: json['synced'] as bool?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$BatteryRequestToJson(_BatteryRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'swapper': instance.swapper,
      'dispatch_officer': instance.dispatchOfficer,
      'rider': instance.rider,
      'number_of_batteries': instance.numberOfBatteries,
      'pickup_time': instance.pickupTime,
      'delivery_time': instance.deliveryTime,
      'status': instance.status,
      'comment': instance.comment,
      'destination': instance.destination,
      'synced': instance.synced,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
