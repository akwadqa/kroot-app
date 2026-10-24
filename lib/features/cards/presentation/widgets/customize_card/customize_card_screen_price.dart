import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kroot_app/features/event/presentation/controller/home_controller.dart';
import 'package:kroot_app/src/routing/routes.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';

class CustomizeCardScreenPrice extends ConsumerWidget {
  const CustomizeCardScreenPrice({
    super.key,
    required this.price,
  });
  final num price;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isReview = ref.watch(
      homeControllerProvider.select(
        (val) => val.value?.utilsResponse?.value?.appleReview,
      ),
    );
    return GestureDetector(
      onTap: () {
        if (isReview != 1) {
          context.push(Routes.bundle);
        }
      },
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
