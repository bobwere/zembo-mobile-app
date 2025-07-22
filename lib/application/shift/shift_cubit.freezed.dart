// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shift_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ShiftState {

// current station
 Station? get currentStation;// current Shift
 Shift? get currentShift;// current shift
 ShiftHistory? get activeShift;// current days shift history
 List<ShiftHistory>? get currentDaysShiftHistory; AppStatus? get fetchCurrentDaysShiftHistoryStatus; String? get fetchDaysShiftHistoryError;// all shift history
 List<ShiftHistory>? get allShiftHistory; AppStatus? get fetchAllShiftHistoryStatus; String? get fetchAllShiftHistoryError;// has active shift
 bool? get hasActiveShift; AppStatus? get fetchHasActiveShiftStatus; String? get fetchHasActiveShiftError;// start shift
 AppStatus? get startShiftStatus; String? get startShiftError;// end shift
 AppStatus? get endShiftStatus; String? get endShiftError;// geolocation events
 AppStatus? get geoLocationStatus; AppStatus? get geoRadiusStatus;// shift messaging
 bool? get showStartShiftButton; bool? get showEndShiftButton; String? get shiftMessaging;
/// Create a copy of ShiftState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShiftStateCopyWith<ShiftState> get copyWith => _$ShiftStateCopyWithImpl<ShiftState>(this as ShiftState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShiftState&&(identical(other.currentStation, currentStation) || other.currentStation == currentStation)&&(identical(other.currentShift, currentShift) || other.currentShift == currentShift)&&(identical(other.activeShift, activeShift) || other.activeShift == activeShift)&&const DeepCollectionEquality().equals(other.currentDaysShiftHistory, currentDaysShiftHistory)&&(identical(other.fetchCurrentDaysShiftHistoryStatus, fetchCurrentDaysShiftHistoryStatus) || other.fetchCurrentDaysShiftHistoryStatus == fetchCurrentDaysShiftHistoryStatus)&&(identical(other.fetchDaysShiftHistoryError, fetchDaysShiftHistoryError) || other.fetchDaysShiftHistoryError == fetchDaysShiftHistoryError)&&const DeepCollectionEquality().equals(other.allShiftHistory, allShiftHistory)&&(identical(other.fetchAllShiftHistoryStatus, fetchAllShiftHistoryStatus) || other.fetchAllShiftHistoryStatus == fetchAllShiftHistoryStatus)&&(identical(other.fetchAllShiftHistoryError, fetchAllShiftHistoryError) || other.fetchAllShiftHistoryError == fetchAllShiftHistoryError)&&(identical(other.hasActiveShift, hasActiveShift) || other.hasActiveShift == hasActiveShift)&&(identical(other.fetchHasActiveShiftStatus, fetchHasActiveShiftStatus) || other.fetchHasActiveShiftStatus == fetchHasActiveShiftStatus)&&(identical(other.fetchHasActiveShiftError, fetchHasActiveShiftError) || other.fetchHasActiveShiftError == fetchHasActiveShiftError)&&(identical(other.startShiftStatus, startShiftStatus) || other.startShiftStatus == startShiftStatus)&&(identical(other.startShiftError, startShiftError) || other.startShiftError == startShiftError)&&(identical(other.endShiftStatus, endShiftStatus) || other.endShiftStatus == endShiftStatus)&&(identical(other.endShiftError, endShiftError) || other.endShiftError == endShiftError)&&(identical(other.geoLocationStatus, geoLocationStatus) || other.geoLocationStatus == geoLocationStatus)&&(identical(other.geoRadiusStatus, geoRadiusStatus) || other.geoRadiusStatus == geoRadiusStatus)&&(identical(other.showStartShiftButton, showStartShiftButton) || other.showStartShiftButton == showStartShiftButton)&&(identical(other.showEndShiftButton, showEndShiftButton) || other.showEndShiftButton == showEndShiftButton)&&(identical(other.shiftMessaging, shiftMessaging) || other.shiftMessaging == shiftMessaging));
}


@override
int get hashCode => Object.hashAll([runtimeType,currentStation,currentShift,activeShift,const DeepCollectionEquality().hash(currentDaysShiftHistory),fetchCurrentDaysShiftHistoryStatus,fetchDaysShiftHistoryError,const DeepCollectionEquality().hash(allShiftHistory),fetchAllShiftHistoryStatus,fetchAllShiftHistoryError,hasActiveShift,fetchHasActiveShiftStatus,fetchHasActiveShiftError,startShiftStatus,startShiftError,endShiftStatus,endShiftError,geoLocationStatus,geoRadiusStatus,showStartShiftButton,showEndShiftButton,shiftMessaging]);

@override
String toString() {
  return 'ShiftState(currentStation: $currentStation, currentShift: $currentShift, activeShift: $activeShift, currentDaysShiftHistory: $currentDaysShiftHistory, fetchCurrentDaysShiftHistoryStatus: $fetchCurrentDaysShiftHistoryStatus, fetchDaysShiftHistoryError: $fetchDaysShiftHistoryError, allShiftHistory: $allShiftHistory, fetchAllShiftHistoryStatus: $fetchAllShiftHistoryStatus, fetchAllShiftHistoryError: $fetchAllShiftHistoryError, hasActiveShift: $hasActiveShift, fetchHasActiveShiftStatus: $fetchHasActiveShiftStatus, fetchHasActiveShiftError: $fetchHasActiveShiftError, startShiftStatus: $startShiftStatus, startShiftError: $startShiftError, endShiftStatus: $endShiftStatus, endShiftError: $endShiftError, geoLocationStatus: $geoLocationStatus, geoRadiusStatus: $geoRadiusStatus, showStartShiftButton: $showStartShiftButton, showEndShiftButton: $showEndShiftButton, shiftMessaging: $shiftMessaging)';
}


}

/// @nodoc
abstract mixin class $ShiftStateCopyWith<$Res>  {
  factory $ShiftStateCopyWith(ShiftState value, $Res Function(ShiftState) _then) = _$ShiftStateCopyWithImpl;
@useResult
$Res call({
 Station? currentStation, Shift? currentShift, ShiftHistory? activeShift, List<ShiftHistory>? currentDaysShiftHistory, AppStatus? fetchCurrentDaysShiftHistoryStatus, String? fetchDaysShiftHistoryError, List<ShiftHistory>? allShiftHistory, AppStatus? fetchAllShiftHistoryStatus, String? fetchAllShiftHistoryError, bool? hasActiveShift, AppStatus? fetchHasActiveShiftStatus, String? fetchHasActiveShiftError, AppStatus? startShiftStatus, String? startShiftError, AppStatus? endShiftStatus, String? endShiftError, AppStatus? geoLocationStatus, AppStatus? geoRadiusStatus, bool? showStartShiftButton, bool? showEndShiftButton, String? shiftMessaging
});


$StationCopyWith<$Res>? get currentStation;$ShiftCopyWith<$Res>? get currentShift;$ShiftHistoryCopyWith<$Res>? get activeShift;

}
/// @nodoc
class _$ShiftStateCopyWithImpl<$Res>
    implements $ShiftStateCopyWith<$Res> {
  _$ShiftStateCopyWithImpl(this._self, this._then);

  final ShiftState _self;
  final $Res Function(ShiftState) _then;

/// Create a copy of ShiftState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentStation = freezed,Object? currentShift = freezed,Object? activeShift = freezed,Object? currentDaysShiftHistory = freezed,Object? fetchCurrentDaysShiftHistoryStatus = freezed,Object? fetchDaysShiftHistoryError = freezed,Object? allShiftHistory = freezed,Object? fetchAllShiftHistoryStatus = freezed,Object? fetchAllShiftHistoryError = freezed,Object? hasActiveShift = freezed,Object? fetchHasActiveShiftStatus = freezed,Object? fetchHasActiveShiftError = freezed,Object? startShiftStatus = freezed,Object? startShiftError = freezed,Object? endShiftStatus = freezed,Object? endShiftError = freezed,Object? geoLocationStatus = freezed,Object? geoRadiusStatus = freezed,Object? showStartShiftButton = freezed,Object? showEndShiftButton = freezed,Object? shiftMessaging = freezed,}) {
  return _then(_self.copyWith(
currentStation: freezed == currentStation ? _self.currentStation : currentStation // ignore: cast_nullable_to_non_nullable
as Station?,currentShift: freezed == currentShift ? _self.currentShift : currentShift // ignore: cast_nullable_to_non_nullable
as Shift?,activeShift: freezed == activeShift ? _self.activeShift : activeShift // ignore: cast_nullable_to_non_nullable
as ShiftHistory?,currentDaysShiftHistory: freezed == currentDaysShiftHistory ? _self.currentDaysShiftHistory : currentDaysShiftHistory // ignore: cast_nullable_to_non_nullable
as List<ShiftHistory>?,fetchCurrentDaysShiftHistoryStatus: freezed == fetchCurrentDaysShiftHistoryStatus ? _self.fetchCurrentDaysShiftHistoryStatus : fetchCurrentDaysShiftHistoryStatus // ignore: cast_nullable_to_non_nullable
as AppStatus?,fetchDaysShiftHistoryError: freezed == fetchDaysShiftHistoryError ? _self.fetchDaysShiftHistoryError : fetchDaysShiftHistoryError // ignore: cast_nullable_to_non_nullable
as String?,allShiftHistory: freezed == allShiftHistory ? _self.allShiftHistory : allShiftHistory // ignore: cast_nullable_to_non_nullable
as List<ShiftHistory>?,fetchAllShiftHistoryStatus: freezed == fetchAllShiftHistoryStatus ? _self.fetchAllShiftHistoryStatus : fetchAllShiftHistoryStatus // ignore: cast_nullable_to_non_nullable
as AppStatus?,fetchAllShiftHistoryError: freezed == fetchAllShiftHistoryError ? _self.fetchAllShiftHistoryError : fetchAllShiftHistoryError // ignore: cast_nullable_to_non_nullable
as String?,hasActiveShift: freezed == hasActiveShift ? _self.hasActiveShift : hasActiveShift // ignore: cast_nullable_to_non_nullable
as bool?,fetchHasActiveShiftStatus: freezed == fetchHasActiveShiftStatus ? _self.fetchHasActiveShiftStatus : fetchHasActiveShiftStatus // ignore: cast_nullable_to_non_nullable
as AppStatus?,fetchHasActiveShiftError: freezed == fetchHasActiveShiftError ? _self.fetchHasActiveShiftError : fetchHasActiveShiftError // ignore: cast_nullable_to_non_nullable
as String?,startShiftStatus: freezed == startShiftStatus ? _self.startShiftStatus : startShiftStatus // ignore: cast_nullable_to_non_nullable
as AppStatus?,startShiftError: freezed == startShiftError ? _self.startShiftError : startShiftError // ignore: cast_nullable_to_non_nullable
as String?,endShiftStatus: freezed == endShiftStatus ? _self.endShiftStatus : endShiftStatus // ignore: cast_nullable_to_non_nullable
as AppStatus?,endShiftError: freezed == endShiftError ? _self.endShiftError : endShiftError // ignore: cast_nullable_to_non_nullable
as String?,geoLocationStatus: freezed == geoLocationStatus ? _self.geoLocationStatus : geoLocationStatus // ignore: cast_nullable_to_non_nullable
as AppStatus?,geoRadiusStatus: freezed == geoRadiusStatus ? _self.geoRadiusStatus : geoRadiusStatus // ignore: cast_nullable_to_non_nullable
as AppStatus?,showStartShiftButton: freezed == showStartShiftButton ? _self.showStartShiftButton : showStartShiftButton // ignore: cast_nullable_to_non_nullable
as bool?,showEndShiftButton: freezed == showEndShiftButton ? _self.showEndShiftButton : showEndShiftButton // ignore: cast_nullable_to_non_nullable
as bool?,shiftMessaging: freezed == shiftMessaging ? _self.shiftMessaging : shiftMessaging // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ShiftState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StationCopyWith<$Res>? get currentStation {
    if (_self.currentStation == null) {
    return null;
  }

  return $StationCopyWith<$Res>(_self.currentStation!, (value) {
    return _then(_self.copyWith(currentStation: value));
  });
}/// Create a copy of ShiftState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ShiftCopyWith<$Res>? get currentShift {
    if (_self.currentShift == null) {
    return null;
  }

  return $ShiftCopyWith<$Res>(_self.currentShift!, (value) {
    return _then(_self.copyWith(currentShift: value));
  });
}/// Create a copy of ShiftState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ShiftHistoryCopyWith<$Res>? get activeShift {
    if (_self.activeShift == null) {
    return null;
  }

  return $ShiftHistoryCopyWith<$Res>(_self.activeShift!, (value) {
    return _then(_self.copyWith(activeShift: value));
  });
}
}


/// Adds pattern-matching-related methods to [ShiftState].
extension ShiftStatePatterns on ShiftState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShiftState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShiftState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShiftState value)  $default,){
final _that = this;
switch (_that) {
case _ShiftState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShiftState value)?  $default,){
final _that = this;
switch (_that) {
case _ShiftState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Station? currentStation,  Shift? currentShift,  ShiftHistory? activeShift,  List<ShiftHistory>? currentDaysShiftHistory,  AppStatus? fetchCurrentDaysShiftHistoryStatus,  String? fetchDaysShiftHistoryError,  List<ShiftHistory>? allShiftHistory,  AppStatus? fetchAllShiftHistoryStatus,  String? fetchAllShiftHistoryError,  bool? hasActiveShift,  AppStatus? fetchHasActiveShiftStatus,  String? fetchHasActiveShiftError,  AppStatus? startShiftStatus,  String? startShiftError,  AppStatus? endShiftStatus,  String? endShiftError,  AppStatus? geoLocationStatus,  AppStatus? geoRadiusStatus,  bool? showStartShiftButton,  bool? showEndShiftButton,  String? shiftMessaging)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShiftState() when $default != null:
return $default(_that.currentStation,_that.currentShift,_that.activeShift,_that.currentDaysShiftHistory,_that.fetchCurrentDaysShiftHistoryStatus,_that.fetchDaysShiftHistoryError,_that.allShiftHistory,_that.fetchAllShiftHistoryStatus,_that.fetchAllShiftHistoryError,_that.hasActiveShift,_that.fetchHasActiveShiftStatus,_that.fetchHasActiveShiftError,_that.startShiftStatus,_that.startShiftError,_that.endShiftStatus,_that.endShiftError,_that.geoLocationStatus,_that.geoRadiusStatus,_that.showStartShiftButton,_that.showEndShiftButton,_that.shiftMessaging);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Station? currentStation,  Shift? currentShift,  ShiftHistory? activeShift,  List<ShiftHistory>? currentDaysShiftHistory,  AppStatus? fetchCurrentDaysShiftHistoryStatus,  String? fetchDaysShiftHistoryError,  List<ShiftHistory>? allShiftHistory,  AppStatus? fetchAllShiftHistoryStatus,  String? fetchAllShiftHistoryError,  bool? hasActiveShift,  AppStatus? fetchHasActiveShiftStatus,  String? fetchHasActiveShiftError,  AppStatus? startShiftStatus,  String? startShiftError,  AppStatus? endShiftStatus,  String? endShiftError,  AppStatus? geoLocationStatus,  AppStatus? geoRadiusStatus,  bool? showStartShiftButton,  bool? showEndShiftButton,  String? shiftMessaging)  $default,) {final _that = this;
switch (_that) {
case _ShiftState():
return $default(_that.currentStation,_that.currentShift,_that.activeShift,_that.currentDaysShiftHistory,_that.fetchCurrentDaysShiftHistoryStatus,_that.fetchDaysShiftHistoryError,_that.allShiftHistory,_that.fetchAllShiftHistoryStatus,_that.fetchAllShiftHistoryError,_that.hasActiveShift,_that.fetchHasActiveShiftStatus,_that.fetchHasActiveShiftError,_that.startShiftStatus,_that.startShiftError,_that.endShiftStatus,_that.endShiftError,_that.geoLocationStatus,_that.geoRadiusStatus,_that.showStartShiftButton,_that.showEndShiftButton,_that.shiftMessaging);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Station? currentStation,  Shift? currentShift,  ShiftHistory? activeShift,  List<ShiftHistory>? currentDaysShiftHistory,  AppStatus? fetchCurrentDaysShiftHistoryStatus,  String? fetchDaysShiftHistoryError,  List<ShiftHistory>? allShiftHistory,  AppStatus? fetchAllShiftHistoryStatus,  String? fetchAllShiftHistoryError,  bool? hasActiveShift,  AppStatus? fetchHasActiveShiftStatus,  String? fetchHasActiveShiftError,  AppStatus? startShiftStatus,  String? startShiftError,  AppStatus? endShiftStatus,  String? endShiftError,  AppStatus? geoLocationStatus,  AppStatus? geoRadiusStatus,  bool? showStartShiftButton,  bool? showEndShiftButton,  String? shiftMessaging)?  $default,) {final _that = this;
switch (_that) {
case _ShiftState() when $default != null:
return $default(_that.currentStation,_that.currentShift,_that.activeShift,_that.currentDaysShiftHistory,_that.fetchCurrentDaysShiftHistoryStatus,_that.fetchDaysShiftHistoryError,_that.allShiftHistory,_that.fetchAllShiftHistoryStatus,_that.fetchAllShiftHistoryError,_that.hasActiveShift,_that.fetchHasActiveShiftStatus,_that.fetchHasActiveShiftError,_that.startShiftStatus,_that.startShiftError,_that.endShiftStatus,_that.endShiftError,_that.geoLocationStatus,_that.geoRadiusStatus,_that.showStartShiftButton,_that.showEndShiftButton,_that.shiftMessaging);case _:
  return null;

}
}

}

/// @nodoc


class _ShiftState implements ShiftState {
   _ShiftState({this.currentStation, this.currentShift, this.activeShift, final  List<ShiftHistory>? currentDaysShiftHistory, this.fetchCurrentDaysShiftHistoryStatus, this.fetchDaysShiftHistoryError, final  List<ShiftHistory>? allShiftHistory, this.fetchAllShiftHistoryStatus, this.fetchAllShiftHistoryError, this.hasActiveShift, this.fetchHasActiveShiftStatus, this.fetchHasActiveShiftError, this.startShiftStatus, this.startShiftError, this.endShiftStatus, this.endShiftError, this.geoLocationStatus, this.geoRadiusStatus, this.showStartShiftButton, this.showEndShiftButton, this.shiftMessaging}): _currentDaysShiftHistory = currentDaysShiftHistory,_allShiftHistory = allShiftHistory;
  

// current station
@override final  Station? currentStation;
// current Shift
@override final  Shift? currentShift;
// current shift
@override final  ShiftHistory? activeShift;
// current days shift history
 final  List<ShiftHistory>? _currentDaysShiftHistory;
// current days shift history
@override List<ShiftHistory>? get currentDaysShiftHistory {
  final value = _currentDaysShiftHistory;
  if (value == null) return null;
  if (_currentDaysShiftHistory is EqualUnmodifiableListView) return _currentDaysShiftHistory;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  AppStatus? fetchCurrentDaysShiftHistoryStatus;
@override final  String? fetchDaysShiftHistoryError;
// all shift history
 final  List<ShiftHistory>? _allShiftHistory;
// all shift history
@override List<ShiftHistory>? get allShiftHistory {
  final value = _allShiftHistory;
  if (value == null) return null;
  if (_allShiftHistory is EqualUnmodifiableListView) return _allShiftHistory;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  AppStatus? fetchAllShiftHistoryStatus;
@override final  String? fetchAllShiftHistoryError;
// has active shift
@override final  bool? hasActiveShift;
@override final  AppStatus? fetchHasActiveShiftStatus;
@override final  String? fetchHasActiveShiftError;
// start shift
@override final  AppStatus? startShiftStatus;
@override final  String? startShiftError;
// end shift
@override final  AppStatus? endShiftStatus;
@override final  String? endShiftError;
// geolocation events
@override final  AppStatus? geoLocationStatus;
@override final  AppStatus? geoRadiusStatus;
// shift messaging
@override final  bool? showStartShiftButton;
@override final  bool? showEndShiftButton;
@override final  String? shiftMessaging;

/// Create a copy of ShiftState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShiftStateCopyWith<_ShiftState> get copyWith => __$ShiftStateCopyWithImpl<_ShiftState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShiftState&&(identical(other.currentStation, currentStation) || other.currentStation == currentStation)&&(identical(other.currentShift, currentShift) || other.currentShift == currentShift)&&(identical(other.activeShift, activeShift) || other.activeShift == activeShift)&&const DeepCollectionEquality().equals(other._currentDaysShiftHistory, _currentDaysShiftHistory)&&(identical(other.fetchCurrentDaysShiftHistoryStatus, fetchCurrentDaysShiftHistoryStatus) || other.fetchCurrentDaysShiftHistoryStatus == fetchCurrentDaysShiftHistoryStatus)&&(identical(other.fetchDaysShiftHistoryError, fetchDaysShiftHistoryError) || other.fetchDaysShiftHistoryError == fetchDaysShiftHistoryError)&&const DeepCollectionEquality().equals(other._allShiftHistory, _allShiftHistory)&&(identical(other.fetchAllShiftHistoryStatus, fetchAllShiftHistoryStatus) || other.fetchAllShiftHistoryStatus == fetchAllShiftHistoryStatus)&&(identical(other.fetchAllShiftHistoryError, fetchAllShiftHistoryError) || other.fetchAllShiftHistoryError == fetchAllShiftHistoryError)&&(identical(other.hasActiveShift, hasActiveShift) || other.hasActiveShift == hasActiveShift)&&(identical(other.fetchHasActiveShiftStatus, fetchHasActiveShiftStatus) || other.fetchHasActiveShiftStatus == fetchHasActiveShiftStatus)&&(identical(other.fetchHasActiveShiftError, fetchHasActiveShiftError) || other.fetchHasActiveShiftError == fetchHasActiveShiftError)&&(identical(other.startShiftStatus, startShiftStatus) || other.startShiftStatus == startShiftStatus)&&(identical(other.startShiftError, startShiftError) || other.startShiftError == startShiftError)&&(identical(other.endShiftStatus, endShiftStatus) || other.endShiftStatus == endShiftStatus)&&(identical(other.endShiftError, endShiftError) || other.endShiftError == endShiftError)&&(identical(other.geoLocationStatus, geoLocationStatus) || other.geoLocationStatus == geoLocationStatus)&&(identical(other.geoRadiusStatus, geoRadiusStatus) || other.geoRadiusStatus == geoRadiusStatus)&&(identical(other.showStartShiftButton, showStartShiftButton) || other.showStartShiftButton == showStartShiftButton)&&(identical(other.showEndShiftButton, showEndShiftButton) || other.showEndShiftButton == showEndShiftButton)&&(identical(other.shiftMessaging, shiftMessaging) || other.shiftMessaging == shiftMessaging));
}


@override
int get hashCode => Object.hashAll([runtimeType,currentStation,currentShift,activeShift,const DeepCollectionEquality().hash(_currentDaysShiftHistory),fetchCurrentDaysShiftHistoryStatus,fetchDaysShiftHistoryError,const DeepCollectionEquality().hash(_allShiftHistory),fetchAllShiftHistoryStatus,fetchAllShiftHistoryError,hasActiveShift,fetchHasActiveShiftStatus,fetchHasActiveShiftError,startShiftStatus,startShiftError,endShiftStatus,endShiftError,geoLocationStatus,geoRadiusStatus,showStartShiftButton,showEndShiftButton,shiftMessaging]);

@override
String toString() {
  return 'ShiftState(currentStation: $currentStation, currentShift: $currentShift, activeShift: $activeShift, currentDaysShiftHistory: $currentDaysShiftHistory, fetchCurrentDaysShiftHistoryStatus: $fetchCurrentDaysShiftHistoryStatus, fetchDaysShiftHistoryError: $fetchDaysShiftHistoryError, allShiftHistory: $allShiftHistory, fetchAllShiftHistoryStatus: $fetchAllShiftHistoryStatus, fetchAllShiftHistoryError: $fetchAllShiftHistoryError, hasActiveShift: $hasActiveShift, fetchHasActiveShiftStatus: $fetchHasActiveShiftStatus, fetchHasActiveShiftError: $fetchHasActiveShiftError, startShiftStatus: $startShiftStatus, startShiftError: $startShiftError, endShiftStatus: $endShiftStatus, endShiftError: $endShiftError, geoLocationStatus: $geoLocationStatus, geoRadiusStatus: $geoRadiusStatus, showStartShiftButton: $showStartShiftButton, showEndShiftButton: $showEndShiftButton, shiftMessaging: $shiftMessaging)';
}


}

/// @nodoc
abstract mixin class _$ShiftStateCopyWith<$Res> implements $ShiftStateCopyWith<$Res> {
  factory _$ShiftStateCopyWith(_ShiftState value, $Res Function(_ShiftState) _then) = __$ShiftStateCopyWithImpl;
@override @useResult
$Res call({
 Station? currentStation, Shift? currentShift, ShiftHistory? activeShift, List<ShiftHistory>? currentDaysShiftHistory, AppStatus? fetchCurrentDaysShiftHistoryStatus, String? fetchDaysShiftHistoryError, List<ShiftHistory>? allShiftHistory, AppStatus? fetchAllShiftHistoryStatus, String? fetchAllShiftHistoryError, bool? hasActiveShift, AppStatus? fetchHasActiveShiftStatus, String? fetchHasActiveShiftError, AppStatus? startShiftStatus, String? startShiftError, AppStatus? endShiftStatus, String? endShiftError, AppStatus? geoLocationStatus, AppStatus? geoRadiusStatus, bool? showStartShiftButton, bool? showEndShiftButton, String? shiftMessaging
});


@override $StationCopyWith<$Res>? get currentStation;@override $ShiftCopyWith<$Res>? get currentShift;@override $ShiftHistoryCopyWith<$Res>? get activeShift;

}
/// @nodoc
class __$ShiftStateCopyWithImpl<$Res>
    implements _$ShiftStateCopyWith<$Res> {
  __$ShiftStateCopyWithImpl(this._self, this._then);

  final _ShiftState _self;
  final $Res Function(_ShiftState) _then;

/// Create a copy of ShiftState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentStation = freezed,Object? currentShift = freezed,Object? activeShift = freezed,Object? currentDaysShiftHistory = freezed,Object? fetchCurrentDaysShiftHistoryStatus = freezed,Object? fetchDaysShiftHistoryError = freezed,Object? allShiftHistory = freezed,Object? fetchAllShiftHistoryStatus = freezed,Object? fetchAllShiftHistoryError = freezed,Object? hasActiveShift = freezed,Object? fetchHasActiveShiftStatus = freezed,Object? fetchHasActiveShiftError = freezed,Object? startShiftStatus = freezed,Object? startShiftError = freezed,Object? endShiftStatus = freezed,Object? endShiftError = freezed,Object? geoLocationStatus = freezed,Object? geoRadiusStatus = freezed,Object? showStartShiftButton = freezed,Object? showEndShiftButton = freezed,Object? shiftMessaging = freezed,}) {
  return _then(_ShiftState(
currentStation: freezed == currentStation ? _self.currentStation : currentStation // ignore: cast_nullable_to_non_nullable
as Station?,currentShift: freezed == currentShift ? _self.currentShift : currentShift // ignore: cast_nullable_to_non_nullable
as Shift?,activeShift: freezed == activeShift ? _self.activeShift : activeShift // ignore: cast_nullable_to_non_nullable
as ShiftHistory?,currentDaysShiftHistory: freezed == currentDaysShiftHistory ? _self._currentDaysShiftHistory : currentDaysShiftHistory // ignore: cast_nullable_to_non_nullable
as List<ShiftHistory>?,fetchCurrentDaysShiftHistoryStatus: freezed == fetchCurrentDaysShiftHistoryStatus ? _self.fetchCurrentDaysShiftHistoryStatus : fetchCurrentDaysShiftHistoryStatus // ignore: cast_nullable_to_non_nullable
as AppStatus?,fetchDaysShiftHistoryError: freezed == fetchDaysShiftHistoryError ? _self.fetchDaysShiftHistoryError : fetchDaysShiftHistoryError // ignore: cast_nullable_to_non_nullable
as String?,allShiftHistory: freezed == allShiftHistory ? _self._allShiftHistory : allShiftHistory // ignore: cast_nullable_to_non_nullable
as List<ShiftHistory>?,fetchAllShiftHistoryStatus: freezed == fetchAllShiftHistoryStatus ? _self.fetchAllShiftHistoryStatus : fetchAllShiftHistoryStatus // ignore: cast_nullable_to_non_nullable
as AppStatus?,fetchAllShiftHistoryError: freezed == fetchAllShiftHistoryError ? _self.fetchAllShiftHistoryError : fetchAllShiftHistoryError // ignore: cast_nullable_to_non_nullable
as String?,hasActiveShift: freezed == hasActiveShift ? _self.hasActiveShift : hasActiveShift // ignore: cast_nullable_to_non_nullable
as bool?,fetchHasActiveShiftStatus: freezed == fetchHasActiveShiftStatus ? _self.fetchHasActiveShiftStatus : fetchHasActiveShiftStatus // ignore: cast_nullable_to_non_nullable
as AppStatus?,fetchHasActiveShiftError: freezed == fetchHasActiveShiftError ? _self.fetchHasActiveShiftError : fetchHasActiveShiftError // ignore: cast_nullable_to_non_nullable
as String?,startShiftStatus: freezed == startShiftStatus ? _self.startShiftStatus : startShiftStatus // ignore: cast_nullable_to_non_nullable
as AppStatus?,startShiftError: freezed == startShiftError ? _self.startShiftError : startShiftError // ignore: cast_nullable_to_non_nullable
as String?,endShiftStatus: freezed == endShiftStatus ? _self.endShiftStatus : endShiftStatus // ignore: cast_nullable_to_non_nullable
as AppStatus?,endShiftError: freezed == endShiftError ? _self.endShiftError : endShiftError // ignore: cast_nullable_to_non_nullable
as String?,geoLocationStatus: freezed == geoLocationStatus ? _self.geoLocationStatus : geoLocationStatus // ignore: cast_nullable_to_non_nullable
as AppStatus?,geoRadiusStatus: freezed == geoRadiusStatus ? _self.geoRadiusStatus : geoRadiusStatus // ignore: cast_nullable_to_non_nullable
as AppStatus?,showStartShiftButton: freezed == showStartShiftButton ? _self.showStartShiftButton : showStartShiftButton // ignore: cast_nullable_to_non_nullable
as bool?,showEndShiftButton: freezed == showEndShiftButton ? _self.showEndShiftButton : showEndShiftButton // ignore: cast_nullable_to_non_nullable
as bool?,shiftMessaging: freezed == shiftMessaging ? _self.shiftMessaging : shiftMessaging // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ShiftState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$StationCopyWith<$Res>? get currentStation {
    if (_self.currentStation == null) {
    return null;
  }

  return $StationCopyWith<$Res>(_self.currentStation!, (value) {
    return _then(_self.copyWith(currentStation: value));
  });
}/// Create a copy of ShiftState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ShiftCopyWith<$Res>? get currentShift {
    if (_self.currentShift == null) {
    return null;
  }

  return $ShiftCopyWith<$Res>(_self.currentShift!, (value) {
    return _then(_self.copyWith(currentShift: value));
  });
}/// Create a copy of ShiftState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ShiftHistoryCopyWith<$Res>? get activeShift {
    if (_self.activeShift == null) {
    return null;
  }

  return $ShiftHistoryCopyWith<$Res>(_self.activeShift!, (value) {
    return _then(_self.copyWith(activeShift: value));
  });
}
}

// dart format on
