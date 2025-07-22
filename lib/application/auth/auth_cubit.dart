import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:simple_connection_checker/simple_connection_checker.dart';
import 'package:zembo_agent_app/application/auth/i_auth_facade.dart';
import 'package:zembo_agent_app/application/local_db/i_localdb_facade.dart';
import 'package:zembo_agent_app/core/constants/enum.dart';
import 'package:zembo_agent_app/domain/user/user.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authFacade, this._localDBFacade) : super(AuthState.initial());

  final IAuthFacade _authFacade;
  final ILocalDBFacade _localDBFacade;

  Future<void> initialize() async {
    final token = await _authFacade.getToken();

    if (token == null) {
      emit(state.copyWith.call(isAuthenticated: false));
      return;
    }

    await getUserProfile();

    if (state.user == User.initial()) {
      emit(state.copyWith.call(isAuthenticated: false));
      return;
    }

    emit(state.copyWith.call(isAuthenticated: true));
  }

  Future<void> getUserProfile() async {
    final isConnected = await SimpleConnectionChecker.isConnectedToInternet();

    if (!isConnected) {
      final user = await _localDBFacade.getUser();
      emit(state.copyWith.call(user: user));
      return;
    }

    final user = await _authFacade.getSignedInUser();
    emit(state.copyWith.call(user: user));
  }

  Future<void> signInWithUsernameAndPassword({
    required String username,
    required String password,
  }) async {
    try {
      emit(state.copyWith.call(signInFormStatus: AppStatus.submitting));
      await _authFacade.signInWithUsernameAndPassword(
        username: username,
        password: password,
      );

      await getUserProfile();

      if (state.user != User.initial() && state.user != null) {
        await _localDBFacade.saveUser(state.user!);
      }

      emit(state.copyWith.call(signInFormStatus: AppStatus.success));
    } on DioException catch (e) {
      emit(
        state.copyWith.call(
          signInError: e.response?.data['error']['message'] as String?,
          signInFormStatus: AppStatus.failure,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith.call(
          signInError: 'An error occurred',
          signInFormStatus: AppStatus.failure,
        ),
      );
    }
  }

  Future<void> signOut() async {
    emit(state.copyWith.call(isAuthenticated: false));
    await _authFacade.signOut();
    emit(AuthState.initial());
  }
}
