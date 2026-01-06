import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kroot_app/features/guests/presentation/controller/guest_ui_controller.dart';
import 'package:kroot_app/features/guests/presentation/widgets/guests_list/guests_screen_tabs_item.dart';
import 'package:kroot_app/src/theme/app_colors.dart';

class GuestsScreenTabBar extends StatelessWidget {
  const GuestsScreenTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: .25),
            blurRadius: 4,
          ),
        ],
      ),
      child: Consumer(
        builder: (context, ref, child) {
          final index = ref.watch(guestUiControllerProvider).index;
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                GuestsScreenTabsItem(
                  index: index,
                  tabIndex: 0,
                  title: context.tr('status_all'),
                ),
                GuestsScreenTabsItem(
                  index: index,
                  tabIndex: 1,
                  title: context.tr('status_confirmed'),
                ),
                GuestsScreenTabsItem(
                  index: index,
                  tabIndex: 2,
                  title: context.tr('rejected'),
                ),
                GuestsScreenTabsItem(
                  index: index,
                  tabIndex: 3,
                  title: context.tr('waiting'),
                ),
                GuestsScreenTabsItem(
                  index: index,
                  tabIndex: 4,
                  title: context.tr('failed'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
