// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthState {

// sign in state
 String? get signInUsername; List<String>? get signInEmailErrors; String? get signInPassword; List<String>? get signInPasswordError; AppStatus? get signInFormStatus; String? get signInError;//
 bool? get isAuthenticated; User? get user;
/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthStateCopyWith<AuthState> get copyWith => _$AuthStateCopyWithImpl<AuthState>(this as AuthState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState&&(identical(other.signInUsername, signInUsername) || other.signInUsername == signInUsername)&&const DeepCollectionEquality().equals(other.signInEmailErrors, signInEmailErrors)&&(identical(other.signInPassword, signInPassword) || other.signInPassword == signInPassword)&&const DeepCollectionEquality().equals(other.signInPasswordError, signInPasswordError)&&(identical(other.signInFormStatus, signInFormStatus) || other.signInFormStatus == signInFormStatus)&&(identical(other.signInError, signInError) || other.signInError == signInError)&&(identical(other.isAuthenticated, isAuthenticated) || other.isAuthenticated == isAuthenticated)&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,signInUsername,const DeepCollectionEquality().hash(signInEmailErrors),signInPassword,const DeepCollectionEquality().hash(signInPasswordError),signInFormStatus,signInError,isAuthenticated,user);

@override
String toString() {
  return 'AuthState(signInUsername: $signInUsername, signInEmailErrors: $signInEmailErrors, signInPassword: $signInPassword, signInPasswordError: $signInPasswordError, signInFormStatus: $signInFormStatus, signInError: $signInError, isAuthenticated: $isAuthenticated, user: $user)';
}


}

/// @nodoc
abstract mixin class $AuthStateCopyWith<$Res>  {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) _then) = _$AuthStateCopyWithImpl;
@useResult
$Res call({
 String? signInUsername, List<String>? signInEmailErrors, String? signInPassword, List<String>? signInPasswordError, AppStatus? signInFormStatus, String? signInError, bool? isAuthenticated, User? user
});


$UserCopyWith<$Res>? get user;

}
/// @nodoc
class _$AuthStateCopyWithImpl<$Res>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._self, this._then);

  final AuthState _self;
  final $Res Function(AuthState) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? signInUsername = freezed,Object? signInEmailErrors = freezed,Object? signInPassword = freezed,Object? signInPasswordError = freezed,Object? signInFormStatus = freezed,Object? signInError = freezed,Object? isAuthenticated = freezed,Object? user = freezed,}) {
  return _then(_self.copyWith(
signInUsername: freezed == signInUsername ? _self.signInUsername : signInUsername // ignore: cast_nullable_to_non_nullable
as String?,signInEmailErrors: freezed == signInEmailErrors ? _self.signInEmailErrors : signInEmailErrors // ignore: cast_nullable_to_non_nullable
as List<String>?,signInPassword: freezed == signInPassword ? _self.signInPassword : signInPassword // ignore: cast_nullable_to_non_nullable
as String?,signInPasswordError: freezed == signInPasswordError ? _self.signInPasswordError : signInPasswordError // ignore: cast_nullable_to_non_nullable
as List<String>?,signInFormStatus: freezed == signInFormStatus ? _self.signInFormStatus : signInFormStatus // ignore: cast_nullable_to_non_nullable
as AppStatus?,signInError: freezed == signInError ? _self.signInError : signInError // ignore: cast_nullable_to_non_nullable
as String?,isAuthenticated: freezed == isAuthenticated ? _self.isAuthenticated : isAuthenticated // ignore: cast_nullable_to_non_nullable
as bool?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User?,
  ));
}
/// Create a copy of AuthState
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
}
}


/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthState value)  $default,){
final _that = this;
switch (_that) {
case _AuthState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthState value)?  $default,){
final _that = this;
switch (_that) {
case _AuthState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? signInUsername,  List<String>? signInEmailErrors,  String? signInPassword,  List<String>? signInPasswordError,  AppStatus? signInFormStatus,  String? signInError,  bool? isAuthenticated,  User? user)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthState() when $default != null:
return $default(_that.signInUsername,_that.signInEmailErrors,_that.signInPassword,_that.signInPasswordError,_that.signInFormStatus,_that.signInError,_that.isAuthenticated,_that.user);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? signInUsername,  List<String>? signInEmailErrors,  String? signInPassword,  List<String>? signInPasswordError,  AppStatus? signInFormStatus,  String? signInError,  bool? isAuthenticated,  User? user)  $default,) {final _that = this;
switch (_that) {
case _AuthState():
return $default(_that.signInUsername,_that.signInEmailErrors,_that.signInPassword,_that.signInPasswordError,_that.signInFormStatus,_that.signInError,_that.isAuthenticated,_that.user);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? signInUsername,  List<String>? signInEmailErrors,  String? signInPassword,  List<String>? signInPasswordError,  AppStatus? signInFormStatus,  String? signInError,  bool? isAuthenticated,  User? user)?  $default,) {final _that = this;
switch (_that) {
case _AuthState() when $default != null:
return $default(_that.signInUsername,_that.signInEmailErrors,_that.signInPassword,_that.signInPasswordError,_that.signInFormStatus,_that.signInError,_that.isAuthenticated,_that.user);case _:
  return null;

}
}

}

/// @nodoc


class _AuthState implements AuthState {
   _AuthState({this.signInUsername, final  List<String>? signInEmailErrors, this.signInPassword, final  List<String>? signInPasswordError, this.signInFormStatus, this.signInError, this.isAuthenticated, this.user}): _signInEmailErrors = signInEmailErrors,_signInPasswordError = signInPasswordError;
  

// sign in state
@override final  String? signInUsername;
 final  List<String>? _signInEmailErrors;
@override List<String>? get signInEmailErrors {
  final value = _signInEmailErrors;
  if (value == null) return null;
  if (_signInEmailErrors is EqualUnmodifiableListView) return _signInEmailErrors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? signInPassword;
 final  List<String>? _signInPasswordError;
@override List<String>? get signInPasswordError {
  final value = _signInPasswordError;
  if (value == null) return null;
  if (_signInPasswordError is EqualUnmodifiableListView) return _signInPasswordError;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  AppStatus? signInFormStatus;
@override final  String? signInError;
//
@override final  bool? isAuthenticated;
@override final  User? user;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthStateCopyWith<_AuthState> get copyWith => __$AuthStateCopyWithImpl<_AuthState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthState&&(identical(other.signInUsername, signInUsername) || other.signInUsername == signInUsername)&&const DeepCollectionEquality().equals(other._signInEmailErrors, _signInEmailErrors)&&(identical(other.signInPassword, signInPassword) || other.signInPassword == signInPassword)&&const DeepCollectionEquality().equals(other._signInPasswordError, _signInPasswordError)&&(identical(other.signInFormStatus, signInFormStatus) || other.signInFormStatus == signInFormStatus)&&(identical(other.signInError, signInError) || other.signInError == signInError)&&(identical(other.isAuthenticated, isAuthenticated) || other.isAuthenticated == isAuthenticated)&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,signInUsername,const DeepCollectionEquality().hash(_signInEmailErrors),signInPassword,const DeepCollectionEquality().hash(_signInPasswordError),signInFormStatus,signInError,isAuthenticated,user);

@override
String toString() {
  return 'AuthState(signInUsername: $signInUsername, signInEmailErrors: $signInEmailErrors, signInPassword: $signInPassword, signInPasswordError: $signInPasswordError, signInFormStatus: $signInFormStatus, signInError: $signInError, isAuthenticated: $isAuthenticated, user: $user)';
}


}

/// @nodoc
abstract mixin class _$AuthStateCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$AuthStateCopyWith(_AuthState value, $Res Function(_AuthState) _then) = __$AuthStateCopyWithImpl;
@override @useResult
$Res call({
 String? signInUsername, List<String>? signInEmailErrors, String? signInPassword, List<String>? signInPasswordError, AppStatus? signInFormStatus, String? signInError, bool? isAuthenticated, User? user
});


@override $UserCopyWith<$Res>? get user;

}
/// @nodoc
class __$AuthStateCopyWithImpl<$Res>
    implements _$AuthStateCopyWith<$Res> {
  __$AuthStateCopyWithImpl(this._self, this._then);

  final _AuthState _self;
  final $Res Function(_AuthState) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? signInUsername = freezed,Object? signInEmailErrors = freezed,Object? signInPassword = freezed,Object? signInPasswordError = freezed,Object? signInFormStatus = freezed,Object? signInError = freezed,Object? isAuthenticated = freezed,Object? user = freezed,}) {
  return _then(_AuthState(
signInUsername: freezed == signInUsername ? _self.signInUsername : signInUsername // ignore: cast_nullable_to_non_nullable
as String?,signInEmailErrors: freezed == signInEmailErrors ? _self._signInEmailErrors : signInEmailErrors // ignore: cast_nullable_to_non_nullable
as List<String>?,signInPassword: freezed == signInPassword ? _self.signInPassword : signInPassword // ignore: cast_nullable_to_non_nullable
as String?,signInPasswordError: freezed == signInPasswordError ? _self._signInPasswordError : signInPasswordError // ignore: cast_nullable_to_non_nullable
as List<String>?,signInFormStatus: freezed == signInFormStatus ? _self.signInFormStatus : signInFormStatus // ignore: cast_nullable_to_non_nullable
as AppStatus?,signInError: freezed == signInError ? _self.signInError : signInError // ignore: cast_nullable_to_non_nullable
as String?,isAuthenticated: freezed == isAuthenticated ? _self.isAuthenticated : isAuthenticated // ignore: cast_nullable_to_non_nullable
as bool?,user: freezed == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as User?,
  ));
}

/// Create a copy of AuthState
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
}
}

// dart format on
