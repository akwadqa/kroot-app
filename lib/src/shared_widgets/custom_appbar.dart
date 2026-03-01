import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wedding_app/gen/assets.gen.dart';
import 'package:wedding_app/src/extenssions/int_extenssion.dart';
import 'package:wedding_app/src/shared_widgets/custom_back_arrow_widget.dart';
import 'package:wedding_app/src/theme/app_colors.dart';
import 'package:wedding_app/src/theme/app_text_style.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool? withBackButton;
  const CustomAppbar({super.key, required this.title, this.withBackButton});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: ui.TextDirection.ltr,
      child: Container(
        height: preferredSize.height,
        padding: EdgeInsets.symmetric(horizontal: 22.w),

        child: SafeArea(
          bottom: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (withBackButton ?? true)
                GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: Assets.icons.verificationArrowBackIc.svg(),
                ),

              Text(
                title,
                style: AppTextStyle.rubikMedium20.copyWith(
                  color: AppColors.primary,
                ),
              ),
              22.horizontalSpace,
            ],
          ),
        ),
      ),
    );
  }

  @override
  ui.Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
