import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wedding_app/features/guests/presentation/controller/guest_ui_controller.dart';
import 'package:wedding_app/src/theme/app_colors.dart';
import 'package:wedding_app/src/theme/app_text_style.dart';

class GuestsScreenTabsItem extends ConsumerWidget {
  const GuestsScreenTabsItem({
    super.key,
    required this.index,
    required this.tabIndex,
    required this.title,
  });

  final int index, tabIndex;
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref.read(guestUiControllerProvider.notifier).changIndex(tabIndex);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 4.h),
        decoration: index == tabIndex
            ? BoxDecoration(
                color: AppColors.primary,

                borderRadius: BorderRadius.circular(32.r),
              )
            : null,
        child: Text(
          title,
          style: AppTextStyle.rubikSemiBold16.copyWith(
            color: index == tabIndex ? AppColors.white : AppColors.black,
          ),
        ),
      ),
    );
  }
}
