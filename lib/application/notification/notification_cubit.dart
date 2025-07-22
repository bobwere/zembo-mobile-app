import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zembo_agent_app/application/notification/i_notification_facade.dart';
import 'package:zembo_agent_app/core/constants/enum.dart';
import 'package:zembo_agent_app/domain/notification/app_notification.dart';

part 'notification_cubit.freezed.dart';
part 'notification_state.dart';

@injectable
class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit(this._notificationFacade)
    : super(NotificationState.initial());

  final INotificationFacade _notificationFacade;

  void viewButtonClickedLockAcquired(String notificationId) {
    emit(
      state.copyWith.call(viewButtonClickedForNotificationId: notificationId),
    );
  }

  void viewButtonClickedLockReleased() {
    emit(
      state.copyWith.call(viewButtonClickedForNotificationId: null),
    );
  }

  Future<void> registerDeviceToken(int id, String token) async {
    if (token == '') {
      return;
    }

    try {
      await _notificationFacade.registerDeviceToken(
        id: id,
        token: token,
      );
    } catch (e) {
      //
    }
  }

  Future<void> getAllNotifications(int userId) async {
    try {
      emit(
        state.copyWith.call(fetchNotificationsStatus: AppStatus.submitting),
      );

      final notifications = await _notificationFacade.getAllNotifications(
        userId: userId,
      );

      emit(
        state.copyWith.call(
          notifications: notifications,
          fetchNotificationsStatus: AppStatus.success,
        ),
      );
    } catch (e) {
      //
      emit(state.copyWith.call(fetchNotificationsStatus: AppStatus.failure));
    }
  }

  Future<void> markNotificationAsRead(int id, int userId) async {
    try {
      emit(
        state.copyWith.call(markNotificationAsReadStatus: AppStatus.submitting),
      );
      await _notificationFacade.markNotificationAsRead(id);

      final notifications = await _notificationFacade.getAllNotifications(
        userId: userId,
      );

      emit(
        state.copyWith.call(
          notifications: notifications,
          markNotificationAsReadStatus: AppStatus.success,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith.call(markNotificationAsReadStatus: AppStatus.failure),
      );
    }
  }
}
