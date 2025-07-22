import 'package:zembo_agent_app/domain/notification/app_notification.dart';

abstract class INotificationFacade {
  Future<void> markNotificationAsRead(int id);
  Future<List<AppNotification>> getAllNotifications({
    required int userId,
  });
  Future<void> registerDeviceToken({
    required int id,
    required String token,
  });
}
