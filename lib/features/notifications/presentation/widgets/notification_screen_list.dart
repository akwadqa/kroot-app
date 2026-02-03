
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kroot_app/features/notifications/domain/model/app_notifications_model.dart';
import 'package:kroot_app/features/notifications/presentation/controller/app_notifications_controller.dart';
import 'package:kroot_app/features/notifications/presentation/widgets/notification_screen_item.dart';
import 'package:kroot_app/src/extenssions/widget_extensions.dart';
import 'package:kroot_app/src/shared_widgets/app_pagination_widget.dart';

class NotificationScreenList extends ConsumerWidget {
  const NotificationScreenList({super.key, required this.notifications});
  final List<AppNotificationsModel> notifications;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppPaginationWidget(
      enablePullDown: true,
      onRefresh: () =>
          ref.read(appNotificationsControllerProvider.notifier).refreshOrders(),
      onLoading: (page) =>
          ref.read(appNotificationsControllerProvider.notifier).loadNextPage(),
      child: ListView.separated(
        separatorBuilder: (context, index) => 10.verticalSpace,
        padding: EdgeInsets.symmetric(horizontal: 22.w),
        itemBuilder: (context, index) =>
            NotificationScreenItem(notificationsModel: notifications[index]),
        itemCount: notifications.length,
      ).onlyPadding(top: 20),
    );
  }
}
