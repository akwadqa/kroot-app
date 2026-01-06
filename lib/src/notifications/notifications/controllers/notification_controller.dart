import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/notification_model.dart';

part 'notification_controller.g.dart';

@riverpod
class NotificationController extends _$NotificationController {
  @override
  Stream<List<NotificationModel>>? build(String userId) {
    return null;
  }

  Future<void> markAsRead(String notificationId) async {}

  Future<void> deleteNotification(String notificationId) async {}
}
