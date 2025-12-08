import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/notification_model.dart';
import '../repositories/notification_repository.dart';

part 'notification_controller.g.dart';

@riverpod
class NotificationController extends _$NotificationController {
  @override
  Stream<List<NotificationModel>>? build(String userId) {
    return null;
    // return ref.watch(notificationRepositoryProvider).watchUserNotifications(userId);
  }

  Future<void> markAsRead(String notificationId) async {
    // await ref.read(notificationRepositoryProvider).markAsRead(notificationId);
  }

  Future<void> deleteNotification(String notificationId) async {
    // await ref.read(notificationRepositoryProvider).deleteNotification(notificationId);
  }
}

// @riverpod
// Stream<int> unreadNotificationsCount(
//   WidgetRef ref,
//   String userId,
// ) {
//   // return ref.watch(notificationRepositoryProvider).watchUnreadCount(userId);
// }
