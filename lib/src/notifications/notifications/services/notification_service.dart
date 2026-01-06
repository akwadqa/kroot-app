import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kroot_app/firebase_options.dart';
import 'package:kroot_app/src/constants/keys.dart';
import 'package:kroot_app/src/localization/current_language.dart';
import 'package:kroot_app/src/notifications/notifications/models/notification_model.dart';
import 'package:kroot_app/src/notifications/notifications/repositories/notifications_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:fcm_config/fcm_config.dart';

part 'notification_service.g.dart';

enum NotificationType { order, driver, general }

class NotificationsService {
  final Ref _ref;
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  NotificationsService(this._ref);

  Future<void> init() async {
    debugPrint("FCMConfig.instance.init");

    await FCMConfig.instance.init(
      options: DefaultFirebaseOptions.currentPlatform,
      defaultAndroidChannel: const AndroidNotificationChannel(
        'high_importance_channel',
        'Fcm config',
        importance: Importance.high,
      ),
    );

    await _messaging.requestPermission(alert: true, badge: true, sound: true);
    debugPrint("FCMConfig.instance.init2");

    await _initializeLocalNotifications();
    debugPrint("FCMConfig.instance.init3");

    final userId = "YOU SHOULD STORE USER EMAIL AND PASS IT HERE";

    _messaging.onTokenRefresh.listen((token) {
      _ref
          .read(deviceTokenControllerProvider.notifier)
          .sendFCMToken(token, userId);
    });

    sendDeviceToken(userId);
  }

  Future<void> setupInteractedMessage(GoRoute appRouter) async {
    final initialMessage = await _messaging.getInitialMessage();
    if (initialMessage != null) {
      _handleNotification(message: initialMessage, appRouter: appRouter);
    }

    FirebaseMessaging.onMessageOpenedApp.listen(
      (remoteMessage) =>
          _handleNotification(message: remoteMessage, appRouter: appRouter),
    );

    FirebaseMessaging.onMessage.listen(_handleForegroundMessage);
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  Future<void> sendDeviceToken(String userId) async {
    try {
      final token = await _messaging.getToken();
      if (token != null) {
        debugPrint(' sending device token:$token');

        await _ref
            .read(deviceTokenControllerProvider.notifier)
            .sendFCMToken(token, userId);
      }
    } catch (e, st) {
      debugPrint('Error sending device token: $e\n$st');
    }
  }

  Future<void> subscribeFCMTopics() async {
    try {
      await _messaging.subscribeToTopic(
        Platform.isIOS ? Keys.ios : Keys.android,
      );
      await _messaging.subscribeToTopic(_ref.watch(currentLanguageProvider));
    } catch (e) {
      debugPrint('Error subscribing to topics: $e');
    }
  }

  Future<void> subscribeOrdersTopic() async =>
      _messaging.subscribeToTopic(Keys.orders);

  Future<void> unsubscribeOrdersTopic() async =>
      _messaging.unsubscribeFromTopic(Keys.orders);

  Future<void> _initializeLocalNotifications() async {
    const androidSettings = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    await _localNotifications.initialize(
      const InitializationSettings(android: androidSettings, iOS: iosSettings),
    );

    await _localNotifications
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(
          const AndroidNotificationChannel(
            'high_importance_channel',
            'High Importance Notifications',
            description: 'This channel is used for important notifications.',
            importance: Importance.high,
          ),
        );
  }

  Future<void> _handleForegroundMessage(RemoteMessage message) async {
    final notification = message.notification;
    if (notification != null) {
      _localNotifications.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            'high_importance_channel',
            'High Importance Notifications',
            channelDescription: 'Important notifications',
            importance: Importance.high,
            priority: Priority.high,
          ),
          iOS: const DarwinNotificationDetails(
            presentAlert: true,
            presentBadge: true,
            presentSound: true,
          ),
        ),
        payload: json.encode(message.data),
      );
    }
  }

  void _handleNotification({
    required RemoteMessage message,
    required GoRoute appRouter,
  }) {
    debugPrint('Notification tapped: ${message.messageId}');
    final type = _getNotificationType(message.data['type'] ?? 'general');

    switch (type) {
      case NotificationType.order:
        break;
      case NotificationType.driver:
        break;
      case NotificationType.general:
        break;
    }
  }

  static NotificationType _getNotificationType(String type) {
    switch (type) {
      case 'order':
        return NotificationType.order;
      case 'driver':
        return NotificationType.driver;
      default:
        return NotificationType.general;
    }
  }

  static Future<void> _firebaseMessagingBackgroundHandler(
    RemoteMessage message,
  ) async {
    debugPrint('Handling background message: ${message.messageId}');
    if (message.notification != null) {
      final notification = NotificationModel(
        id:
            message.messageId ??
            DateTime.now().millisecondsSinceEpoch.toString(),
        title: message.notification!.title!,
        body: message.notification!.body!,
        type: message.data['type'] ?? 'general',
        data: message.data,
        createdAt: DateTime.now(),
      );
    }
  }
}

@Riverpod(keepAlive: true)
NotificationsService notificationsService(Ref ref) => NotificationsService(ref);

@riverpod
class DeviceTokenController extends _$DeviceTokenController {
  @override
  FutureOr<void>? build() => null;

  Future<void> sendFCMToken(String token, String userId) async {
    state = const AsyncValue.loading();
    final repo = ref.watch(notificationsRepositoryProvider);

    await repo.sendFCMToken(token, userId);
    state = const AsyncValue.data(null);
  }
}
