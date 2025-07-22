// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shift_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ShiftHistory {

@JsonKey(name: 'id') int? get id;@JsonKey(name: 'user') User? get user;@JsonKey(name: 'shift') Shift? get shift;@JsonKey(name: 'start_time') String? get startTime;@JsonKey(name: 'start_location') AppLocation? get startLocation;@JsonKey(name: 'start_photo_url') String? get startPhotoUrl;@JsonKey(name: 'end_time') String? get endTime;@JsonKey(name: 'end_location') AppLocation? get endLocation;@JsonKey(name: 'end_photo_url') String? get endPhotoUrl;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'synced') bool? get synced;
/// Create a copy of ShiftHistory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShiftHistoryCopyWith<ShiftHistory> get copyWith => _$ShiftHistoryCopyWithImpl<ShiftHistory>(this as ShiftHistory, _$identity);

  /// Serializes this ShiftHistory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShiftHistory&&(identical(other.id, id) || other.id == id)&&(identical(other.user, user) || other.user == user)&&(identical(other.shift, shift) || other.shift == shift)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.startLocation, startLocation) || other.startLocation == startLocation)&&(identical(other.startPhotoUrl, startPhotoUrl) || other.startPhotoUrl == startPhotoUrl)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.endLocation, endLocation) || other.endLocation == endLocation)&&(identical(other.endPhotoUrl, endPhotoUrl) || other.endPhotoUrl == endPhotoUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.synced, synced) || other.synced == synced));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,user,shift,startTime,startLocation,startPhotoUrl,endTime,endLocation,endPhotoUrl,createdAt,synced);

@override
String toString() {
  return 'ShiftHistory(id: $id, user: $user, shift: $shift, startTime: $startTime, startLocation: $startLocation, startPhotoUrl: $startPhotoUrl, endTime: $endTime, endLocation: $endLocation, endPhotoUrl: $endPhotoUrl, createdAt: $createdAt, synced: $synced)';
}


}

/// @nodoc
abstract mixin class $ShiftHistoryCopyWith<$Res>  {
  factory $ShiftHistoryCopyWith(ShiftHistory value, $Res Function(ShiftHistory) _then) = _$ShiftHistoryCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int? id,@JsonKey(name: 'user') User? user,@JsonKey(name: 'shift') Shift? shift,@JsonKey(name: 'start_time') String? startTime,@JsonKey(name: 'start_location') AppLocation? startLocation,@JsonKey(name: 'start_photo_url') String? startPhotoUrl,@JsonKey(name: 'end_time') String? endTime,@JsonKey(name: 'end_location') AppLocation? endLocation,@JsonKey(name: 'end_photo_url') String? endPhotoUrl,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'synced') bool? synced
});


$UserCopyWith<$Res>? get user;$ShiftCopyWith<$Res>? get shift;$AppLocationCopyWith<$Res>? get startLocation;$AppLocationCopyWith<$Res>? get endLocation;

}
/// @nodoc
class _$ShiftHistoryCopyWithImpl<$Res>
    implements $ShiftHistoryCopyWith<$Res> {
  _$ShiftHistoryCopyWithImpl(this._self, this._then);

  final ShiftHistory _self;
  final $Res Function(ShiftHistory) _then;

/// Create a copy of ShiftHistory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? user = freezed,Object? shift = freezed,Object? startTime = freezed,Object? startLocation = freezed,Object? startPhotoUrl = freezed,Object? endTime = freezed,Object? endLocation = freezed,Object? endPhotoUrl = freezed,Object? createdAt = freezed,Object? synced = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User?,shift: freezed == shift ? _self.shift : shift // ignore: cast_nullable_to_non_nullable
as Shift?,startTime: freezed == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String?,startLocation: freezed == startLocation ? _self.startLocation : startLocation // ignore: cast_nullable_to_non_nullable
as AppLocation?,startPhotoUrl: freezed == startPhotoUrl ? _self.startPhotoUrl : startPhotoUrl // ignore: cast_nullable_to_non_nullable
as String?,endTime: freezed == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String?,endLocation: freezed == endLocation ? _self.endLocation : endLocation // ignore: cast_nullable_to_non_nullable
as AppLocation?,endPhotoUrl: freezed == endPhotoUrl ? _self.endPhotoUrl : endPhotoUrl // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,synced: freezed == synced ? _self.synced : synced // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}
/// Create a copy of ShiftHistory
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of ShiftHistory
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ShiftCopyWith<$Res>? get shift {
    if (_self.shift == null) {
    return null;
  }

  return $ShiftCopyWith<$Res>(_self.shift!, (value) {
    return _then(_self.copyWith(shift: value));
  });
}/// Create a copy of ShiftHistory
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppLocationCopyWith<$Res>? get startLocation {
    if (_self.startLocation == null) {
    return null;
  }

  return $AppLocationCopyWith<$Res>(_self.startLocation!, (value) {
    return _then(_self.copyWith(startLocation: value));
  });
}/// Create a copy of ShiftHistory
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppLocationCopyWith<$Res>? get endLocation {
    if (_self.endLocation == null) {
    return null;
  }

  return $AppLocationCopyWith<$Res>(_self.endLocation!, (value) {
    return _then(_self.copyWith(endLocation: value));
  });
}
}


/// Adds pattern-matching-related methods to [ShiftHistory].
extension ShiftHistoryPatterns on ShiftHistory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShiftHistory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShiftHistory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShiftHistory value)  $default,){
final _that = this;
switch (_that) {
case _ShiftHistory():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShiftHistory value)?  $default,){
final _that = this;
switch (_that) {
case _ShiftHistory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'user')  User? user, @JsonKey(name: 'shift')  Shift? shift, @JsonKey(name: 'start_time')  String? startTime, @JsonKey(name: 'start_location')  AppLocation? startLocation, @JsonKey(name: 'start_photo_url')  String? startPhotoUrl, @JsonKey(name: 'end_time')  String? endTime, @JsonKey(name: 'end_location')  AppLocation? endLocation, @JsonKey(name: 'end_photo_url')  String? endPhotoUrl, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'synced')  bool? synced)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShiftHistory() when $default != null:
return $default(_that.id,_that.user,_that.shift,_that.startTime,_that.startLocation,_that.startPhotoUrl,_that.endTime,_that.endLocation,_that.endPhotoUrl,_that.createdAt,_that.synced);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'user')  User? user, @JsonKey(name: 'shift')  Shift? shift, @JsonKey(name: 'start_time')  String? startTime, @JsonKey(name: 'start_location')  AppLocation? startLocation, @JsonKey(name: 'start_photo_url')  String? startPhotoUrl, @JsonKey(name: 'end_time')  String? endTime, @JsonKey(name: 'end_location')  AppLocation? endLocation, @JsonKey(name: 'end_photo_url')  String? endPhotoUrl, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'synced')  bool? synced)  $default,) {final _that = this;
switch (_that) {
case _ShiftHistory():
return $default(_that.id,_that.user,_that.shift,_that.startTime,_that.startLocation,_that.startPhotoUrl,_that.endTime,_that.endLocation,_that.endPhotoUrl,_that.createdAt,_that.synced);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'user')  User? user, @JsonKey(name: 'shift')  Shift? shift, @JsonKey(name: 'start_time')  String? startTime, @JsonKey(name: 'start_location')  AppLocation? startLocation, @JsonKey(name: 'start_photo_url')  String? startPhotoUrl, @JsonKey(name: 'end_time')  String? endTime, @JsonKey(name: 'end_location')  AppLocation? endLocation, @JsonKey(name: 'end_photo_url')  String? endPhotoUrl, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'synced')  bool? synced)?  $default,) {final _that = this;
switch (_that) {
case _ShiftHistory() when $default != null:
return $default(_that.id,_that.user,_that.shift,_that.startTime,_that.startLocation,_that.startPhotoUrl,_that.endTime,_that.endLocation,_that.endPhotoUrl,_that.createdAt,_that.synced);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ShiftHistory implements ShiftHistory {
   _ShiftHistory({@JsonKey(name: 'id') this.id, @JsonKey(name: 'user') this.user, @JsonKey(name: 'shift') this.shift, @JsonKey(name: 'start_time') this.startTime, @JsonKey(name: 'start_location') this.startLocation, @JsonKey(name: 'start_photo_url') this.startPhotoUrl, @JsonKey(name: 'end_time') this.endTime, @JsonKey(name: 'end_location') this.endLocation, @JsonKey(name: 'end_photo_url') this.endPhotoUrl, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'synced') this.synced});
  factory _ShiftHistory.fromJson(Map<String, dynamic> json) => _$ShiftHistoryFromJson(json);

@override@JsonKey(name: 'id') final  int? id;
@override@JsonKey(name: 'user') final  User? user;
@override@JsonKey(name: 'shift') final  Shift? shift;
@override@JsonKey(name: 'start_time') final  String? startTime;
@override@JsonKey(name: 'start_location') final  AppLocation? startLocation;
@override@JsonKey(name: 'start_photo_url') final  String? startPhotoUrl;
@override@JsonKey(name: 'end_time') final  String? endTime;
@override@JsonKey(name: 'end_location') final  AppLocation? endLocation;
@override@JsonKey(name: 'end_photo_url') final  String? endPhotoUrl;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'synced') final  bool? synced;

/// Create a copy of ShiftHistory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShiftHistoryCopyWith<_ShiftHistory> get copyWith => __$ShiftHistoryCopyWithImpl<_ShiftHistory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ShiftHistoryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShiftHistory&&(identical(other.id, id) || other.id == id)&&(identical(other.user, user) || other.user == user)&&(identical(other.shift, shift) || other.shift == shift)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.startLocation, startLocation) || other.startLocation == startLocation)&&(identical(other.startPhotoUrl, startPhotoUrl) || other.startPhotoUrl == startPhotoUrl)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.endLocation, endLocation) || other.endLocation == endLocation)&&(identical(other.endPhotoUrl, endPhotoUrl) || other.endPhotoUrl == endPhotoUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.synced, synced) || other.synced == synced));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,user,shift,startTime,startLocation,startPhotoUrl,endTime,endLocation,endPhotoUrl,createdAt,synced);

@override
String toString() {
  return 'ShiftHistory(id: $id, user: $user, shift: $shift, startTime: $startTime, startLocation: $startLocation, startPhotoUrl: $startPhotoUrl, endTime: $endTime, endLocation: $endLocation, endPhotoUrl: $endPhotoUrl, createdAt: $createdAt, synced: $synced)';
}


}

/// @nodoc
abstract mixin class _$ShiftHistoryCopyWith<$Res> implements $ShiftHistoryCopyWith<$Res> {
  factory _$ShiftHistoryCopyWith(_ShiftHistory value, $Res Function(_ShiftHistory) _then) = __$ShiftHistoryCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int? id,@JsonKey(name: 'user') User? user,@JsonKey(name: 'shift') Shift? shift,@JsonKey(name: 'start_time') String? startTime,@JsonKey(name: 'start_location') AppLocation? startLocation,@JsonKey(name: 'start_photo_url') String? startPhotoUrl,@JsonKey(name: 'end_time') String? endTime,@JsonKey(name: 'end_location') AppLocation? endLocation,@JsonKey(name: 'end_photo_url') String? endPhotoUrl,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'synced') bool? synced
});


@override $UserCopyWith<$Res>? get user;@override $ShiftCopyWith<$Res>? get shift;@override $AppLocationCopyWith<$Res>? get startLocation;@override $AppLocationCopyWith<$Res>? get endLocation;

}
/// @nodoc
class __$ShiftHistoryCopyWithImpl<$Res>
    implements _$ShiftHistoryCopyWith<$Res> {
  __$ShiftHistoryCopyWithImpl(this._self, this._then);

  final _ShiftHistory _self;
  final $Res Function(_ShiftHistory) _then;

/// Create a copy of ShiftHistory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? user = freezed,Object? shift = freezed,Object? startTime = freezed,Object? startLocation = freezed,Object? startPhotoUrl = freezed,Object? endTime = freezed,Object? endLocation = freezed,Object? endPhotoUrl = freezed,Object? createdAt = freezed,Object? synced = freezed,}) {
  return _then(_ShiftHistory(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User?,shift: freezed == shift ? _self.shift : shift // ignore: cast_nullable_to_non_nullable
as Shift?,startTime: freezed == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String?,startLocation: freezed == startLocation ? _self.startLocation : startLocation // ignore: cast_nullable_to_non_nullable
as AppLocation?,startPhotoUrl: freezed == startPhotoUrl ? _self.startPhotoUrl : startPhotoUrl // ignore: cast_nullable_to_non_nullable
as String?,endTime: freezed == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String?,endLocation: freezed == endLocation ? _self.endLocation : endLocation // ignore: cast_nullable_to_non_nullable
as AppLocation?,endPhotoUrl: freezed == endPhotoUrl ? _self.endPhotoUrl : endPhotoUrl // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,synced: freezed == synced ? _self.synced : synced // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

/// Create a copy of ShiftHistory
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserCopyWith<$Res>? get user {
    if (_self.user == null) {
    return null;
  }

  return $UserCopyWith<$Res>(_self.user!, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of ShiftHistory
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ShiftCopyWith<$Res>? get shift {
    if (_self.shift == null) {
    return null;
  }

  return $ShiftCopyWith<$Res>(_self.shift!, (value) {
    return _then(_self.copyWith(shift: value));
  });
}/// Create a copy of ShiftHistory
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppLocationCopyWith<$Res>? get startLocation {
    if (_self.startLocation == null) {
    return null;
  }

  return $AppLocationCopyWith<$Res>(_self.startLocation!, (value) {
    return _then(_self.copyWith(startLocation: value));
  });
}/// Create a copy of ShiftHistory
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppLocationCopyWith<$Res>? get endLocation {
    if (_self.endLocation == null) {
    return null;
  }

  return $AppLocationCopyWith<$Res>(_self.endLocation!, (value) {
    return _then(_self.copyWith(endLocation: value));
  });
}
}

// dart format on
