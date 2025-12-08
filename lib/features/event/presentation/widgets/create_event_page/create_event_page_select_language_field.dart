import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kroot_app/gen/assets.gen.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';

class CreateEventPageSelectLanguageField extends ConsumerWidget {
  final List<DropdownMenuItem<String>> items;
  final String title;
  final String? value;
  final void Function(String?)? onChanged;
  const CreateEventPageSelectLanguageField({
    required this.items,
    required this.value,
    super.key,
    required this.title,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title, style: AppTextStyle.rubikRegular18),
        12.verticalSpace,
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 1),
                blurRadius: 2,
                spreadRadius: 3,
                color: AppColors.grayShadow.withValues(alpha: .24),
              ),
            ],
          ),
          child: DropdownButtonFormField<String>(
            initialValue: value,
            onChanged: (val) {
              onChanged!(val);
            },
            items: items,
            decoration: InputDecoration(
              suffixIcon: Icon(
                Icons.arrow_drop_down_rounded,
                color: AppColors.primary,
              ),
              hint: items.first.child,

              // hint: Text(
              //   // context.tr('arabic'),
              //   items.first.child ?? '',
              //   style: AppTextStyle.rubikRegular16.copyWith(
              //     color: AppColors.grayHint,
              //   ),
              // ),
              contentPadding: EdgeInsets.zero,
              prefixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 17.w),
                child: Assets.icons.languageIc.svg(),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(color: AppColors.primary),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: BorderSide(color: AppColors.grayBorder),
              ),
              // prefixIconConstraints: BoxConstraints(maxWidth: 18),
            ),
          ),
        ),
      ],
    );
  }
}
