import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:zembo_agent_app/application/auth/i_auth_facade.dart';
import 'package:zembo_agent_app/core/config/api_constants.dart';
import 'package:zembo_agent_app/domain/user/user.dart';

@LazySingleton(as: IAuthFacade)
class AuthFacade implements IAuthFacade {
  AuthFacade(this._dio, this._storage);

  final Dio _dio;
  final FlutterSecureStorage _storage;

  @override
  Future<User> getSignedInUser() async {
    try {
      final response = await _dio.get<dynamic>(
        '/users',
      );

      final user = response.data['data'] as Map<String, dynamic>;

      return User.fromJson(user);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signInWithUsernameAndPassword({
    required String username,
    required String password,
  }) async {
    try {
      final response = await _dio.post<dynamic>(
        '/auth/signin',
        data: {
          'username': username,
          'password': password,
        },
      );

      final token = response.data['data']['accessToken'] as String;
      final refreshToken = response.data['data']['refreshToken'] as String;

      await _storage.write(key: accessToken, value: token);
      await _storage.write(key: refreshToken, value: refreshToken);

      return;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    await _storage.deleteAll();
    return;
  }

  @override
  Future<String?> getToken() async {
    final token = await _storage.read(key: accessToken);
    return token;
  }
}
