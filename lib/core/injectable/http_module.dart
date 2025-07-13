import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:simple_connection_checker/simple_connection_checker.dart';
import 'package:zembo_agent_app/core/config/api_constants.dart';
import 'package:zembo_agent_app/core/utils/dio_util.dart';
import 'package:zembo_agent_app/injection.dart';

///
@module
abstract class DioModule {
  ///
  @prod
  @Named(kProdBaseUrl)
  String provideProdBaseUrl() =>
      dotenv.get(kProdBaseUrl, fallback: 'NO_BASEURL_CONFIGURATION');

  ///
  @staging
  @Named(kStagingBaseUrl)
  String provideStagingBaseUrl() =>
      dotenv.get(kStagingBaseUrl, fallback: 'NO_BASEURL_CONFIGURATION');

  ///
  @dev
  @Named(kDevBaseUrl)
  String provideDevBaseUrl() =>
      dotenv.get(kDevBaseUrl, fallback: 'NO_BASEURL_CONFIGURATION');

  ///
  @prod
  @lazySingleton
  BaseOptions provideProdBaseOptions(
    @Named(kProdBaseUrl) String url,
  ) => BaseOptions(
    baseUrl: url,
    receiveDataWhenStatusError: true,
    connectTimeout: const Duration(
      seconds: 4,
    ),
    sendTimeout: const Duration(
      seconds: 4,
    ),
    receiveTimeout: const Duration(
      seconds: 4,
    ),
  );

  @staging
  @lazySingleton
  BaseOptions provideStagingBaseOptions(
    @Named(kStagingBaseUrl) String url,
  ) => BaseOptions(
    baseUrl: url,
    receiveDataWhenStatusError: true,
    connectTimeout: const Duration(
      seconds: 4,
    ),
    sendTimeout: const Duration(
      seconds: 4,
    ),
    receiveTimeout: const Duration(
      seconds: 4,
    ),
  );

  @dev
  @lazySingleton
  BaseOptions provideDevBaseOptions(
    @Named(kDevBaseUrl) String url,
  ) => BaseOptions(
    baseUrl: url,
    receiveDataWhenStatusError: true,
    connectTimeout: const Duration(
      seconds: 4,
    ),
    sendTimeout: const Duration(
      seconds: 4,
    ),
    receiveTimeout: const Duration(
      seconds: 4,
    ),
  );

  ///
  @lazySingleton
  Dio dio(
    BaseOptions options,
    FlutterSecureStorage storage,
    SimpleConnectionChecker simpleConnectionChecker,
  ) => initializeDio(options, storage);
}
