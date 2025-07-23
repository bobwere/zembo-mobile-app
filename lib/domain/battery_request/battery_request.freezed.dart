// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'battery_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BatteryRequest {

@JsonKey(name: 'id') int? get id;@JsonKey(name: 'swapper') User? get swapper;@JsonKey(name: 'dispatch_officer') User? get dispatchOfficer;@JsonKey(name: 'rider') User? get rider;@JsonKey(name: 'number_of_batteries') int? get numberOfBatteries;@JsonKey(name: 'pickup_time') String? get pickupTime;@JsonKey(name: 'delivery_time') String? get deliveryTime;@JsonKey(name: 'status') String? get status;@JsonKey(name: 'comment') String? get comment;@JsonKey(name: 'destination') AppLocation? get destination;@JsonKey(name: 'synced') bool? get synced;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'updated_at') String? get updatedAt;
/// Create a copy of BatteryRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BatteryRequestCopyWith<BatteryRequest> get copyWith => _$BatteryRequestCopyWithImpl<BatteryRequest>(this as BatteryRequest, _$identity);

  /// Serializes this BatteryRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BatteryRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.swapper, swapper) || other.swapper == swapper)&&(identical(other.dispatchOfficer, dispatchOfficer) || other.dispatchOfficer == dispatchOfficer)&&(identical(other.rider, rider) || other.rider == rider)&&(identical(other.numberOfBatteries, numberOfBatteries) || other.numberOfBatteries == numberOfBatteries)&&(identical(other.pickupTime, pickupTime) || other.pickupTime == pickupTime)&&(identical(other.deliveryTime, deliveryTime) || other.deliveryTime == deliveryTime)&&(identical(other.status, status) || other.status == status)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.destination, destination) || other.destination == destination)&&(identical(other.synced, synced) || other.synced == synced)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,swapper,dispatchOfficer,rider,numberOfBatteries,pickupTime,deliveryTime,status,comment,destination,synced,createdAt,updatedAt);

@override
String toString() {
  return 'BatteryRequest(id: $id, swapper: $swapper, dispatchOfficer: $dispatchOfficer, rider: $rider, numberOfBatteries: $numberOfBatteries, pickupTime: $pickupTime, deliveryTime: $deliveryTime, status: $status, comment: $comment, destination: $destination, synced: $synced, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $BatteryRequestCopyWith<$Res>  {
  factory $BatteryRequestCopyWith(BatteryRequest value, $Res Function(BatteryRequest) _then) = _$BatteryRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int? id,@JsonKey(name: 'swapper') User? swapper,@JsonKey(name: 'dispatch_officer') User? dispatchOfficer,@JsonKey(name: 'rider') User? rider,@JsonKey(name: 'number_of_batteries') int? numberOfBatteries,@JsonKey(name: 'pickup_time') String? pickupTime,@JsonKey(name: 'delivery_time') String? deliveryTime,@JsonKey(name: 'status') String? status,@JsonKey(name: 'comment') String? comment,@JsonKey(name: 'destination') AppLocation? destination,@JsonKey(name: 'synced') bool? synced,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});


$UserCopyWith<$Res>? get swapper;$UserCopyWith<$Res>? get dispatchOfficer;$UserCopyWith<$Res>? get rider;$AppLocationCopyWith<$Res>? get destination;

}
/// @nodoc
class _$BatteryRequestCopyWithImpl<$Res>
    implements $BatteryRequestCopyWith<$Res> {
  _$BatteryRequestCopyWithImpl(this._self, this._then);

  final BatteryRequest _self;
  final $Res Function(BatteryRequest) _then;

/// Create a copy of BatteryRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? swapper = freezed,Object? dispatchOfficer = freezed,Object? rider = freezed,Object? numberOfBatteries = freezed,Object? pickupTime = freezed,Object? deliveryTime = freezed,Object? status = freezed,Object? comment = freezed,Object? destination = freezed,Object? synced = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,swapper: freezed == swapper ? _self.swapper : swapper // ignore: cast_nullable_to_non_nullable
as User?,dispatchOfficer: freezed == dispatchOfficer ? _self.dispatchOfficer : dispatchOfficer // ignore: cast_nullable_to_non_nullable
as User?,rider: freezed == rider ? _self.rider : rider // ignore: cast_nullable_to_non_nullable
as User?,numberOfBatteries: freezed == numberOfBatteries ? _self.numberOfBatteries : numberOfBatteries // ignore: cast_nullable_to_non_nullable
as int?,pickupTime: freezed == pickupTime ? _self.pickupTime : pickupTime // ignore: cast_nullable_to_non_nullable
as String?,deliveryTime: freezed == deliveryTime ? _self.deliveryTime : deliveryTime // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,destination: freezed == destination ? _self.destination : destination // ignore: cast_nullable_to_non_nullable
as AppLocation?,synced: freezed == synced ? _self.synced : synced // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of BatteryRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res>? get swapper {
    if (_self.swapper == null) {
    return null;
  }

  return $UserCopyWith<$Res>(_self.swapper!, (value) {
    return _then(_self.copyWith(swapper: value));
  });
}/// Create a copy of BatteryRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res>? get dispatchOfficer {
    if (_self.dispatchOfficer == null) {
    return null;
  }

  return $UserCopyWith<$Res>(_self.dispatchOfficer!, (value) {
    return _then(_self.copyWith(dispatchOfficer: value));
  });
}/// Create a copy of BatteryRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res>? get rider {
    if (_self.rider == null) {
    return null;
  }

  return $UserCopyWith<$Res>(_self.rider!, (value) {
    return _then(_self.copyWith(rider: value));
  });
}/// Create a copy of BatteryRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppLocationCopyWith<$Res>? get destination {
    if (_self.destination == null) {
    return null;
  }

  return $AppLocationCopyWith<$Res>(_self.destination!, (value) {
    return _then(_self.copyWith(destination: value));
  });
}
}


/// Adds pattern-matching-related methods to [BatteryRequest].
extension BatteryRequestPatterns on BatteryRequest {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BatteryRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BatteryRequest() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BatteryRequest value)  $default,){
final _that = this;
switch (_that) {
case _BatteryRequest():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BatteryRequest value)?  $default,){
final _that = this;
switch (_that) {
case _BatteryRequest() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'swapper')  User? swapper, @JsonKey(name: 'dispatch_officer')  User? dispatchOfficer, @JsonKey(name: 'rider')  User? rider, @JsonKey(name: 'number_of_batteries')  int? numberOfBatteries, @JsonKey(name: 'pickup_time')  String? pickupTime, @JsonKey(name: 'delivery_time')  String? deliveryTime, @JsonKey(name: 'status')  String? status, @JsonKey(name: 'comment')  String? comment, @JsonKey(name: 'destination')  AppLocation? destination, @JsonKey(name: 'synced')  bool? synced, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BatteryRequest() when $default != null:
return $default(_that.id,_that.swapper,_that.dispatchOfficer,_that.rider,_that.numberOfBatteries,_that.pickupTime,_that.deliveryTime,_that.status,_that.comment,_that.destination,_that.synced,_that.createdAt,_that.updatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'swapper')  User? swapper, @JsonKey(name: 'dispatch_officer')  User? dispatchOfficer, @JsonKey(name: 'rider')  User? rider, @JsonKey(name: 'number_of_batteries')  int? numberOfBatteries, @JsonKey(name: 'pickup_time')  String? pickupTime, @JsonKey(name: 'delivery_time')  String? deliveryTime, @JsonKey(name: 'status')  String? status, @JsonKey(name: 'comment')  String? comment, @JsonKey(name: 'destination')  AppLocation? destination, @JsonKey(name: 'synced')  bool? synced, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _BatteryRequest():
return $default(_that.id,_that.swapper,_that.dispatchOfficer,_that.rider,_that.numberOfBatteries,_that.pickupTime,_that.deliveryTime,_that.status,_that.comment,_that.destination,_that.synced,_that.createdAt,_that.updatedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'swapper')  User? swapper, @JsonKey(name: 'dispatch_officer')  User? dispatchOfficer, @JsonKey(name: 'rider')  User? rider, @JsonKey(name: 'number_of_batteries')  int? numberOfBatteries, @JsonKey(name: 'pickup_time')  String? pickupTime, @JsonKey(name: 'delivery_time')  String? deliveryTime, @JsonKey(name: 'status')  String? status, @JsonKey(name: 'comment')  String? comment, @JsonKey(name: 'destination')  AppLocation? destination, @JsonKey(name: 'synced')  bool? synced, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _BatteryRequest() when $default != null:
return $default(_that.id,_that.swapper,_that.dispatchOfficer,_that.rider,_that.numberOfBatteries,_that.pickupTime,_that.deliveryTime,_that.status,_that.comment,_that.destination,_that.synced,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BatteryRequest implements BatteryRequest {
   _BatteryRequest({@JsonKey(name: 'id') this.id, @JsonKey(name: 'swapper') this.swapper, @JsonKey(name: 'dispatch_officer') this.dispatchOfficer, @JsonKey(name: 'rider') this.rider, @JsonKey(name: 'number_of_batteries') this.numberOfBatteries, @JsonKey(name: 'pickup_time') this.pickupTime, @JsonKey(name: 'delivery_time') this.deliveryTime, @JsonKey(name: 'status') this.status, @JsonKey(name: 'comment') this.comment, @JsonKey(name: 'destination') this.destination, @JsonKey(name: 'synced') this.synced, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt});
  factory _BatteryRequest.fromJson(Map<String, dynamic> json) => _$BatteryRequestFromJson(json);

@override@JsonKey(name: 'id') final  int? id;
@override@JsonKey(name: 'swapper') final  User? swapper;
@override@JsonKey(name: 'dispatch_officer') final  User? dispatchOfficer;
@override@JsonKey(name: 'rider') final  User? rider;
@override@JsonKey(name: 'number_of_batteries') final  int? numberOfBatteries;
@override@JsonKey(name: 'pickup_time') final  String? pickupTime;
@override@JsonKey(name: 'delivery_time') final  String? deliveryTime;
@override@JsonKey(name: 'status') final  String? status;
@override@JsonKey(name: 'comment') final  String? comment;
@override@JsonKey(name: 'destination') final  AppLocation? destination;
@override@JsonKey(name: 'synced') final  bool? synced;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'updated_at') final  String? updatedAt;

/// Create a copy of BatteryRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BatteryRequestCopyWith<_BatteryRequest> get copyWith => __$BatteryRequestCopyWithImpl<_BatteryRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BatteryRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BatteryRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.swapper, swapper) || other.swapper == swapper)&&(identical(other.dispatchOfficer, dispatchOfficer) || other.dispatchOfficer == dispatchOfficer)&&(identical(other.rider, rider) || other.rider == rider)&&(identical(other.numberOfBatteries, numberOfBatteries) || other.numberOfBatteries == numberOfBatteries)&&(identical(other.pickupTime, pickupTime) || other.pickupTime == pickupTime)&&(identical(other.deliveryTime, deliveryTime) || other.deliveryTime == deliveryTime)&&(identical(other.status, status) || other.status == status)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.destination, destination) || other.destination == destination)&&(identical(other.synced, synced) || other.synced == synced)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,swapper,dispatchOfficer,rider,numberOfBatteries,pickupTime,deliveryTime,status,comment,destination,synced,createdAt,updatedAt);

@override
String toString() {
  return 'BatteryRequest(id: $id, swapper: $swapper, dispatchOfficer: $dispatchOfficer, rider: $rider, numberOfBatteries: $numberOfBatteries, pickupTime: $pickupTime, deliveryTime: $deliveryTime, status: $status, comment: $comment, destination: $destination, synced: $synced, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$BatteryRequestCopyWith<$Res> implements $BatteryRequestCopyWith<$Res> {
  factory _$BatteryRequestCopyWith(_BatteryRequest value, $Res Function(_BatteryRequest) _then) = __$BatteryRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int? id,@JsonKey(name: 'swapper') User? swapper,@JsonKey(name: 'dispatch_officer') User? dispatchOfficer,@JsonKey(name: 'rider') User? rider,@JsonKey(name: 'number_of_batteries') int? numberOfBatteries,@JsonKey(name: 'pickup_time') String? pickupTime,@JsonKey(name: 'delivery_time') String? deliveryTime,@JsonKey(name: 'status') String? status,@JsonKey(name: 'comment') String? comment,@JsonKey(name: 'destination') AppLocation? destination,@JsonKey(name: 'synced') bool? synced,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});


@override $UserCopyWith<$Res>? get swapper;@override $UserCopyWith<$Res>? get dispatchOfficer;@override $UserCopyWith<$Res>? get rider;@override $AppLocationCopyWith<$Res>? get destination;

}
/// @nodoc
class __$BatteryRequestCopyWithImpl<$Res>
    implements _$BatteryRequestCopyWith<$Res> {
  __$BatteryRequestCopyWithImpl(this._self, this._then);

  final _BatteryRequest _self;
  final $Res Function(_BatteryRequest) _then;

/// Create a copy of BatteryRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? swapper = freezed,Object? dispatchOfficer = freezed,Object? rider = freezed,Object? numberOfBatteries = freezed,Object? pickupTime = freezed,Object? deliveryTime = freezed,Object? status = freezed,Object? comment = freezed,Object? destination = freezed,Object? synced = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_BatteryRequest(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,swapper: freezed == swapper ? _self.swapper : swapper // ignore: cast_nullable_to_non_nullable
as User?,dispatchOfficer: freezed == dispatchOfficer ? _self.dispatchOfficer : dispatchOfficer // ignore: cast_nullable_to_non_nullable
as User?,rider: freezed == rider ? _self.rider : rider // ignore: cast_nullable_to_non_nullable
as User?,numberOfBatteries: freezed == numberOfBatteries ? _self.numberOfBatteries : numberOfBatteries // ignore: cast_nullable_to_non_nullable
as int?,pickupTime: freezed == pickupTime ? _self.pickupTime : pickupTime // ignore: cast_nullable_to_non_nullable
as String?,deliveryTime: freezed == deliveryTime ? _self.deliveryTime : deliveryTime // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,destination: freezed == destination ? _self.destination : destination // ignore: cast_nullable_to_non_nullable
as AppLocation?,synced: freezed == synced ? _self.synced : synced // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of BatteryRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res>? get swapper {
    if (_self.swapper == null) {
    return null;
  }

  return $UserCopyWith<$Res>(_self.swapper!, (value) {
    return _then(_self.copyWith(swapper: value));
  });
}/// Create a copy of BatteryRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res>? get dispatchOfficer {
    if (_self.dispatchOfficer == null) {
    return null;
  }

  return $UserCopyWith<$Res>(_self.dispatchOfficer!, (value) {
    return _then(_self.copyWith(dispatchOfficer: value));
  });
}/// Create a copy of BatteryRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res>? get rider {
    if (_self.rider == null) {
    return null;
  }

  return $UserCopyWith<$Res>(_self.rider!, (value) {
    return _then(_self.copyWith(rider: value));
  });
}/// Create a copy of BatteryRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppLocationCopyWith<$Res>? get destination {
    if (_self.destination == null) {
    return null;
  }

  return $AppLocationCopyWith<$Res>(_self.destination!, (value) {
    return _then(_self.copyWith(destination: value));
  });
}
}

// dart format on
