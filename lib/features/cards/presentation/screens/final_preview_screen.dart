import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kroot_app/gen/assets.gen.dart';
import 'package:kroot_app/src/extenssions/int_extenssion.dart';
import 'package:kroot_app/src/extenssions/widget_extensions.dart';
import 'package:kroot_app/src/shared_widgets/custom_appbar.dart';
import 'package:kroot_app/src/shared_widgets/custom_button_widget.dart';
import 'package:kroot_app/src/theme/app_colors.dart';

class FinalPreviewScreen extends StatelessWidget {
  const FinalPreviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'final_preview'.tr()),
      body: const _FinalPreviewScreenContent(),
    );
  }
}

class _FinalPreviewScreenContent extends StatelessWidget {
  const _FinalPreviewScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          children: [
            20.verticalSpace,
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Assets.images.occasionCardImage.image(),
            ).symmetricPadding(horizontal: 17),
            47.verticalSpace,

            //? Confirm :
            CustomButtonWidget(
                text: 'pay_now',
                backgroundColor: AppColors.primary,
                color: AppColors.white,
                onTap: () {},
                isFiled: true,
                height: 50,
                width: double.infinity)
          ],
        ));
  }
}
