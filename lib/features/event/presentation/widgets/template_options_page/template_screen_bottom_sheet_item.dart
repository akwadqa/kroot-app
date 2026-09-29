import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kroot_app/features/event/presentation/screens/invite_template_screen.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';

class TemplateScreenBottomSheetItem extends ConsumerWidget {
  const TemplateScreenBottomSheetItem({
    super.key,
    required this.templateName,
    required this.onChanged,
    required this.currentTemplate,
  });
  final String templateName;
  final String currentTemplate;
  final void Function(String?)? onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 14.w,
        vertical: 6.h,
      ),
      margin: EdgeInsets.symmetric(horizontal: 6.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
            color: templateName == currentTemplate
                ? AppColors.primary
                : AppColors.lightGray,
            width: 2.w),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            //TODO :id
            child: Text(
              getTemplateMessage(templateName, ref, null),
              style: AppTextStyle.rubikRegular16
                  .copyWith(color: AppColors.blackText),
            ),
          ),
          Radio(
              value: templateName,
              groupValue: currentTemplate,
              activeColor: AppColors.primary,
              onChanged: (val) {
                onChanged!(val);
              }),
        ],
      ),
    );
  }
}
