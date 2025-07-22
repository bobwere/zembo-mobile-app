part of 'notification_cubit.dart';

@freezed
abstract class NotificationState with _$NotificationState {
  factory NotificationState({
    // fetch notifications
    List<AppNotification>? notifications,
    AppStatus? fetchNotificationsStatus,
    String? fetchNotificationsError,

    //
    AppStatus? markNotificationAsReadStatus,
    String? markNotificationAsReadError,

    //
    String? viewButtonClickedForNotificationId,
  }) = _NotificationState;

  factory NotificationState.initial() => NotificationState(notifications: []);
}
