import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wedding_app/gen/assets.gen.dart' show Assets, SvgGenImage;
import 'package:wedding_app/src/bottm_navigation_bar_provider.dart';
import 'package:wedding_app/src/theme/app_colors.dart';
import 'package:wedding_app/src/theme/app_text_style.dart';

class BottomNavigationBarView extends ConsumerWidget {
  const BottomNavigationBarView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(bottomNavIndexProvider);
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -5),
            blurRadius: 24,
            spreadRadius: 0,
            color: AppColors.black.withValues(alpha: .12),
          ),
        ],
      ),
      child: BottomNavigationBar(
        unselectedLabelStyle: AppTextStyle.rubikRegular12.copyWith(
          color: AppColors.black400,
        ),
        selectedItemColor: AppColors.primary,
        selectedLabelStyle: AppTextStyle.rubikRegular12.copyWith(
          color: AppColors.primary,
        ),
        currentIndex: index,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          ref.read(bottomNavIndexProvider.notifier).setIndex(index);
        },
        items: [
          _buildBottomNavBarItem(
            0,
            index,
            context.tr('home'),
            Assets.icons.homeIc.svg(
              colorFilter: ColorFilter.mode(
                index == 0 ? AppColors.primary : AppColors.black400,
                BlendMode.srcIn,
              ),
            ),
          ),
          _buildBottomNavBarItem(
            1,
            index,
            context.tr('scan'),

            Assets.icons.scanIc.svg(
              colorFilter: ColorFilter.mode(
                index == 1 ? AppColors.primary : AppColors.black400,
                BlendMode.srcIn,
              ),
            ),
          ),
          _buildBottomNavBarItem(
            2,
            index,
            context.tr('add'),

            Assets.icons.addIc.svg(
              colorFilter: ColorFilter.mode(
                index == 2 ? AppColors.primary : AppColors.black400,
                BlendMode.srcIn,
              ),
            ),
          ),
          _buildBottomNavBarItem(
            3,
            index,
            context.tr('profile'),

            Assets.icons.profileIc.svg(
              colorFilter: ColorFilter.mode(
                index == 3 ? AppColors.primary : AppColors.black400,
                BlendMode.srcIn,
              ),
            ),
          ),
          // BottomNavigationBarItem(icon: Assets.icons.appleIc.svg()),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavBarItem(
    int index,
    int currentIndex,
    String label,
    Widget icon,
  ) {
    return BottomNavigationBarItem(
      icon: Column(
        children: [
          AnimatedContainer(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            duration: Duration(milliseconds: 300),
            width: double.infinity,
            height: 4.h,
            color: index == currentIndex
                ? AppColors.primary
                : Colors.transparent,
          ),
          12.verticalSpace,
          icon,
        ],
      ),
      label: label,
    );
  }
}
