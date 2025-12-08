import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/notification_model.dart';

part 'notification_repository.g.dart';

@riverpod
NotificationRepository notificationRepository(_) =>
    NotificationRepository();

class NotificationRepository {
  // final _firestore = FirebaseFirestore.instance;

  // Store a new notification
  // Future<void> storeNotification(NotificationModel notification) async {
  //   try {
  //     await _firestore
  //         .collection('notifications')
  //         .doc(notification.id)
  //         .set(notification.toJson());
  //   } catch (e) {
  //     throw Exception('Failed to store notification: $e');
  //   }
  // }

  // // Get all notifications for a user
  // Stream<List<NotificationModel>> watchUserNotifications(String userId) {
  //   return _firestore
  //       .collection('notifications')
  //       .where('userId', isEqualTo: userId)
  //       .orderBy('createdAt', descending: true)
  //       .snapshots()
  //       .map((snapshot) => snapshot.docs
  //           .map((doc) => NotificationModel.fromJson(doc.data()))
  //           .toList());
  // }

  // // Mark notification as read
  // Future<void> markAsRead(String notificationId) async {
  //   try {
  //     await _firestore
  //         .collection('notifications')
  //         .doc(notificationId)
  //         .update({'isRead': true});
  //   } catch (e) {
  //     throw Exception('Failed to mark notification as read: $e');
  //   }
  // }

  // // Delete a notification
  // Future<void> deleteNotification(String notificationId) async {
  //   try {
  //     await _firestore
  //         .collection('notifications')
  //         .doc(notificationId)
  //         .delete();
  //   } catch (e) {
  //     throw Exception('Failed to delete notification: $e');
  //   }
  // }

  // // Get unread notifications count
  // Stream<int> watchUnreadCount(String userId) {
  //   return _firestore
  //       .collection('notifications')
  //       .where('userId', isEqualTo: userId)
  //       .where('isRead', isEqualTo: false)
  //       .snapshots()
  //       .map((snapshot) => snapshot.docs.length);
  // }
} 