import 'dart:convert';
import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kroot_app/features/cards/domain/confirm_card_preview_response/confirm_preview_card_response.dart';
import 'package:kroot_app/features/cards/presentation/controller/cards_controller.dart';
import 'package:kroot_app/gen/assets.gen.dart';
import 'package:kroot_app/src/bottm_navigation_bar_provider.dart';
import 'package:kroot_app/src/extenssions/int_extenssion.dart';
import 'package:kroot_app/src/extenssions/widget_extensions.dart';
import 'package:kroot_app/src/routing/routes.dart';
import 'package:kroot_app/src/shared_widgets/app_error_widget.dart';
import 'package:kroot_app/src/shared_widgets/custom_appbar.dart';
import 'package:kroot_app/src/shared_widgets/custom_button_widget.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';
import 'package:kroot_app/src/utils/app_alert.dart';
import 'package:kroot_app/src/utils/download_image.dart';
import 'package:kroot_app/src/utils/functions.dart';

class CardPreviewScreen extends StatelessWidget {
  const CardPreviewScreen(
      {super.key, required this.confirmPreviewCardResponse});
  final ConfirmPreviewCardResponse confirmPreviewCardResponse;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'final_preview'.tr()),
      body: _CardPreviewScreenScreenContent(
          confirmPreviewCardResponse: confirmPreviewCardResponse),
    );
  }
}

class _CardPreviewScreenScreenContent extends ConsumerStatefulWidget {
  const _CardPreviewScreenScreenContent(
      {super.key, required this.confirmPreviewCardResponse});
  final ConfirmPreviewCardResponse confirmPreviewCardResponse;

  @override
  ConsumerState<_CardPreviewScreenScreenContent> createState() =>
      _CardPreviewScreenScreenContentState();
}

class _CardPreviewScreenScreenContentState
    extends ConsumerState<_CardPreviewScreenScreenContent> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final base = dotenv.env['BASE_IMAGE'] ?? '';

    return _buildBody(base + widget.confirmPreviewCardResponse.finalImage);
  }

  Widget _buildBody(String url) {
    return SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          children: [
            20.verticalSpace,
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: url,
                height: 500,
              ),
            ).symmetricPadding(horizontal: 17),
            30.verticalSpace,

            //? Confirm :
            CustomButtonWidget(
                text: 'download'.tr(),
                backgroundColor: AppColors.primary,
                color: AppColors.white,
                onTap: () {
                  FileDownloadService.downloadImageToDownloads(url,
                      '${widget.confirmPreviewCardResponse.name}.png', ref);
                },
                isFiled: true,
                height: 50,
                width: double.infinity),
            20.verticalSpace,
            CustomButtonWidget(
              text: '',
              onTap: () {
                sharePost(
                  ref: ref,
                  imageUrl: url,
                );
              },
              isFiled: true,
              content: Text(
                context.tr('share'),
                style:
                    AppTextStyle.nunitoBold16.copyWith(color: AppColors.black),
              ),
              boxDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    color: AppColors.primary.withValues(alpha: .25),
                  ),
                ],
              ),
              height: 50,
              width: double.infinity,
              backgroundColor: AppColors.white,
            ),
            20.verticalSpace,
            CustomButtonWidget(
              text: '',
              onTap: () {
                ref.read(bottomNavIndexProvider.notifier).setIndex(0);
                context.go(Routes.main);
              },
              isFiled: true,
              content: Text(
                context.tr('back_to_home'),
                style: AppTextStyle.nunitoBold16
                    .copyWith(color: AppColors.primary),
              ),
              boxDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    color: AppColors.primary.withValues(alpha: .25),
                  ),
                ],
              ),
              height: 50,
              width: double.infinity,
              backgroundColor: AppColors.white,
            ),
            20.verticalSpace,
          ],
        ));
  }
}
