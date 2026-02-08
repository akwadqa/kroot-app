import 'dart:ui' as ui;

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:kroot_app/gen/assets.gen.dart';
import 'package:kroot_app/src/bottm_navigation_bar_provider.dart';
import 'package:kroot_app/src/theme/app_colors.dart';

class BottomNavigationBarView extends ConsumerWidget {
  const BottomNavigationBarView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(bottomNavIndexProvider);

    final iconList = [
      Assets.icons.homeIc.svg(),
      Assets.icons.scanIc.svg(),
      Assets.icons.notificationsIc.svg(),
      Assets.icons.profileIc.svg(),
    ];

    final labelList = [
      context.tr('home'),
      context.tr('scan'),
      context.tr('notifications'),
      context.tr('profile'),
    ];

    return Directionality(
      textDirection: ui.TextDirection.ltr,
      child: SizedBox(
        height: 105,
        child: AnimatedBottomNavigationBar.builder(
          itemCount: iconList.length,
          tabBuilder: (int i, bool isActive) {
            final color = isActive ? AppColors.primary : AppColors.black400;

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 5,
              children: [
                SizedBox(height: 3),
                AnimatedContainer(
                  padding: EdgeInsets.zero,
                  margin: EdgeInsets.zero,
                  duration: Duration(milliseconds: 300),

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: index == i ? AppColors.primary : Colors.transparent,
                  ),
                  width: 27,
                  height: 4,
                ),

                Spacer(),
                ColorFiltered(
                  colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                  child: iconList[i],
                ),

                Text(
                  labelList[i],
                  style: TextStyle(fontSize: 12, color: color),
                ),
                // SizedBox(),
                // Spacer(),
              ],
            );
          },
          gapLocation: GapLocation.center,
          splashSpeedInMilliseconds: 1,
          notchSmoothness: NotchSmoothness.smoothEdge,
          activeIndex: index,
          onTap: (i) => ref.read(bottomNavIndexProvider.notifier).setIndex(i),
          backgroundColor: Colors.white,
          shadow: Shadow(
            blurRadius: 24,
            offset: Offset(0, -5),
            color: Colors.black.withOpacity(.12),
          ),
        ),
      ),
    );
  }
}
