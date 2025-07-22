// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppLocation {

@JsonKey(name: 'id') int? get id;@JsonKey(name: 'name') String? get name;@JsonKey(name: 'lat') String? get latitude;@JsonKey(name: 'lng') String? get longitude;
/// Create a copy of AppLocation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppLocationCopyWith<AppLocation> get copyWith => _$AppLocationCopyWithImpl<AppLocation>(this as AppLocation, _$identity);

  /// Serializes this AppLocation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppLocation&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,latitude,longitude);

@override
String toString() {
  return 'AppLocation(id: $id, name: $name, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class $AppLocationCopyWith<$Res>  {
  factory $AppLocationCopyWith(AppLocation value, $Res Function(AppLocation) _then) = _$AppLocationCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int? id,@JsonKey(name: 'name') String? name,@JsonKey(name: 'lat') String? latitude,@JsonKey(name: 'lng') String? longitude
});




}
/// @nodoc
class _$AppLocationCopyWithImpl<$Res>
    implements $AppLocationCopyWith<$Res> {
  _$AppLocationCopyWithImpl(this._self, this._then);

  final AppLocation _self;
  final $Res Function(AppLocation) _then;

/// Create a copy of AppLocation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? latitude = freezed,Object? longitude = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as String?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AppLocation].
extension AppLocationPatterns on AppLocation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppLocation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppLocation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppLocation value)  $default,){
final _that = this;
switch (_that) {
case _AppLocation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppLocation value)?  $default,){
final _that = this;
switch (_that) {
case _AppLocation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'lat')  String? latitude, @JsonKey(name: 'lng')  String? longitude)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppLocation() when $default != null:
return $default(_that.id,_that.name,_that.latitude,_that.longitude);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'lat')  String? latitude, @JsonKey(name: 'lng')  String? longitude)  $default,) {final _that = this;
switch (_that) {
case _AppLocation():
return $default(_that.id,_that.name,_that.latitude,_that.longitude);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int? id, @JsonKey(name: 'name')  String? name, @JsonKey(name: 'lat')  String? latitude, @JsonKey(name: 'lng')  String? longitude)?  $default,) {final _that = this;
switch (_that) {
case _AppLocation() when $default != null:
return $default(_that.id,_that.name,_that.latitude,_that.longitude);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppLocation implements AppLocation {
   _AppLocation({@JsonKey(name: 'id') this.id, @JsonKey(name: 'name') this.name, @JsonKey(name: 'lat') this.latitude, @JsonKey(name: 'lng') this.longitude});
  factory _AppLocation.fromJson(Map<String, dynamic> json) => _$AppLocationFromJson(json);

@override@JsonKey(name: 'id') final  int? id;
@override@JsonKey(name: 'name') final  String? name;
@override@JsonKey(name: 'lat') final  String? latitude;
@override@JsonKey(name: 'lng') final  String? longitude;

/// Create a copy of AppLocation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppLocationCopyWith<_AppLocation> get copyWith => __$AppLocationCopyWithImpl<_AppLocation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppLocationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppLocation&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,latitude,longitude);

@override
String toString() {
  return 'AppLocation(id: $id, name: $name, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class _$AppLocationCopyWith<$Res> implements $AppLocationCopyWith<$Res> {
  factory _$AppLocationCopyWith(_AppLocation value, $Res Function(_AppLocation) _then) = __$AppLocationCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int? id,@JsonKey(name: 'name') String? name,@JsonKey(name: 'lat') String? latitude,@JsonKey(name: 'lng') String? longitude
});




}
/// @nodoc
class __$AppLocationCopyWithImpl<$Res>
    implements _$AppLocationCopyWith<$Res> {
  __$AppLocationCopyWithImpl(this._self, this._then);

  final _AppLocation _self;
  final $Res Function(_AppLocation) _then;

/// Create a copy of AppLocation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? latitude = freezed,Object? longitude = freezed,}) {
  return _then(_AppLocation(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as String?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
