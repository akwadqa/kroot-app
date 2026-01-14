// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:kroot_app/features/notifications/domain/model/app_notifications_model.dart';
// import 'package:kroot_app/features/notifications/presentation/controller/app_notifications_controller.dart';
// import 'package:kroot_app/src/extenssions/widget_extensions.dart';
// import 'package:kroot_app/src/notifications/notifications/controllers/notification_controller.dart';
// import 'package:kroot_app/src/shared_widgets/custom_appbar.dart';

// import '../../../../src/shared_widgets/app_error_widget.dart';
// import '../../../../src/shared_widgets/app_pagination_widget.dart';
// import '../../../../src/shared_widgets/fade_circle_loading_indicator.dart';
// import '../widgets/notification_card_widget.dart';

// class NotificationsScreen extends ConsumerWidget {
//   const NotificationsScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final ordersNotificationsAsync = ref.watch(
//       appNotificationsControllerProvider,
//     );
//     final controller = ref.read(appNotificationsControllerProvider.notifier);

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: PreferredSize(
//         preferredSize: const Size(double.infinity, 65),
//         child: CustomAppbar(
//           title: context.tr('notifications'),
//           withBackButton: false,
//         ),
//       ),
//       body: ordersNotificationsAsync.when(
//         data: (notifications) {
//           if (notifications.isEmpty) {
//             return Center(child: Text('no_notifications'.tr()));
//           }

//           final grouped = <String, List<_NotificationWrapper>>{};

//           for (final item in notifications) {
//             final createdAt = item.publishedOn;
//             final dateKey = createdAt;
//             final formattedTime = item.publishedOn;

//             // item.creationTime.formatTimeLocalized(
//             //   context,
//             // );

//             grouped
//                 .putIfAbsent(dateKey ?? '2025-12-10', () => [])
//                 .add(
//                   _NotificationWrapper(
//                     notification: item,
//                     formattedTime: formattedTime ?? '',
//                   ),
//                 );
//           }

//           final groupedEntries = grouped.entries.toList()
//             ..sort((a, b) => b.key.compareTo(a.key));

//           return AppPaginationWidget(
//             onLoading: (page) async => await controller.loadNextPage(),
//             onRefresh: () async => await controller.refreshOrders(),
//             enablePullDown: true,
//             child: ListView.builder(
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//               itemCount: groupedEntries.fold(
//                 0,
//                 (count, e) => count! + e.value.length + 1,
//               ),
//               itemBuilder: (context, index) {
//                 int runningIndex = 0;

//                 for (final entry in groupedEntries) {
//                   if (index == runningIndex) {
//                     return Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 8),
//                       child: Center(
//                         child: Text(
//                           '------------------------- ${entry.key} -------------------------',
//                           style: const TextStyle(color: Colors.grey),
//                         ).onlyPadding(top: 8),
//                       ),
//                     );
//                   }

//                   runningIndex++;

//                   for (final item in entry.value) {
//                     if (index == runningIndex) {
//                       final data = item.notification;
//                       return NotificationCardWidget(
//                         // name: data.passengerDetails.fullName,
//                         name: 'Name',
//                         message: tr(
//                           'offer_message',
//                           namedArgs: {
//                             'amount': '6',
//                             // data
//                             //     .orderOfferNotificationDetails
//                             //     .finalFee
//                             //     .toString(),
//                           },
//                         ),
//                         time: item.formattedTime,
//                         // imageUrl: data.passengerDetails.profileImage,
//                         imageUrl: '',
//                       );
//                     }
//                     runningIndex++;
//                   }
//                 }

//                 return const SizedBox.shrink();
//               },
//             ),
//           );
//         },
//         error: (error, stackTrace) => AppErrorWidget(onTap: () {}),
//         loading: () => const Center(child: FadeCircleLoadingIndicator()),
//       ),
//     );
//   }
// }

// class _NotificationWrapper {
//   final AppNotificationsModel notification;
//   final String formattedTime;

//   _NotificationWrapper({
//     required this.notification,
//     required this.formattedTime,
//   });
// }

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kroot_app/features/notifications/domain/model/app_notifications_model.dart';
import 'package:kroot_app/features/notifications/presentation/controller/app_notifications_controller.dart';
import 'package:kroot_app/features/notifications/presentation/widgets/notification_screen_item.dart';
import 'package:kroot_app/features/notifications/presentation/widgets/notification_screen_list.dart';
import 'package:kroot_app/gen/assets.gen.dart';
import 'package:kroot_app/src/notifications/notifications/controllers/notification_controller.dart';
import 'package:kroot_app/src/shared_widgets/app_error_widget.dart';
import 'package:kroot_app/src/shared_widgets/app_pagination_widget.dart';
import 'package:kroot_app/src/shared_widgets/custom_appbar.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';
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
