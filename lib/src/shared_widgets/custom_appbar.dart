import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kroot_app/gen/assets.gen.dart';
import 'package:kroot_app/src/extenssions/int_extenssion.dart';
import 'package:kroot_app/src/routing/routes.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool? withBackButton;
  final Widget? actionButton;
  const CustomAppbar({
    super.key,
    required this.title,
    this.withBackButton = true,
    this.actionButton,
  });

  @override
  Widget build(BuildContext context) {
    final double topPadding = MediaQuery.of(context).padding.top;

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        // height: 90,
        height: preferredSize.height + topPadding,
        padding: EdgeInsets.symmetric(horizontal: 22),
        child: SafeArea(
          bottom: false,

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              (withBackButton ?? false)
                  ? GestureDetector(
                      onTap: () {
                        if (context.canPop()) {
                          context.pop();
                        } else {
                          context.go(Routes.main);
                        }
                      },
                      child: Assets.icons.verificationArrowBackIc.svg(
                        width: 30,
                      ),
                    )
                  : 22.horizontalSpace,

              Center(
                child: Text(
                  title,
                  style: AppTextStyle.rubikMedium20.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
              (actionButton != null) ? actionButton! : 22.horizontalSpace,
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
