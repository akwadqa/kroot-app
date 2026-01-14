import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kroot_app/features/event/presentation/controller/home_controller.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';

class CreateEventPageSelectLanguageField extends ConsumerWidget {
  final List<DropdownMenuItem<String>> items;
  final String title;
  final String? value;
  final void Function(String?)? onChanged;

  const CreateEventPageSelectLanguageField({
    super.key,
    required this.items,
    required this.value,
    required this.title,
    required this.onChanged,
  });

  T? effectiveSelection<T>({
    required T? selected,
    required List<T> items,
    T? fallback,
  }) {
    if (selected != null && items.contains(selected)) return selected;
    return fallback ?? (items.isNotEmpty ? items.first : null);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final first = ref
    //     .read(homeControllerProvider)
    //     .value!
    //     .utilsResponse!
    //     .value!
    //     .templates!
    //     .first
    //     .name;

    // final safeValue = effectiveSelection<String>(
    //   selected: value,
    //   items: items.map((e) => e.value!).toList(),
    //   fallback: first,
    // );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(title, style: AppTextStyle.rubikRegular18),
        12.verticalSpace,
        Container(
          decoration: BoxDecoration(
            color: AppColors.grayField,
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 1),
                blurRadius: 2,
                spreadRadius: 3,
                color: AppColors.grayShadow.withValues(alpha: .24),
              ),
            ],
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButtonFormField2<String>(
              // في dropdown_button2 نستخدم value (بدل initialValue)
              value: value,

              items: items,

              onChanged: (val) {
                // نفس سلوكك + أكثر أمانًا من !
                onChanged?.call(val);
              },

              // hint الأفضل يكون هنا (بدل InputDecoration.hint) لتطابق سلوك الحزمة
              hint: items.isNotEmpty ? items.first.child : null,

              isExpanded: true,
              isDense: true,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(color: AppColors.grayBorder),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(color: AppColors.grayBorder),
                ),
              ),

              // تخصيص الأيقونة من خصائص dropdown_button2 بدل suffixIcon
              iconStyleData: IconStyleData(
                icon: Icon(
                  Icons.arrow_drop_down_rounded,
                  color: AppColors.primary,
                ),
                iconSize: 28, // اختياري
              ),

              buttonStyleData: const ButtonStyleData(padding: EdgeInsets.zero),
              dropdownStyleData: DropdownStyleData(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
              menuItemStyleData: const MenuItemStyleData(height: 48),
            ),
          ),
        ),
      ],
    );
  }
}
