// Package imports:
// ignore_for_file: cascade_invocations, avoid_single_cascade_in_expression_statements, avoid_catches_without_on_clauses, lines_longer_than_80_chars
import 'dart:async';

import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:simple_connection_checker/simple_connection_checker.dart';
import 'package:zembo_agent_app/core/config/api_constants.dart';
import 'package:zembo_agent_app/core/constants/failure.dart';
import 'package:zembo_agent_app/core/utils/sentry_util.dart';

///
Dio initializeDio(
  BaseOptions options,
  FlutterSecureStorage storage,
) {
  final dio = Dio(options);

  dio
    ..interceptors.addAll([
      /// Handles api calls error, if no error message from response we
      /// show a generic message
      AppInterceptors(dio, storage),
      RetryInterceptor(
        dio: dio,
        retries: 1,
        logPrint: print, // specify log function (optional)
        retryDelays: const [
          // set delays between retries (optional)
          Duration(seconds: 1), // wait 1 sec before first retry
        ],
      ),

      /// used for debug to print results to terminal
    ]);

  return dio;
}

///
class AppInterceptors extends Interceptor {
  ///
  AppInterceptors(this.dio, this.storage);

  ///
  final Dio dio;
  final FlutterSecureStorage storage;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await storage.read(key: accessToken) ?? '';

    if (token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    options.headers['Content-Type'] = 'application/json;charset=UTF-8';

    final isConnected = await SimpleConnectionChecker.isConnectedToInternet();

    if (isConnected == false) {
      final noInternetResponse = Response<dynamic>(requestOptions: options)
        ..statusCode = 503
        ..data = <String, dynamic>{
          'data': {'error': 'No or poor internet connection.'},
        };

      return handler.reject(
        NoInternetExeption(r: options, response: noInternetResponse),
      );
    }

    return handler.next(options);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    super.onResponse(response, handler);
    return;
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final statusCode = err.response?.statusCode;
    final response = err.response;

    try {
      unawaited(
        reportErrorToSentry(
          additionalInfo: {
            'context': 'dio_util.dart',
          },
          stacktace: {},
          response: response,
          route: '',
          exception: err.message ?? '',
        ),
      );
    } catch (e) {
      //pass
    }

    if (statusCode == 400) {
      return handler.next(
        err.copyWith(
          error: BadRequestFailure(),
        ),
      );
    }

    if (statusCode == 401) {
      return handler.next(
        err.copyWith(
          error: UnauthorizedFailure(),
        ),
      );
    }

    if (statusCode == 403) {
      return handler.next(
        err.copyWith(
          error: ForbiddenFailure(),
        ),
      );
    }

    if (statusCode == 404) {
      return handler.next(
        err.copyWith(
          error: NotFoundFailure(),
        ),
      );
    }

    if (statusCode == 409) {
      return handler.next(
        err.copyWith(
          error: ConflictFailure(),
        ),
      );
    }

    if (statusCode == 405) {
      return handler.next(
        err.copyWith(
          error: MethodNotAllowedFailure(),
        ),
      );
    }

    if (statusCode == 422) {
      return handler.next(
        err.copyWith(
          error: UnprocessableEntityFailure(),
        ),
      );
    }

    if (statusCode == 429) {
      return handler.next(
        err.copyWith(
          error: TooManyRequestFailure(),
        ),
      );
    }

    if (err.type == DioExceptionType.connectionError ||
        err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.sendTimeout) {
      return handler.next(
        err.copyWith(error: TimeoutFailure()),
      );
    }

    if (statusCode == 500) {
      return handler.next(
        err.copyWith(error: InternalServerErrorFailure()),
      );
    }

    if (statusCode == 501) {
      return handler.next(
        err.copyWith(error: NotImplementedFailure()),
      );
    }

    if (statusCode == 502) {
      return handler.next(
        err.copyWith(error: BadGatewayFailure()),
      );
    }

    if (statusCode == 503) {
      return handler.next(
        err.copyWith(error: NoInternetFailure()),
      );
    }

    if (statusCode.toString().startsWith('4') ||
        statusCode.toString().startsWith('5')) {
      return handler.next(
        err.copyWith(error: UnknownFailure()),
      );
    }

    return handler.next(err);
  }
}

class NoInternetExeption extends DioException {
  NoInternetExeption({
    required RequestOptions r,
    required super.response,
  }) : super(
         requestOptions: r,
         error: NoInternetFailure(),
       );

  @override
  String toString() {
    return 'No or poor internet connection.';
  }
}

Failure handleApiError(Object e) {
  // check if error is a network error
  if (e is PlatformException && e.code == 'network_error') {
    return NoInternetFailure();
  }

  // checck if its a Dioexeption and is error property is a failure
  if (e is DioException && e.error is Failure) {
    return e.error! as Failure;
  }

  // check if error is a failure
  if (e is Failure) {
    return e;
  }

  // return default failure
  return UnknownFailure();
}
