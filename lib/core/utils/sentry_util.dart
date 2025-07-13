import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

/// add breadcrumb to [Sentry] errors
Future<void> addSentryBreadcrumb({
  required String message,
  Map<String, dynamic>? additionalInfo,
  SentryLevel? level,
}) async {
  try {
    await Sentry.addBreadcrumb(
      Breadcrumb(
        message: message,
        data: additionalInfo,
        level: level ?? SentryLevel.info,
        timestamp: DateTime.now(),
        category: 'log',
        type: 'debug',
      ),
    );
  } catch (e) {
    //pass
  }
}

/// Reports an error to [Sentry]
Future<dynamic> reportErrorToSentry({
  /// Any exception object for example from a try {...} catch {...} operation
  required Object exception,
  required Object stacktace,

  /// A human readable description of the error
  Hint? hint,
  Map<String, dynamic>? additionalInfo,

  /// Used in cases of HTTP request errors
  Response<dynamic>? response,

  // Should be a derivative of the [AppRoutes class] i.e AppRoutes.loginPage
  String? route,

  /// Variables
  Map<String, dynamic>? variables,
}) async {
  try {
    const storage = FlutterSecureStorage();
    final userID = await storage.read(key: 'userId') ?? '';
    final email = await storage.read(key: 'email') ?? '';

    final info = <String, dynamic>{}
      ..addAll({'exception': exception.toString()});

    if (exception is DioException) {
      final res = exception.response;
      info.addAll(
        <String, dynamic>{
          'method': res?.requestOptions.method,
          'request_url': res?.requestOptions.uri,
          'statusCode': res?.statusCode,
          'request': res?.requestOptions.data?.toString(),
          'body': res?.data,
        },
      );
    }

    if (additionalInfo != null) {
      info.addAll(additionalInfo);
    }

    if (response != null) {
      info.addAll({
        'method': response.requestOptions.method,
        'request_url': response.requestOptions.uri,
        'statusCode': response.statusCode,
        'request': response.requestOptions.data?.toString(),
        'body': response.data,
      });
    }

    if (route != null) {
      info.addAll({'route': route});
    }

    info.addAll({'stackTrace': stacktace.toString()});

    await Sentry.captureException(
      info,
      stackTrace: stacktace,
      hint: hint,
      withScope: (scope) async {
        await scope.setUser(
          SentryUser(
            id: userID,
            email: email,
          ),
        );
      },
    );
  } catch (e) {
    //pass
  }
}

/// filter events such that we only send custom events
FutureOr<SentryEvent?> beforeSend(SentryEvent event, {Hint? hint}) async {
  if (event.tags?['section'] == null) {
    return null;
  }

  return event;
}
