import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';import 'package:kroot_app/features/notifications/presentation/controller/app_notifications_controller.dart';
import 'package:kroot_app/features/notifications/presentation/widgets/notification_screen_list.dart';
import 'package:kroot_app/src/shared_widgets/app_error_widget.dart';
import 'package:kroot_app/src/shared_widgets/custom_appbar.dart';
import 'package:kroot_app/src/utils/app_alert.dart';

class NotificationsScreen extends ConsumerWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(appNotificationsControllerProvider);
    return Scaffold(
      appBar: CustomAppbar(title: 'notifications'.tr()),
      body: controller.when(
        data: (data) => NotificationScreenList(notifications: data),
        error: (e, st) => AppErrorWidget(
          onTap: () => ref
              .read(appNotificationsControllerProvider.notifier)
              .fetchOrdersOffersNotifications(page: 1),
        ),
        loading: () => Center(child: MailPulseAnimation()),
      ),
    );
  }
}
