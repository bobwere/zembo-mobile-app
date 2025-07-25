// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'battery_request_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BatteryRequestState {

 AppStatus? get batteryRequestStatus; String? get batteryRequestError; List<BatteryRequest>? get batteryRequests; AppStatus? get fetchBatteryRequestsStatus; String? get fetchBatteryRequestError; AppStatus? get syncBatteryRequestsStatus; List<BatteryRequest>? get riderBatteryRequests; AppStatus? get fetchRiderBatteryRequestsStatus; String? get fetchRiderBatteryRequestsError; AppStatus? get syncRiderBatteryRequestsStatus; int? get syncRiderBatteryRequestsStatusID; String? get syncRiderBatteryRequestsError;
/// Create a copy of BatteryRequestState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BatteryRequestStateCopyWith<BatteryRequestState> get copyWith => _$BatteryRequestStateCopyWithImpl<BatteryRequestState>(this as BatteryRequestState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BatteryRequestState&&(identical(other.batteryRequestStatus, batteryRequestStatus) || other.batteryRequestStatus == batteryRequestStatus)&&(identical(other.batteryRequestError, batteryRequestError) || other.batteryRequestError == batteryRequestError)&&const DeepCollectionEquality().equals(other.batteryRequests, batteryRequests)&&(identical(other.fetchBatteryRequestsStatus, fetchBatteryRequestsStatus) || other.fetchBatteryRequestsStatus == fetchBatteryRequestsStatus)&&(identical(other.fetchBatteryRequestError, fetchBatteryRequestError) || other.fetchBatteryRequestError == fetchBatteryRequestError)&&(identical(other.syncBatteryRequestsStatus, syncBatteryRequestsStatus) || other.syncBatteryRequestsStatus == syncBatteryRequestsStatus)&&const DeepCollectionEquality().equals(other.riderBatteryRequests, riderBatteryRequests)&&(identical(other.fetchRiderBatteryRequestsStatus, fetchRiderBatteryRequestsStatus) || other.fetchRiderBatteryRequestsStatus == fetchRiderBatteryRequestsStatus)&&(identical(other.fetchRiderBatteryRequestsError, fetchRiderBatteryRequestsError) || other.fetchRiderBatteryRequestsError == fetchRiderBatteryRequestsError)&&(identical(other.syncRiderBatteryRequestsStatus, syncRiderBatteryRequestsStatus) || other.syncRiderBatteryRequestsStatus == syncRiderBatteryRequestsStatus)&&(identical(other.syncRiderBatteryRequestsStatusID, syncRiderBatteryRequestsStatusID) || other.syncRiderBatteryRequestsStatusID == syncRiderBatteryRequestsStatusID)&&(identical(other.syncRiderBatteryRequestsError, syncRiderBatteryRequestsError) || other.syncRiderBatteryRequestsError == syncRiderBatteryRequestsError));
}


@override
int get hashCode => Object.hash(runtimeType,batteryRequestStatus,batteryRequestError,const DeepCollectionEquality().hash(batteryRequests),fetchBatteryRequestsStatus,fetchBatteryRequestError,syncBatteryRequestsStatus,const DeepCollectionEquality().hash(riderBatteryRequests),fetchRiderBatteryRequestsStatus,fetchRiderBatteryRequestsError,syncRiderBatteryRequestsStatus,syncRiderBatteryRequestsStatusID,syncRiderBatteryRequestsError);

@override
String toString() {
  return 'BatteryRequestState(batteryRequestStatus: $batteryRequestStatus, batteryRequestError: $batteryRequestError, batteryRequests: $batteryRequests, fetchBatteryRequestsStatus: $fetchBatteryRequestsStatus, fetchBatteryRequestError: $fetchBatteryRequestError, syncBatteryRequestsStatus: $syncBatteryRequestsStatus, riderBatteryRequests: $riderBatteryRequests, fetchRiderBatteryRequestsStatus: $fetchRiderBatteryRequestsStatus, fetchRiderBatteryRequestsError: $fetchRiderBatteryRequestsError, syncRiderBatteryRequestsStatus: $syncRiderBatteryRequestsStatus, syncRiderBatteryRequestsStatusID: $syncRiderBatteryRequestsStatusID, syncRiderBatteryRequestsError: $syncRiderBatteryRequestsError)';
}


}

/// @nodoc
abstract mixin class $BatteryRequestStateCopyWith<$Res>  {
  factory $BatteryRequestStateCopyWith(BatteryRequestState value, $Res Function(BatteryRequestState) _then) = _$BatteryRequestStateCopyWithImpl;
@useResult
$Res call({
 AppStatus? batteryRequestStatus, String? batteryRequestError, List<BatteryRequest>? batteryRequests, AppStatus? fetchBatteryRequestsStatus, String? fetchBatteryRequestError, AppStatus? syncBatteryRequestsStatus, List<BatteryRequest>? riderBatteryRequests, AppStatus? fetchRiderBatteryRequestsStatus, String? fetchRiderBatteryRequestsError, AppStatus? syncRiderBatteryRequestsStatus, int? syncRiderBatteryRequestsStatusID, String? syncRiderBatteryRequestsError
});




}
/// @nodoc
class _$BatteryRequestStateCopyWithImpl<$Res>
    implements $BatteryRequestStateCopyWith<$Res> {
  _$BatteryRequestStateCopyWithImpl(this._self, this._then);

  final BatteryRequestState _self;
  final $Res Function(BatteryRequestState) _then;

/// Create a copy of BatteryRequestState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? batteryRequestStatus = freezed,Object? batteryRequestError = freezed,Object? batteryRequests = freezed,Object? fetchBatteryRequestsStatus = freezed,Object? fetchBatteryRequestError = freezed,Object? syncBatteryRequestsStatus = freezed,Object? riderBatteryRequests = freezed,Object? fetchRiderBatteryRequestsStatus = freezed,Object? fetchRiderBatteryRequestsError = freezed,Object? syncRiderBatteryRequestsStatus = freezed,Object? syncRiderBatteryRequestsStatusID = freezed,Object? syncRiderBatteryRequestsError = freezed,}) {
  return _then(_self.copyWith(
batteryRequestStatus: freezed == batteryRequestStatus ? _self.batteryRequestStatus : batteryRequestStatus // ignore: cast_nullable_to_non_nullable
as AppStatus?,batteryRequestError: freezed == batteryRequestError ? _self.batteryRequestError : batteryRequestError // ignore: cast_nullable_to_non_nullable
as String?,batteryRequests: freezed == batteryRequests ? _self.batteryRequests : batteryRequests // ignore: cast_nullable_to_non_nullable
as List<BatteryRequest>?,fetchBatteryRequestsStatus: freezed == fetchBatteryRequestsStatus ? _self.fetchBatteryRequestsStatus : fetchBatteryRequestsStatus // ignore: cast_nullable_to_non_nullable
as AppStatus?,fetchBatteryRequestError: freezed == fetchBatteryRequestError ? _self.fetchBatteryRequestError : fetchBatteryRequestError // ignore: cast_nullable_to_non_nullable
as String?,syncBatteryRequestsStatus: freezed == syncBatteryRequestsStatus ? _self.syncBatteryRequestsStatus : syncBatteryRequestsStatus // ignore: cast_nullable_to_non_nullable
as AppStatus?,riderBatteryRequests: freezed == riderBatteryRequests ? _self.riderBatteryRequests : riderBatteryRequests // ignore: cast_nullable_to_non_nullable
as List<BatteryRequest>?,fetchRiderBatteryRequestsStatus: freezed == fetchRiderBatteryRequestsStatus ? _self.fetchRiderBatteryRequestsStatus : fetchRiderBatteryRequestsStatus // ignore: cast_nullable_to_non_nullable
as AppStatus?,fetchRiderBatteryRequestsError: freezed == fetchRiderBatteryRequestsError ? _self.fetchRiderBatteryRequestsError : fetchRiderBatteryRequestsError // ignore: cast_nullable_to_non_nullable
as String?,syncRiderBatteryRequestsStatus: freezed == syncRiderBatteryRequestsStatus ? _self.syncRiderBatteryRequestsStatus : syncRiderBatteryRequestsStatus // ignore: cast_nullable_to_non_nullable
as AppStatus?,syncRiderBatteryRequestsStatusID: freezed == syncRiderBatteryRequestsStatusID ? _self.syncRiderBatteryRequestsStatusID : syncRiderBatteryRequestsStatusID // ignore: cast_nullable_to_non_nullable
as int?,syncRiderBatteryRequestsError: freezed == syncRiderBatteryRequestsError ? _self.syncRiderBatteryRequestsError : syncRiderBatteryRequestsError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BatteryRequestState].
extension BatteryRequestStatePatterns on BatteryRequestState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BatteryRequestState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BatteryRequestState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BatteryRequestState value)  $default,){
final _that = this;
switch (_that) {
case _BatteryRequestState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BatteryRequestState value)?  $default,){
final _that = this;
switch (_that) {
case _BatteryRequestState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AppStatus? batteryRequestStatus,  String? batteryRequestError,  List<BatteryRequest>? batteryRequests,  AppStatus? fetchBatteryRequestsStatus,  String? fetchBatteryRequestError,  AppStatus? syncBatteryRequestsStatus,  List<BatteryRequest>? riderBatteryRequests,  AppStatus? fetchRiderBatteryRequestsStatus,  String? fetchRiderBatteryRequestsError,  AppStatus? syncRiderBatteryRequestsStatus,  int? syncRiderBatteryRequestsStatusID,  String? syncRiderBatteryRequestsError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BatteryRequestState() when $default != null:
return $default(_that.batteryRequestStatus,_that.batteryRequestError,_that.batteryRequests,_that.fetchBatteryRequestsStatus,_that.fetchBatteryRequestError,_that.syncBatteryRequestsStatus,_that.riderBatteryRequests,_that.fetchRiderBatteryRequestsStatus,_that.fetchRiderBatteryRequestsError,_that.syncRiderBatteryRequestsStatus,_that.syncRiderBatteryRequestsStatusID,_that.syncRiderBatteryRequestsError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AppStatus? batteryRequestStatus,  String? batteryRequestError,  List<BatteryRequest>? batteryRequests,  AppStatus? fetchBatteryRequestsStatus,  String? fetchBatteryRequestError,  AppStatus? syncBatteryRequestsStatus,  List<BatteryRequest>? riderBatteryRequests,  AppStatus? fetchRiderBatteryRequestsStatus,  String? fetchRiderBatteryRequestsError,  AppStatus? syncRiderBatteryRequestsStatus,  int? syncRiderBatteryRequestsStatusID,  String? syncRiderBatteryRequestsError)  $default,) {final _that = this;
switch (_that) {
case _BatteryRequestState():
return $default(_that.batteryRequestStatus,_that.batteryRequestError,_that.batteryRequests,_that.fetchBatteryRequestsStatus,_that.fetchBatteryRequestError,_that.syncBatteryRequestsStatus,_that.riderBatteryRequests,_that.fetchRiderBatteryRequestsStatus,_that.fetchRiderBatteryRequestsError,_that.syncRiderBatteryRequestsStatus,_that.syncRiderBatteryRequestsStatusID,_that.syncRiderBatteryRequestsError);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AppStatus? batteryRequestStatus,  String? batteryRequestError,  List<BatteryRequest>? batteryRequests,  AppStatus? fetchBatteryRequestsStatus,  String? fetchBatteryRequestError,  AppStatus? syncBatteryRequestsStatus,  List<BatteryRequest>? riderBatteryRequests,  AppStatus? fetchRiderBatteryRequestsStatus,  String? fetchRiderBatteryRequestsError,  AppStatus? syncRiderBatteryRequestsStatus,  int? syncRiderBatteryRequestsStatusID,  String? syncRiderBatteryRequestsError)?  $default,) {final _that = this;
switch (_that) {
case _BatteryRequestState() when $default != null:
return $default(_that.batteryRequestStatus,_that.batteryRequestError,_that.batteryRequests,_that.fetchBatteryRequestsStatus,_that.fetchBatteryRequestError,_that.syncBatteryRequestsStatus,_that.riderBatteryRequests,_that.fetchRiderBatteryRequestsStatus,_that.fetchRiderBatteryRequestsError,_that.syncRiderBatteryRequestsStatus,_that.syncRiderBatteryRequestsStatusID,_that.syncRiderBatteryRequestsError);case _:
  return null;

}
}

}

/// @nodoc


class _BatteryRequestState implements BatteryRequestState {
   _BatteryRequestState({this.batteryRequestStatus, this.batteryRequestError, final  List<BatteryRequest>? batteryRequests, this.fetchBatteryRequestsStatus, this.fetchBatteryRequestError, this.syncBatteryRequestsStatus, final  List<BatteryRequest>? riderBatteryRequests, this.fetchRiderBatteryRequestsStatus, this.fetchRiderBatteryRequestsError, this.syncRiderBatteryRequestsStatus, this.syncRiderBatteryRequestsStatusID, this.syncRiderBatteryRequestsError}): _batteryRequests = batteryRequests,_riderBatteryRequests = riderBatteryRequests;
  

@override final  AppStatus? batteryRequestStatus;
@override final  String? batteryRequestError;
 final  List<BatteryRequest>? _batteryRequests;
@override List<BatteryRequest>? get batteryRequests {
  final value = _batteryRequests;
  if (value == null) return null;
  if (_batteryRequests is EqualUnmodifiableListView) return _batteryRequests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  AppStatus? fetchBatteryRequestsStatus;
@override final  String? fetchBatteryRequestError;
@override final  AppStatus? syncBatteryRequestsStatus;
 final  List<BatteryRequest>? _riderBatteryRequests;
@override List<BatteryRequest>? get riderBatteryRequests {
  final value = _riderBatteryRequests;
  if (value == null) return null;
  if (_riderBatteryRequests is EqualUnmodifiableListView) return _riderBatteryRequests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  AppStatus? fetchRiderBatteryRequestsStatus;
@override final  String? fetchRiderBatteryRequestsError;
@override final  AppStatus? syncRiderBatteryRequestsStatus;
@override final  int? syncRiderBatteryRequestsStatusID;
@override final  String? syncRiderBatteryRequestsError;

/// Create a copy of BatteryRequestState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BatteryRequestStateCopyWith<_BatteryRequestState> get copyWith => __$BatteryRequestStateCopyWithImpl<_BatteryRequestState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BatteryRequestState&&(identical(other.batteryRequestStatus, batteryRequestStatus) || other.batteryRequestStatus == batteryRequestStatus)&&(identical(other.batteryRequestError, batteryRequestError) || other.batteryRequestError == batteryRequestError)&&const DeepCollectionEquality().equals(other._batteryRequests, _batteryRequests)&&(identical(other.fetchBatteryRequestsStatus, fetchBatteryRequestsStatus) || other.fetchBatteryRequestsStatus == fetchBatteryRequestsStatus)&&(identical(other.fetchBatteryRequestError, fetchBatteryRequestError) || other.fetchBatteryRequestError == fetchBatteryRequestError)&&(identical(other.syncBatteryRequestsStatus, syncBatteryRequestsStatus) || other.syncBatteryRequestsStatus == syncBatteryRequestsStatus)&&const DeepCollectionEquality().equals(other._riderBatteryRequests, _riderBatteryRequests)&&(identical(other.fetchRiderBatteryRequestsStatus, fetchRiderBatteryRequestsStatus) || other.fetchRiderBatteryRequestsStatus == fetchRiderBatteryRequestsStatus)&&(identical(other.fetchRiderBatteryRequestsError, fetchRiderBatteryRequestsError) || other.fetchRiderBatteryRequestsError == fetchRiderBatteryRequestsError)&&(identical(other.syncRiderBatteryRequestsStatus, syncRiderBatteryRequestsStatus) || other.syncRiderBatteryRequestsStatus == syncRiderBatteryRequestsStatus)&&(identical(other.syncRiderBatteryRequestsStatusID, syncRiderBatteryRequestsStatusID) || other.syncRiderBatteryRequestsStatusID == syncRiderBatteryRequestsStatusID)&&(identical(other.syncRiderBatteryRequestsError, syncRiderBatteryRequestsError) || other.syncRiderBatteryRequestsError == syncRiderBatteryRequestsError));
}


@override
int get hashCode => Object.hash(runtimeType,batteryRequestStatus,batteryRequestError,const DeepCollectionEquality().hash(_batteryRequests),fetchBatteryRequestsStatus,fetchBatteryRequestError,syncBatteryRequestsStatus,const DeepCollectionEquality().hash(_riderBatteryRequests),fetchRiderBatteryRequestsStatus,fetchRiderBatteryRequestsError,syncRiderBatteryRequestsStatus,syncRiderBatteryRequestsStatusID,syncRiderBatteryRequestsError);

@override
String toString() {
  return 'BatteryRequestState(batteryRequestStatus: $batteryRequestStatus, batteryRequestError: $batteryRequestError, batteryRequests: $batteryRequests, fetchBatteryRequestsStatus: $fetchBatteryRequestsStatus, fetchBatteryRequestError: $fetchBatteryRequestError, syncBatteryRequestsStatus: $syncBatteryRequestsStatus, riderBatteryRequests: $riderBatteryRequests, fetchRiderBatteryRequestsStatus: $fetchRiderBatteryRequestsStatus, fetchRiderBatteryRequestsError: $fetchRiderBatteryRequestsError, syncRiderBatteryRequestsStatus: $syncRiderBatteryRequestsStatus, syncRiderBatteryRequestsStatusID: $syncRiderBatteryRequestsStatusID, syncRiderBatteryRequestsError: $syncRiderBatteryRequestsError)';
}


}

/// @nodoc
abstract mixin class _$BatteryRequestStateCopyWith<$Res> implements $BatteryRequestStateCopyWith<$Res> {
  factory _$BatteryRequestStateCopyWith(_BatteryRequestState value, $Res Function(_BatteryRequestState) _then) = __$BatteryRequestStateCopyWithImpl;
@override @useResult
$Res call({
 AppStatus? batteryRequestStatus, String? batteryRequestError, List<BatteryRequest>? batteryRequests, AppStatus? fetchBatteryRequestsStatus, String? fetchBatteryRequestError, AppStatus? syncBatteryRequestsStatus, List<BatteryRequest>? riderBatteryRequests, AppStatus? fetchRiderBatteryRequestsStatus, String? fetchRiderBatteryRequestsError, AppStatus? syncRiderBatteryRequestsStatus, int? syncRiderBatteryRequestsStatusID, String? syncRiderBatteryRequestsError
});




}
/// @nodoc
class __$BatteryRequestStateCopyWithImpl<$Res>
    implements _$BatteryRequestStateCopyWith<$Res> {
  __$BatteryRequestStateCopyWithImpl(this._self, this._then);

  final _BatteryRequestState _self;
  final $Res Function(_BatteryRequestState) _then;

/// Create a copy of BatteryRequestState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? batteryRequestStatus = freezed,Object? batteryRequestError = freezed,Object? batteryRequests = freezed,Object? fetchBatteryRequestsStatus = freezed,Object? fetchBatteryRequestError = freezed,Object? syncBatteryRequestsStatus = freezed,Object? riderBatteryRequests = freezed,Object? fetchRiderBatteryRequestsStatus = freezed,Object? fetchRiderBatteryRequestsError = freezed,Object? syncRiderBatteryRequestsStatus = freezed,Object? syncRiderBatteryRequestsStatusID = freezed,Object? syncRiderBatteryRequestsError = freezed,}) {
  return _then(_BatteryRequestState(
batteryRequestStatus: freezed == batteryRequestStatus ? _self.batteryRequestStatus : batteryRequestStatus // ignore: cast_nullable_to_non_nullable
as AppStatus?,batteryRequestError: freezed == batteryRequestError ? _self.batteryRequestError : batteryRequestError // ignore: cast_nullable_to_non_nullable
as String?,batteryRequests: freezed == batteryRequests ? _self._batteryRequests : batteryRequests // ignore: cast_nullable_to_non_nullable
as List<BatteryRequest>?,fetchBatteryRequestsStatus: freezed == fetchBatteryRequestsStatus ? _self.fetchBatteryRequestsStatus : fetchBatteryRequestsStatus // ignore: cast_nullable_to_non_nullable
as AppStatus?,fetchBatteryRequestError: freezed == fetchBatteryRequestError ? _self.fetchBatteryRequestError : fetchBatteryRequestError // ignore: cast_nullable_to_non_nullable
as String?,syncBatteryRequestsStatus: freezed == syncBatteryRequestsStatus ? _self.syncBatteryRequestsStatus : syncBatteryRequestsStatus // ignore: cast_nullable_to_non_nullable
as AppStatus?,riderBatteryRequests: freezed == riderBatteryRequests ? _self._riderBatteryRequests : riderBatteryRequests // ignore: cast_nullable_to_non_nullable
as List<BatteryRequest>?,fetchRiderBatteryRequestsStatus: freezed == fetchRiderBatteryRequestsStatus ? _self.fetchRiderBatteryRequestsStatus : fetchRiderBatteryRequestsStatus // ignore: cast_nullable_to_non_nullable
as AppStatus?,fetchRiderBatteryRequestsError: freezed == fetchRiderBatteryRequestsError ? _self.fetchRiderBatteryRequestsError : fetchRiderBatteryRequestsError // ignore: cast_nullable_to_non_nullable
as String?,syncRiderBatteryRequestsStatus: freezed == syncRiderBatteryRequestsStatus ? _self.syncRiderBatteryRequestsStatus : syncRiderBatteryRequestsStatus // ignore: cast_nullable_to_non_nullable
as AppStatus?,syncRiderBatteryRequestsStatusID: freezed == syncRiderBatteryRequestsStatusID ? _self.syncRiderBatteryRequestsStatusID : syncRiderBatteryRequestsStatusID // ignore: cast_nullable_to_non_nullable
as int?,syncRiderBatteryRequestsError: freezed == syncRiderBatteryRequestsError ? _self.syncRiderBatteryRequestsError : syncRiderBatteryRequestsError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
