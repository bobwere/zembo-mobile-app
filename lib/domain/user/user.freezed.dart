// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$User {

@JsonKey(name: 'id') int? get id;@JsonKey(name: 'username') String? get username;@JsonKey(name: 'country') Country? get country;@JsonKey(name: 'device_token') String? get deviceToken;@JsonKey(name: 'role') String? get role;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'updated_at') String? get updatedAt;@JsonKey(name: 'station') Station? get station;@JsonKey(name: 'shift') Shift? get shift;
/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserCopyWith<User> get copyWith => _$UserCopyWithImpl<User>(this as User, _$identity);

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is User&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.country, country) || other.country == country)&&(identical(other.deviceToken, deviceToken) || other.deviceToken == deviceToken)&&(identical(other.role, role) || other.role == role)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.station, station) || other.station == station)&&(identical(other.shift, shift) || other.shift == shift));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,country,deviceToken,role,createdAt,updatedAt,station,shift);

@override
String toString() {
  return 'User(id: $id, username: $username, country: $country, deviceToken: $deviceToken, role: $role, createdAt: $createdAt, updatedAt: $updatedAt, station: $station, shift: $shift)';
}


}

/// @nodoc
abstract mixin class $UserCopyWith<$Res>  {
  factory $UserCopyWith(User value, $Res Function(User) _then) = _$UserCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int? id,@JsonKey(name: 'username') String? username,@JsonKey(name: 'country') Country? country,@JsonKey(name: 'device_token') String? deviceToken,@JsonKey(name: 'role') String? role,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt,@JsonKey(name: 'station') Station? station,@JsonKey(name: 'shift') Shift? shift
});


$CountryCopyWith<$Res>? get country;$StationCopyWith<$Res>? get station;$ShiftCopyWith<$Res>? get shift;

}
/// @nodoc
class _$UserCopyWithImpl<$Res>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._self, this._then);

  final User _self;
  final $Res Function(User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? username = freezed,Object? country = freezed,Object? deviceToken = freezed,Object? role = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? station = freezed,Object? shift = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as Country?,deviceToken: freezed == deviceToken ? _self.deviceToken : deviceToken // ignore: cast_nullable_to_non_nullable
as String?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,station: freezed == station ? _self.station : station // ignore: cast_nullable_to_non_nullable
as Station?,shift: freezed == shift ? _self.shift : shift // ignore: cast_nullable_to_non_nullable
as Shift?,
  ));
}
/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CountryCopyWith<$Res>? get country {
    if (_self.country == null) {
    return null;
  }

  return $CountryCopyWith<$Res>(_self.country!, (value) {
    return _then(_self.copyWith(country: value));
  });
}/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StationCopyWith<$Res>? get station {
    if (_self.station == null) {
    return null;
  }

  return $StationCopyWith<$Res>(_self.station!, (value) {
    return _then(_self.copyWith(station: value));
  });
}/// Create a copy of User
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
}
}


/// Adds pattern-matching-related methods to [User].
extension UserPatterns on User {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _User value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _User() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _User value)  $default,){
final _that = this;
switch (_that) {
case _User():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _User value)?  $default,){
final _that = this;
switch (_that) {
case _User() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'username')  String? username, @JsonKey(name: 'country')  Country? country, @JsonKey(name: 'device_token')  String? deviceToken, @JsonKey(name: 'role')  String? role, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt, @JsonKey(name: 'station')  Station? station, @JsonKey(name: 'shift')  Shift? shift)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.id,_that.username,_that.country,_that.deviceToken,_that.role,_that.createdAt,_that.updatedAt,_that.station,_that.shift);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'username')  String? username, @JsonKey(name: 'country')  Country? country, @JsonKey(name: 'device_token')  String? deviceToken, @JsonKey(name: 'role')  String? role, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt, @JsonKey(name: 'station')  Station? station, @JsonKey(name: 'shift')  Shift? shift)  $default,) {final _that = this;
switch (_that) {
case _User():
return $default(_that.id,_that.username,_that.country,_that.deviceToken,_that.role,_that.createdAt,_that.updatedAt,_that.station,_that.shift);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'username')  String? username, @JsonKey(name: 'country')  Country? country, @JsonKey(name: 'device_token')  String? deviceToken, @JsonKey(name: 'role')  String? role, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt, @JsonKey(name: 'station')  Station? station, @JsonKey(name: 'shift')  Shift? shift)?  $default,) {final _that = this;
switch (_that) {
case _User() when $default != null:
return $default(_that.id,_that.username,_that.country,_that.deviceToken,_that.role,_that.createdAt,_that.updatedAt,_that.station,_that.shift);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _User implements User {
   _User({@JsonKey(name: 'id') this.id, @JsonKey(name: 'username') this.username, @JsonKey(name: 'country') this.country, @JsonKey(name: 'device_token') this.deviceToken, @JsonKey(name: 'role') this.role, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt, @JsonKey(name: 'station') this.station, @JsonKey(name: 'shift') this.shift});
  factory _User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

@override@JsonKey(name: 'id') final  int? id;
@override@JsonKey(name: 'username') final  String? username;
@override@JsonKey(name: 'country') final  Country? country;
@override@JsonKey(name: 'device_token') final  String? deviceToken;
@override@JsonKey(name: 'role') final  String? role;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'updated_at') final  String? updatedAt;
@override@JsonKey(name: 'station') final  Station? station;
@override@JsonKey(name: 'shift') final  Shift? shift;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserCopyWith<_User> get copyWith => __$UserCopyWithImpl<_User>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _User&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.country, country) || other.country == country)&&(identical(other.deviceToken, deviceToken) || other.deviceToken == deviceToken)&&(identical(other.role, role) || other.role == role)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.station, station) || other.station == station)&&(identical(other.shift, shift) || other.shift == shift));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,country,deviceToken,role,createdAt,updatedAt,station,shift);

@override
String toString() {
  return 'User(id: $id, username: $username, country: $country, deviceToken: $deviceToken, role: $role, createdAt: $createdAt, updatedAt: $updatedAt, station: $station, shift: $shift)';
}


}

/// @nodoc
abstract mixin class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) _then) = __$UserCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int? id,@JsonKey(name: 'username') String? username,@JsonKey(name: 'country') Country? country,@JsonKey(name: 'device_token') String? deviceToken,@JsonKey(name: 'role') String? role,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt,@JsonKey(name: 'station') Station? station,@JsonKey(name: 'shift') Shift? shift
});


@override $CountryCopyWith<$Res>? get country;@override $StationCopyWith<$Res>? get station;@override $ShiftCopyWith<$Res>? get shift;

}
/// @nodoc
class __$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(this._self, this._then);

  final _User _self;
  final $Res Function(_User) _then;

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? username = freezed,Object? country = freezed,Object? deviceToken = freezed,Object? role = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? station = freezed,Object? shift = freezed,}) {
  return _then(_User(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as Country?,deviceToken: freezed == deviceToken ? _self.deviceToken : deviceToken // ignore: cast_nullable_to_non_nullable
as String?,role: freezed == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,station: freezed == station ? _self.station : station // ignore: cast_nullable_to_non_nullable
as Station?,shift: freezed == shift ? _self.shift : shift // ignore: cast_nullable_to_non_nullable
as Shift?,
  ));
}

/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CountryCopyWith<$Res>? get country {
    if (_self.country == null) {
    return null;
  }

  return $CountryCopyWith<$Res>(_self.country!, (value) {
    return _then(_self.copyWith(country: value));
  });
}/// Create a copy of User
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StationCopyWith<$Res>? get station {
    if (_self.station == null) {
    return null;
  }

  return $StationCopyWith<$Res>(_self.station!, (value) {
    return _then(_self.copyWith(station: value));
  });
}/// Create a copy of User
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
}
}

// dart format on
