import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zembo_agent_app/application/auth/i_auth_facade.dart';
import 'package:zembo_agent_app/core/constants/enum.dart';
import 'package:zembo_agent_app/domain/user/user.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authFacade) : super(AuthState.initial());

  final IAuthFacade _authFacade;

  Future<void> initialize() async {
    final token = await _authFacade.getToken();

    await getUserProfile();

    if (token == null) {
      emit(state.copyWith.call(isAuthenticated: false));
      return;
    }

    if (state.user == null) {
      emit(state.copyWith.call(isAuthenticated: false));
      return;
    }

    emit(state.copyWith.call(isAuthenticated: true));
  }

  Future<void> getUserProfile() async {
    final user = await _authFacade.getSignedInUser();
    emit(state.copyWith.call(user: user));
  }

  Future<void> signInWithUsernameAndPassword({
    required String username,
    required String password,
  }) async {
    await _authFacade.signInWithUsernameAndPassword(
      username: username,
      password: password,
    );
  }

  Future<void> signOut() async {
    emit(state.copyWith.call(isAuthenticated: false));
    await _authFacade.signOut();
    emit(AuthState.initial());
  }
}
