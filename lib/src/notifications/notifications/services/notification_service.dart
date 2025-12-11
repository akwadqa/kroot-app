import 'dart:async';
import 'dart:convert';
import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:go_router/go_router.dart';
import 'package:kroot_app/features/auth/application/auth_service.dart';
import 'package:kroot_app/firebase_options.dart';
import 'package:kroot_app/src/constants/keys.dart';
import 'package:kroot_app/src/localization/current_language.dart';
import 'package:kroot_app/src/notifications/notifications/models/notification_model.dart';
import 'package:kroot_app/src/notifications/notifications/repositories/notifications_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:fcm_config/fcm_config.dart';

part 'notification_service.g.dart';

enum NotificationType {
  order,
  driver,
  general,
} 

/// Main service to handle notifications (FCM + Local Notifications)
class NotificationsService {
  final Ref _ref;
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  NotificationsService(this._ref);

  // SharedPreferences get _prefs =>
  //     _ref.read(sharedPreferencesProvider).requireValue;

  /// Initialize Firebase Messaging and FCMConfig
  Future<void> init() async {
    // Initialize FCMConfig
    debugPrint("FCMConfig.instance.init");
     
    await FCMConfig.instance.init(
      options: DefaultFirebaseOptions.currentPlatform,
      defaultAndroidChannel: const AndroidNotificationChannel(
        'high_importance_channel',
        'Fcm config',
        importance: Importance.high,
      ),
    );

    // Request permissions for iOS
    await _messaging.requestPermission(alert: true, badge: true, sound: true);
    debugPrint("FCMConfig.instance.init2");

    // Initialize local notifications
    await _initializeLocalNotifications();
    debugPrint("FCMConfig.instance.init3");

    // Listen for token refresh and send to backend
  // ! YOU SHOULD STORE USER EMAIL AND PASS IT HERE
    final userId =   "YOU SHOULD STORE USER EMAIL AND PASS IT HERE";
    
    // _ref.read(userDataProvider.notifier).userinformation.email;

    _messaging.onTokenRefresh.listen((token) {
      _ref
          .read(deviceTokenControllerProvider.notifier)
          .sendFCMToken(token, userId);
    });
    // Also send the current token
    sendDeviceToken(userId);
    }

  /// Setup notification interactions (when tapping notifications)
  Future<void> setupInteractedMessage(GoRoute appRouter) async {
    // App opened from terminated state
    final initialMessage = await _messaging.getInitialMessage();
    if (initialMessage != null) {
      _handleNotification(message: initialMessage, appRouter: appRouter);
    }

    // App opened from background
    FirebaseMessaging.onMessageOpenedApp.listen(
      (remoteMessage) =>
          _handleNotification(message: remoteMessage, appRouter: appRouter),
    );

    // App in foreground
    FirebaseMessaging.onMessage.listen(_handleForegroundMessage);
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  /// Send FCM token to backend
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

  /// Subscribe to common FCM topics
  Future<void> subscribeFCMTopics() async {
    try {
      await _messaging.subscribeToTopic(
        Platform.isIOS ? Keys.ios : Keys.android,
      );
      await _messaging.subscribeToTopic(_ref.watch(currentLanguageProvider));
      // _subscribeMarketingNotifications();
    } catch (e) {
      debugPrint('Error subscribing to topics: $e');
    }
  }

  /// Subscribe to orders notifications
  Future<void> subscribeOrdersTopic() async =>
      _messaging.subscribeToTopic(Keys.orders);

  /// Unsubscribe from orders notifications
  Future<void> unsubscribeOrdersTopic() async =>
      _messaging.unsubscribeFromTopic(Keys.orders);

  /// Private: Handle marketing notifications
  // void _subscribeMarketingNotifications() {
  //   final isSubscribed = _ref.read(marketingNotificationsControllerProvider);
  //   if (isSubscribed) {
  //     _ref.read(marketingNotificationsControllerProvider.notifier)
  //         .subscripeMarketingNotifications();
  //   }
  // }

  /// Private: Initialize local notifications
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

  /// Private: Handle foreground notification
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

  /// Private: Handle notification tap
  void _handleNotification({
    required RemoteMessage message,
    required GoRoute appRouter,
  }) {
    debugPrint('Notification tapped: ${message.messageId}');
    final type = _getNotificationType(message.data['type'] ?? 'general');

    switch (type) {
      case NotificationType.order:
        // Navigate to order page
        break;
      case NotificationType.driver:
        // Navigate to driver page
        break;
      case NotificationType.general:
        // General notification logic
        break;
    }
  }

  /// Helper: Determine notification type
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

  /// Background handler for FCM
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

      // try {
      //   // await FirebaseFirestore.instance
      //   //     .collection('notifications')
      //   //     .doc(notification.id)
      //   //     .set(notification.toJson());
      // } catch (e) {
      //   debugPrint('Failed to save notification in Firestore: $e');
      // }
    }
  }
}

/// Riverpod provider for NotificationsService
@Riverpod(keepAlive: true)
NotificationsService notificationsService(Ref ref) => NotificationsService(ref);

/// Controller to send device token to backend
@riverpod
class DeviceTokenController extends _$DeviceTokenController {
  @override
  FutureOr<void>? build() => null;

  Future<void> sendFCMToken(String token, String userId) async {
    state = const AsyncValue.loading();
    final repo = ref.watch(notificationsRepositoryProvider);

    // try {
    await repo.sendFCMToken(token, userId);
    state = const AsyncValue.data(null);
    // } catch (e, st) {
    //   state = AsyncValue.error(e, st);
    // }
  }
}
