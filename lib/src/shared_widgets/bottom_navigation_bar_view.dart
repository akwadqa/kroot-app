import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kroot_app/features/event/presentation/controller/home_controller.dart';
import 'package:kroot_app/gen/assets.gen.dart' show Assets, SvgGenImage;
import 'package:kroot_app/src/bottm_navigation_bar_provider.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';
import 'package:kroot_app/src/utils/app_toast.dart';

class BottomNavigationBarView extends ConsumerWidget {
  const BottomNavigationBarView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(
      homeControllerProvider.select((val) => val.value!.utilsResponse),
    );
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
          if (index == 2) {
            if (controller?.error != null) {
              AppToast.errorToast(controller!.error.toString());
            }
            if (controller?.isLoading ?? false) {
              AppToast.errorToast('Please wait');
            }
            if (controller?.value != null) {
              final data = controller!.value;

              if ((data?.subscriber?.remainingKroots ?? 0) == 0) {
                //   ref.read(bottomNavIndexProvider.notifier).setIndex(index);
                // } else {
                AppToast.errorToast(
                  'There is no kroot remaining in your account',
                );
              } else {
                ref.read(bottomNavIndexProvider.notifier).setIndex(index);
              }
            }
          } else {
            ref.read(bottomNavIndexProvider.notifier).setIndex(index);
          }
          // index
          //? TODO
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
