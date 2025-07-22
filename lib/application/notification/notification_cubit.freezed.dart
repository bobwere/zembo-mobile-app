// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NotificationState {

// fetch notifications
 List<AppNotification>? get notifications; AppStatus? get fetchNotificationsStatus; String? get fetchNotificationsError;//
 AppStatus? get markNotificationAsReadStatus; String? get markNotificationAsReadError;//
 String? get viewButtonClickedForNotificationId;
/// Create a copy of NotificationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationStateCopyWith<NotificationState> get copyWith => _$NotificationStateCopyWithImpl<NotificationState>(this as NotificationState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationState&&const DeepCollectionEquality().equals(other.notifications, notifications)&&(identical(other.fetchNotificationsStatus, fetchNotificationsStatus) || other.fetchNotificationsStatus == fetchNotificationsStatus)&&(identical(other.fetchNotificationsError, fetchNotificationsError) || other.fetchNotificationsError == fetchNotificationsError)&&(identical(other.markNotificationAsReadStatus, markNotificationAsReadStatus) || other.markNotificationAsReadStatus == markNotificationAsReadStatus)&&(identical(other.markNotificationAsReadError, markNotificationAsReadError) || other.markNotificationAsReadError == markNotificationAsReadError)&&(identical(other.viewButtonClickedForNotificationId, viewButtonClickedForNotificationId) || other.viewButtonClickedForNotificationId == viewButtonClickedForNotificationId));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(notifications),fetchNotificationsStatus,fetchNotificationsError,markNotificationAsReadStatus,markNotificationAsReadError,viewButtonClickedForNotificationId);

@override
String toString() {
  return 'NotificationState(notifications: $notifications, fetchNotificationsStatus: $fetchNotificationsStatus, fetchNotificationsError: $fetchNotificationsError, markNotificationAsReadStatus: $markNotificationAsReadStatus, markNotificationAsReadError: $markNotificationAsReadError, viewButtonClickedForNotificationId: $viewButtonClickedForNotificationId)';
}


}

/// @nodoc
abstract mixin class $NotificationStateCopyWith<$Res>  {
  factory $NotificationStateCopyWith(NotificationState value, $Res Function(NotificationState) _then) = _$NotificationStateCopyWithImpl;
@useResult
$Res call({
 List<AppNotification>? notifications, AppStatus? fetchNotificationsStatus, String? fetchNotificationsError, AppStatus? markNotificationAsReadStatus, String? markNotificationAsReadError, String? viewButtonClickedForNotificationId
});




}
/// @nodoc
class _$NotificationStateCopyWithImpl<$Res>
    implements $NotificationStateCopyWith<$Res> {
  _$NotificationStateCopyWithImpl(this._self, this._then);

  final NotificationState _self;
  final $Res Function(NotificationState) _then;

/// Create a copy of NotificationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? notifications = freezed,Object? fetchNotificationsStatus = freezed,Object? fetchNotificationsError = freezed,Object? markNotificationAsReadStatus = freezed,Object? markNotificationAsReadError = freezed,Object? viewButtonClickedForNotificationId = freezed,}) {
  return _then(_self.copyWith(
notifications: freezed == notifications ? _self.notifications : notifications // ignore: cast_nullable_to_non_nullable
as List<AppNotification>?,fetchNotificationsStatus: freezed == fetchNotificationsStatus ? _self.fetchNotificationsStatus : fetchNotificationsStatus // ignore: cast_nullable_to_non_nullable
as AppStatus?,fetchNotificationsError: freezed == fetchNotificationsError ? _self.fetchNotificationsError : fetchNotificationsError // ignore: cast_nullable_to_non_nullable
as String?,markNotificationAsReadStatus: freezed == markNotificationAsReadStatus ? _self.markNotificationAsReadStatus : markNotificationAsReadStatus // ignore: cast_nullable_to_non_nullable
as AppStatus?,markNotificationAsReadError: freezed == markNotificationAsReadError ? _self.markNotificationAsReadError : markNotificationAsReadError // ignore: cast_nullable_to_non_nullable
as String?,viewButtonClickedForNotificationId: freezed == viewButtonClickedForNotificationId ? _self.viewButtonClickedForNotificationId : viewButtonClickedForNotificationId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [NotificationState].
extension NotificationStatePatterns on NotificationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationState value)  $default,){
final _that = this;
switch (_that) {
case _NotificationState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationState value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<AppNotification>? notifications,  AppStatus? fetchNotificationsStatus,  String? fetchNotificationsError,  AppStatus? markNotificationAsReadStatus,  String? markNotificationAsReadError,  String? viewButtonClickedForNotificationId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationState() when $default != null:
return $default(_that.notifications,_that.fetchNotificationsStatus,_that.fetchNotificationsError,_that.markNotificationAsReadStatus,_that.markNotificationAsReadError,_that.viewButtonClickedForNotificationId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<AppNotification>? notifications,  AppStatus? fetchNotificationsStatus,  String? fetchNotificationsError,  AppStatus? markNotificationAsReadStatus,  String? markNotificationAsReadError,  String? viewButtonClickedForNotificationId)  $default,) {final _that = this;
switch (_that) {
case _NotificationState():
return $default(_that.notifications,_that.fetchNotificationsStatus,_that.fetchNotificationsError,_that.markNotificationAsReadStatus,_that.markNotificationAsReadError,_that.viewButtonClickedForNotificationId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<AppNotification>? notifications,  AppStatus? fetchNotificationsStatus,  String? fetchNotificationsError,  AppStatus? markNotificationAsReadStatus,  String? markNotificationAsReadError,  String? viewButtonClickedForNotificationId)?  $default,) {final _that = this;
switch (_that) {
case _NotificationState() when $default != null:
return $default(_that.notifications,_that.fetchNotificationsStatus,_that.fetchNotificationsError,_that.markNotificationAsReadStatus,_that.markNotificationAsReadError,_that.viewButtonClickedForNotificationId);case _:
  return null;

}
}

}

/// @nodoc


class _NotificationState implements NotificationState {
   _NotificationState({final  List<AppNotification>? notifications, this.fetchNotificationsStatus, this.fetchNotificationsError, this.markNotificationAsReadStatus, this.markNotificationAsReadError, this.viewButtonClickedForNotificationId}): _notifications = notifications;
  

// fetch notifications
 final  List<AppNotification>? _notifications;
// fetch notifications
@override List<AppNotification>? get notifications {
  final value = _notifications;
  if (value == null) return null;
  if (_notifications is EqualUnmodifiableListView) return _notifications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  AppStatus? fetchNotificationsStatus;
@override final  String? fetchNotificationsError;
//
@override final  AppStatus? markNotificationAsReadStatus;
@override final  String? markNotificationAsReadError;
//
@override final  String? viewButtonClickedForNotificationId;

/// Create a copy of NotificationState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationStateCopyWith<_NotificationState> get copyWith => __$NotificationStateCopyWithImpl<_NotificationState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationState&&const DeepCollectionEquality().equals(other._notifications, _notifications)&&(identical(other.fetchNotificationsStatus, fetchNotificationsStatus) || other.fetchNotificationsStatus == fetchNotificationsStatus)&&(identical(other.fetchNotificationsError, fetchNotificationsError) || other.fetchNotificationsError == fetchNotificationsError)&&(identical(other.markNotificationAsReadStatus, markNotificationAsReadStatus) || other.markNotificationAsReadStatus == markNotificationAsReadStatus)&&(identical(other.markNotificationAsReadError, markNotificationAsReadError) || other.markNotificationAsReadError == markNotificationAsReadError)&&(identical(other.viewButtonClickedForNotificationId, viewButtonClickedForNotificationId) || other.viewButtonClickedForNotificationId == viewButtonClickedForNotificationId));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_notifications),fetchNotificationsStatus,fetchNotificationsError,markNotificationAsReadStatus,markNotificationAsReadError,viewButtonClickedForNotificationId);

@override
String toString() {
  return 'NotificationState(notifications: $notifications, fetchNotificationsStatus: $fetchNotificationsStatus, fetchNotificationsError: $fetchNotificationsError, markNotificationAsReadStatus: $markNotificationAsReadStatus, markNotificationAsReadError: $markNotificationAsReadError, viewButtonClickedForNotificationId: $viewButtonClickedForNotificationId)';
}


}

/// @nodoc
abstract mixin class _$NotificationStateCopyWith<$Res> implements $NotificationStateCopyWith<$Res> {
  factory _$NotificationStateCopyWith(_NotificationState value, $Res Function(_NotificationState) _then) = __$NotificationStateCopyWithImpl;
@override @useResult
$Res call({
 List<AppNotification>? notifications, AppStatus? fetchNotificationsStatus, String? fetchNotificationsError, AppStatus? markNotificationAsReadStatus, String? markNotificationAsReadError, String? viewButtonClickedForNotificationId
});




}
/// @nodoc
class __$NotificationStateCopyWithImpl<$Res>
    implements _$NotificationStateCopyWith<$Res> {
  __$NotificationStateCopyWithImpl(this._self, this._then);

  final _NotificationState _self;
  final $Res Function(_NotificationState) _then;

/// Create a copy of NotificationState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? notifications = freezed,Object? fetchNotificationsStatus = freezed,Object? fetchNotificationsError = freezed,Object? markNotificationAsReadStatus = freezed,Object? markNotificationAsReadError = freezed,Object? viewButtonClickedForNotificationId = freezed,}) {
  return _then(_NotificationState(
notifications: freezed == notifications ? _self._notifications : notifications // ignore: cast_nullable_to_non_nullable
as List<AppNotification>?,fetchNotificationsStatus: freezed == fetchNotificationsStatus ? _self.fetchNotificationsStatus : fetchNotificationsStatus // ignore: cast_nullable_to_non_nullable
as AppStatus?,fetchNotificationsError: freezed == fetchNotificationsError ? _self.fetchNotificationsError : fetchNotificationsError // ignore: cast_nullable_to_non_nullable
as String?,markNotificationAsReadStatus: freezed == markNotificationAsReadStatus ? _self.markNotificationAsReadStatus : markNotificationAsReadStatus // ignore: cast_nullable_to_non_nullable
as AppStatus?,markNotificationAsReadError: freezed == markNotificationAsReadError ? _self.markNotificationAsReadError : markNotificationAsReadError // ignore: cast_nullable_to_non_nullable
as String?,viewButtonClickedForNotificationId: freezed == viewButtonClickedForNotificationId ? _self.viewButtonClickedForNotificationId : viewButtonClickedForNotificationId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
