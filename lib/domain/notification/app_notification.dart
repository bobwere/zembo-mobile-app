import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zembo_agent_app/domain/user/user.dart';
part 'app_notification.freezed.dart';
part 'app_notification.g.dart';

@freezed
abstract class AppNotification with _$AppNotification {
  factory AppNotification({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'user') User? user,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'is_read') bool? isRead,
    @JsonKey(name: 'message') bool? message,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updateAt,
  }) = _AppNotification;

  factory AppNotification.fromJson(Map<String, dynamic> json) =>
      _$AppNotificationFromJson(json);

  factory AppNotification.initial() => AppNotification();
}
