import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kroot_app/gen/assets.gen.dart';
import 'package:kroot_app/src/localization/current_language.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';

class ChangeLanguageBottomSheet extends ConsumerStatefulWidget {
  const ChangeLanguageBottomSheet({super.key});

  @override
  ConsumerState<ChangeLanguageBottomSheet> createState() =>
      _ChangeLanguageBottomSheetState();
}

class _ChangeLanguageBottomSheetState
    extends ConsumerState<ChangeLanguageBottomSheet> {
  @override
  void initState() {
    super.initState();
    Future(() {
      ref.read(currentLanguageProvider.notifier).getLanguage(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentLang = context.locale.languageCode;

    return Container(
      padding: EdgeInsets.all(22.w),

      child: Column(
        children: [
          Row(
            children: [
              Text(
                context.tr('changeLanguage'),
                style: AppTextStyle.rubikSemiBold20.copyWith(
                  color: AppColors.primary,
                ),
              ),
              Spacer(),
              20.verticalSpace,

              GestureDetector(
                onTap: () => context.pop(),
                child: Assets.icons.closeIc.svg(),
              ),
            ],
          ),
          33.verticalSpace,

          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: .25),
                  blurRadius: 4,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  context.tr('english'),
                  style: AppTextStyle.rubikSemiBold18.copyWith(
                    color: AppColors.primary,
                  ),
                ),

                Checkbox(
                  value: currentLang == 'en' ? true : false,
                  onChanged: (val) {
                    ref
                        .read(currentLanguageProvider.notifier)
                        .changeLanguage(context, 'en');
                  },
                  fillColor: WidgetStateProperty.resolveWith<Color>((states) {
                    if (states.contains(WidgetState.selected)) {
                      return AppColors.primary;
                    }
                    return AppColors.white;
                  }),
                ),
              ],
            ),
          ),

          20.verticalSpace,

          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: .25),
                  blurRadius: 4,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  context.tr('arabic'),
                  style: AppTextStyle.rubikSemiBold18.copyWith(
                    color: AppColors.primary,
                  ),
                ),

                Checkbox(
                  value: currentLang == 'ar' ? true : false,
                  onChanged: (val) {
                    ref
                        .read(currentLanguageProvider.notifier)
                        .changeLanguage(context, 'ar');
                  },
                  fillColor: WidgetStateProperty.resolveWith<Color>((states) {
                    if (states.contains(WidgetState.selected)) {
                      return AppColors.primary;
                    }
                    return AppColors.white;
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
