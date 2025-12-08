import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
// import '../enums/notification_type.dart';
import '../models/notification_model.dart';

part 'notification_service.g.dart';

enum NotificationType {
  order,
  driver,
  general,
} 

@riverpod
NotificationService notificationService(_) =>
    NotificationService();

class NotificationService {
  final _messaging = FirebaseMessaging.instance;
  final _localNotifications = FlutterLocalNotificationsPlugin();

  // Initialize notification channels and request permissions
  Future<void> initialize() async {
    // Request permission for iOS
    await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    // Get FCM token
    final token = await _messaging.getToken();
    debugPrint('FCM Token: $token'); // Store this token for the user

    // Initialize local notifications
    const androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    await _localNotifications.initialize(
      const InitializationSettings(
        android: androidSettings,
        iOS: iosSettings,
      ),
    );

    // Create notification channel for Android
    await _createNotificationChannel();

    // Handle notifications when app is in background
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    // Handle notifications when app is in foreground
    FirebaseMessaging.onMessage.listen(_handleForegroundMessage);

    // Handle notification tap when app is in background
    FirebaseMessaging.onMessageOpenedApp.listen(_handleNotificationTap);
  }

  // Create notification channel for Android
  Future<void> _createNotificationChannel() async {
    const channel = AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      description: 'This channel is used for important notifications.',
      importance: Importance.high,
    );

    await _localNotifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  // Handle background messages
  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    print('Handling background message: ${message.messageId}');

    if (message.notification != null) {
      final type = _getNotificationType(message.data['type'] ?? 'general');

      // Create notification model
      final notification = NotificationModel(
        id: message.messageId ??
            DateTime.now().millisecondsSinceEpoch.toString(),
        title: message.notification!.title!,
        body: message.notification!.body!,
        type: type.toString(),
        data: message.data,
        createdAt: DateTime.now(),
      );

      // Store notification in Firestore
      //TODO : Removed this 
      // await FirebaseFirestore.instance
      //     .collection('notifications')
      //     .doc(notification.id)
      //     .set(notification.toJson());
    }
  }

  // Handle foreground messages
Future<void> _handleForegroundMessage(RemoteMessage message) async {
  debugPrint('Handling foreground message: ${message.messageId}');

  if (message.notification != null) {
    final type = _getNotificationType(message.data['type'] ?? 'general');

    final notification = NotificationModel(
      id: message.messageId ?? DateTime.now().millisecondsSinceEpoch.toString(),
      title: message.notification!.title!,
      body: message.notification!.body!,
      type: type.toString(),
      data: message.data,
      createdAt: DateTime.now(),
    );

    // 🔒 Safe Firestore write

    //TODO : Removed this : 
    // try {
    //   await FirebaseFirestore.instance
    //       .collection('notifications')
    //       .doc(notification.id)
    //       .set(notification.toJson());
    // } catch (e) {
    //   debugPrint('⚠️ Firestore write failed (foreground): $e');
    // }

    // Local push
    _localNotifications.show(
      notification.hashCode,
      notification.title,
      notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          'high_importance_channel',
          'High Importance Notifications',
          channelDescription: 'This channel is used for important notifications.',
          importance: Importance.high,
          priority: Priority.high,
        ),
        iOS: const DarwinNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
        ),
      ),
      payload: json.encode(notification.data),
    );
  }
}

  // Handle notification tap
  Future<void> _handleNotificationTap(RemoteMessage message) async {
    // Add your notification tap handling logic here
    print('Notification tapped: ${message.messageId}');
    // Handle notification tap based on type
    final type = _getNotificationType(message.data['type'] ?? 'general');
    switch (type) {
      case NotificationType.order:
        // Handle order notification tap
        break;
      case NotificationType.driver:
        // Handle driver notification tap
        break;
      case NotificationType.general:
        // Handle general notification tap
        break;
    }
  }

  // Helper function to determine notification type
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

  // Get FCM token
  Future<String?> getFCMToken() async {
    return await _messaging.getToken();
  }

  // Delete FCM token
  Future<void> deleteFCMToken() async {
    await _messaging.deleteToken();
  }
}
