import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kroot_app/src/routing/routes.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';

class CustomizeCardScreenPrice extends StatelessWidget {
  const CustomizeCardScreenPrice({
    super.key,
    required this.price,
  });
  final num price;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(Routes.bundle),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
        decoration: BoxDecoration(
          color: AppColors.lightBlue3,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${'price'.tr()}:',
              style:
                  AppTextStyle.rubikMedium18.copyWith(color: AppColors.primary),
            ),
            Text(
              '$price ${'cards'.tr()}',
              style:
                  AppTextStyle.rubikRegular14.copyWith(color: AppColors.black),
            )
          ],
        ),
      ),
    );
  }
}
