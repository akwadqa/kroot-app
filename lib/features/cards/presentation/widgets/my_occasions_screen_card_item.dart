import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kroot_app/features/cards/domain/confirm_card_preview_response/confirm_preview_card_response.dart';
import 'package:kroot_app/src/routing/routes.dart';
import 'package:kroot_app/src/shared_widgets/custom_button_widget.dart';
import 'package:kroot_app/src/shared_widgets/fade_circle_loading_indicator.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';
import 'package:kroot_app/src/utils/download_image.dart';
import 'package:kroot_app/src/utils/functions.dart';

import '../../../../gen/assets.gen.dart';

class MyOccasionsScreenCardItem extends ConsumerWidget {
  const MyOccasionsScreenCardItem({super.key, required this.card});

  final ConfirmPreviewCardResponse card;

  String? resolveImageUrl() {
    final imagePath = card.finalImage;

    final baseUrl = dotenv.env['API_PRODUCTION_BASE_IMAGE'] ?? '';
    if (imagePath == null || imagePath.isEmpty) return null;
    if (imagePath.startsWith('http')) return imagePath;
    final base = baseUrl.endsWith('/') ? baseUrl : '$baseUrl/';
    final path = imagePath.startsWith('/') ? imagePath.substring(1) : imagePath;
    return '$base$path';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        context.push(Routes.cardPreview, extra: card);
        // ref
        //     .read(goRouterProvider)
        //     .push(Routes.eventDetails, extra: {'id': event.occasionId});
      },
      child: Container(
        width: double.infinity,
        height: 161.h,
        // padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: AppColors.grayField,
        ),
        child: Row(
          children: [
            Container(
              width: 116.w,
              height: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.white,
                // boxShadow: [
                //   BoxShadow(
                //     offset: Offset(0, 4),
                //     blurRadius: 4,
                //     spreadRadius: 0,
                //     color: AppColors.black.withValues(alpha: .25),
                //   ),
                // ],
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: AppColors.primary),
              ),
              child: (resolveImageUrl() != null)
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: CachedNetworkImage(
                        fadeInCurve: Curves.linear,
                        placeholder: (context, url) =>
                            FadeCircleLoadingIndicator(),
                        imageUrl: resolveImageUrl()!,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Icon(
                      Icons.card_giftcard_sharp,
                      color: AppColors.primary,
                    ),
            ),
            10.horizontalSpace,
            Column(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  card.category ?? '',
                  style: AppTextStyle.rubikMedium14
                      .copyWith(color: AppColors.black900),
                ),
                Text(card.name ?? '',
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.rubikMedium16
                        .copyWith(color: AppColors.blackText)),
                Row(
                  spacing: 8,
                  children: [
                    CustomButtonWidget(
                      content: Row(
                        spacing: 5,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Assets.icons.downloadIc.svg(),
                          Text(
                            'download'.tr(),
                            style: AppTextStyle.rubikRegular14.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                      backgroundColor: AppColors.primary,
                      text: '',
                      radius: 32.r,
                      onTap: () {
                        FileDownloadService.downloadImageToDownloads(
                            resolveImageUrl() ?? '', '${card.name}.png', ref);
                      },
                      isFiled: false,
                      height: 28.h,
                      width: 100.w,
                      topPading: 0,
                    ),
                    CustomButtonWidget(
                      content: Row(
                        spacing: 5,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Assets.icons.shareIc.svg(),
                          Text(
                            context.tr('share'),
                            style: AppTextStyle.rubikRegular14.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                      backgroundColor: AppColors.lightBlue4,
                      text: '',
                      radius: 32.r,
                      onTap: () {
                        sharePost(
                          ref: ref,
                          imageUrl: resolveImageUrl(),
                        );
                      },
                      isFiled: false,
                      height: 28.h,
                      width: 82.w,
                      topPading: 0,
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
