import 'package:zembo_agent_app/domain/user/user.dart';

abstract class IAuthFacade {
  Future<User> getSignedInUser();
  Future<String?> getToken();
  Future<void> signInWithUsernameAndPassword({
    required String username,
    required String password,
  });
  Future<void> signOut();
}
