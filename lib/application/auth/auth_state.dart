part of 'auth_cubit.dart';

@freezed
abstract class AuthState with _$AuthState {
  factory AuthState({
    // sign in state
    String? signInUsername,
    List<String>? signInEmailErrors,
    String? signInPassword,
    List<String>? signInPasswordError,
    AppStatus? signInFormStatus,
    String? signInError,

    //
    bool? isAuthenticated,
    User? user,
  }) = _AuthState;

  factory AuthState.initial() => AuthState(
    signInEmailErrors: [],
    signInPasswordError: [],
    signInFormStatus: AppStatus.initial,
  );
}
