import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zembo_agent_app/application/notification/i_notification_facade.dart';
import 'package:zembo_agent_app/domain/notification/app_notification.dart';

@LazySingleton(as: INotificationFacade)
class NotificationFacade implements INotificationFacade {
  NotificationFacade(this._dio);

  final Dio _dio;

  @override
  Future<List<AppNotification>> getAllNotifications({
    required int userId,
  }) async {
    try {
      final res = await _dio.get<dynamic>(
        '/notification/get-notifications',
        queryParameters: {
          'user_id': userId,
        },
      );

      final results = List<Map<String, dynamic>>.from(
        (res.data as Map<String, dynamic>)['data'] as Iterable,
      );

      final notifications = <AppNotification>[];
      for (final json in results) {
        final notification = AppNotification.fromJson(json);
        notifications.add(notification);
      }

      notifications.sort((a, b) {
        final aDate = DateTime.parse(a.createdAt ?? '').microsecondsSinceEpoch;
        final bDate = DateTime.parse(b.createdAt ?? '').microsecondsSinceEpoch;
        return bDate.compareTo(aDate);
      });

      return notifications;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> markNotificationAsRead(int id) async {
    try {
      await _dio.post<dynamic>(
        '/notification/mark-as-read',
        data: {
          'id': id,
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> registerDeviceToken({
    required int id,
    required String token,
  }) async {
    try {
      await _dio.post<dynamic>(
        '/notification/register-device-token',
        data: {
          'id': id,
          'device_token': token,
        },
      );
    } catch (e) {
      rethrow;
    }
  }
}
