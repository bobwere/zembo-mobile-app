// ignore: lines_longer_than_80_chars
// ignore_for_file: inference_failure_on_function_return_type, use_build_context_synchronously, prefer_null_aware_method_calls, document_ignores

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:dio/dio.dart' as d;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:zembo_agent_app/presentation/widgets/notification_dialog.dart';

class NotificationService {
  NotificationService._privateConstructor();
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static final NotificationService _instance =
      NotificationService._privateConstructor();

  static NotificationService get instance => _instance;

  // Callback for handling foreground message updates (optional)
  Function(RemoteMessage)? onForegroundMessage;

  Function(Map<String, dynamic>)? onMessageTapped;

  Future<void> deleteToken() async {
    await _firebaseMessaging.deleteToken();
  }

  Future<String?> getAPNSToken() async {
    final token = await _firebaseMessaging.getAPNSToken();
    return token;
  }

  Future<void> initialize(BuildContext context) async {
    final hasPermission =
        await const FlutterSecureStorage().read(
          key: 'notification_permission',
        ) ??
        'false';

    if (bool.parse(hasPermission)) {
      // Configure Local Notification settings
      const initializationSettingsAndroid = AndroidInitializationSettings(
        'ic_launcher',
      );

      const initializationSettingsDarwin = DarwinInitializationSettings();

      const initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsDarwin,
      );

      await _flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
        onDidReceiveNotificationResponse: _onDidReceiveNotificationResponse,
      );

      // Listen for foreground messages
      FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
        final msgTitle = message.notification?.title;

        log(msgTitle ?? '');
        log('_start: ${msgTitle ?? ''}');

        // log('firebase :: Received a foreground message: ${message.messageId}');
        if (message.notification?.title != null) {
          await _showNotification(message);
        }

        // If there's a foreground message handler, call it
        if (onForegroundMessage != null) {
          onForegroundMessage!(message);
        }
      });

      // Handle when the app is opened from a notification
      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        log(
          'firebase :: Notification clicked! Message: ${message.notification?.title}',
        );
        _handleNotificationClick(message);
      });

      // Handle background messages
      FirebaseMessaging.onBackgroundMessage(
        _firebaseMessagingBackgroundHandler,
      );
      return;
    }

    await showDialog<dynamic>(
      context: context,
      builder: (_) {
        return NotificationPermissionDialog(
          context: context,
          onAllowed: () async {
            Navigator.of(context).pop();
            // Request permissions for iOS
            final settings = await _firebaseMessaging.requestPermission();

            if (settings.authorizationStatus == AuthorizationStatus.denied ||
                settings.authorizationStatus ==
                    AuthorizationStatus.notDetermined) {
              await const FlutterSecureStorage().write(
                key: 'notification_permission',
                value: false.toString(),
              );
              return;
            }

            await const FlutterSecureStorage().write(
              key: 'notification_permission',
              value: true.toString(),
            );

            log(
              'firebase :: User granted permission: ${settings.authorizationStatus}',
            );

            // Configure Local Notification settings
            const initializationSettingsAndroid = AndroidInitializationSettings(
              'ic_launcher',
            );

            const initializationSettingsDarwin = DarwinInitializationSettings();

            const initializationSettings = InitializationSettings(
              android: initializationSettingsAndroid,
              iOS: initializationSettingsDarwin,
            );

            await _flutterLocalNotificationsPlugin.initialize(
              initializationSettings,
              onDidReceiveNotificationResponse:
                  _onDidReceiveNotificationResponse,
            );

            // Listen for foreground messages
            FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
              log(
                'firebase :: Received a foreground message: ${message.messageId}',
              );

              // log('firebase :: Received a foreground message: ${message.messageId}');
              if (message.notification?.title != null) {
                await _showNotification(message);
              }

              // If there's a foreground message handler, call it
              if (onForegroundMessage != null) {
                onForegroundMessage!(message);
              }
            });

            // Handle when the app is opened from a notification
            FirebaseMessaging.onMessageOpenedApp.listen((
              RemoteMessage message,
            ) {
              log(
                'firebase :: Notification clicked! Message: ${message.notification?.title}',
              );
              _handleNotificationClick(message);
            });

            // Handle background messages
            FirebaseMessaging.onBackgroundMessage(
              _firebaseMessagingBackgroundHandler,
            );
          },
          onDismissed: () {
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  // Show local notification
  Future<void> _showNotification(RemoteMessage message) async {
    final imgUrl = message.notification?.android?.imageUrl;
    // converting image into base65 to show in notification bar
    BigPictureStyleInformation? bigPictureStyleInformation;
    if (imgUrl != null) {
      try {
        final dio = d.Dio();
        // Fetch image bytes using Dio
        final response = await dio.get<List<int>>(
          imgUrl,
          options: d.Options(responseType: d.ResponseType.bytes),
        );
        // Convert image bytes to base64 string
        final imageBytes = Uint8List.fromList(response.data!);
        final base64Image = base64Encode(imageBytes);
        // Create BigPictureStyleInformation for displaying the image
        bigPictureStyleInformation = BigPictureStyleInformation(
          ByteArrayAndroidBitmap.fromBase64String(base64Image),
          contentTitle: message.notification?.title,
          summaryText: message.notification?.body,
        );
      } catch (e) {
        //  print('Error fetching image: $e');
      }
    }

    final androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'high_importance_channel',
      'High Importance Notifications',
      importance: Importance.high,
      priority: Priority.high,
      // largeIcon: largeIcon, // This sets the small image on the right side ofnotification title
      styleInformation: bigPictureStyleInformation,
    );

    final platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: const DarwinNotificationDetails(),
    );

    if (message.notification?.title != null) {
      await _flutterLocalNotificationsPlugin.show(
        message.hashCode,
        message.notification?.title ?? 'No Title',
        message.notification?.body ?? 'No Body',
        platformChannelSpecifics,
      );
    }
  }

  // Handle notification click action
  Future<void> _handleNotificationClick(RemoteMessage message) async {
    log(
      'firebase :: User tapped on notification: ${message.notification?.title}',
    );
    // You can navigate to a specific screen using Navigator here
  }

  // Called when a notification is tapped (foreground or background)
  Future<void> _onDidReceiveNotificationResponse(
    NotificationResponse notificationResponse,
  ) async {
    final payload = notificationResponse.payload;

    if (onMessageTapped != null) {
      onMessageTapped!(notificationResponse.data);
    }

    if (payload != null) {
      log('firebase :: Notification payload: $payload');
      // Navigate or perform an action based on the payload
    }
  }

  // Get device token (you can send this to your server for targeted notifications)
  Future<String?> getDeviceToken() async {
    final token = await _firebaseMessaging.getToken();
    // print("Device  : $token");
    return token;
  }
}

// Background handler (required for background notifications)
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(
  RemoteMessage message,
) async {
  log('firebase :: Handling a background message: ${message.messageId}');
}
