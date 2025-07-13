import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:simple_connection_checker/simple_connection_checker.dart';

///
@module
abstract class UtilityModule {
  ///
  @lazySingleton
  SimpleConnectionChecker get simpleConnectionChecker =>
      SimpleConnectionChecker();

  @lazySingleton
  FlutterSecureStorage get flutterSecureStorage => const FlutterSecureStorage();
}
