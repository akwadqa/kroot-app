import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kroot_app/gen/assets.gen.dart';
import 'package:kroot_app/src/shared_widgets/fade_circle_loading_indicator.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';
import 'package:kroot_app/src/utils/image_picker.dart';

class EventDetailsImage extends StatelessWidget {
  final String? imageUrl;
  final void Function(File image) onImageSelect;
  final File? image;
  final void Function()? deleteFile, deleteLink;
  const EventDetailsImage({
    super.key,
    required this.image,
    required this.onImageSelect,
    required this.imageUrl,
    required this.deleteFile,
    required this.deleteLink,
  });
  String? resolveImageUrl() {
    final imagePath = imageUrl;
    final baseUrl = dotenv.env['API_PRODUCTION_BASE_IMAGE'] ?? '';
    if (imagePath == null || imagePath.isEmpty) return null;
    if (imagePath.startsWith('http')) return imagePath;
    final base = baseUrl.endsWith('/') ? baseUrl : '$baseUrl/';
    final path = imagePath.startsWith('/') ? imagePath.substring(1) : imagePath;
    return '$base$path';
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
      child: GestureDetector(
        onTap: () async {
          final newImage = await pickImage();
          if (newImage != null) {
            onImageSelect(newImage);
          }
        },
        child: image == null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(7.r),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: imageUrl != null && imageUrl!.isNotEmpty
                        ? 0
                        : 16.w,
                    vertical: imageUrl != null && imageUrl!.isNotEmpty
                        ? 0
                        : 13.h,
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.grayField,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.grayBorder,
                        offset: Offset(0, 1),
                        blurRadius: 4,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: (imageUrl != null && imageUrl!.isNotEmpty)
                      ? SizedBox(
                          width: double.infinity,
                          height: 182.h,

                          child: Stack(
                            children: [
                              CachedNetworkImage(
                                fadeInCurve: Curves.linear,
                                placeholder: (context, url) =>
                                    FadeCircleLoadingIndicator(),
                                imageUrl: resolveImageUrl()!,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                              Positioned(
                                top: 11.h,
                                width: 25.w,
                                height: 25.w,
                                right: 11.h,
                                child: GestureDetector(
                                  onTap: () {
                                    if (deleteLink != null) {
                                      deleteLink!();
                                    }
                                  },
                                  child: Assets.icons.deleteImageIc.svg(
                                    height: 22.w,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : Row(
                          children: [
                            Text(
                              context.tr('uploadImage'),
                              style: AppTextStyle.rubikRegular16.copyWith(
                                color: AppColors.grayHint,
                              ),
                            ),
                          ],
                        ),
                ),
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(7.r),
                child: Center(
                  child: AnimatedSwitcher(
                    duration: Duration(milliseconds: 300),
                    switchInCurve: Curves.easeIn,
                    switchOutCurve: Curves.easeOut,
                    child: SizedBox(
                      width: double.infinity,
                      height: 182.h,
                      child: Stack(
                        children: [
                          Image.file(
                            image!,
                            width: double.infinity,
                            height: double.infinity,
                            key: ValueKey(image!.path),
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            top: 11.h,
                            width: 25.w,
                            height: 25.w,
                            right: 11.h,
                            child: GestureDetector(
                              onTap: () {
                                if (deleteFile != null) {
                                  deleteFile!();
                                }
                              },
                              child: Assets.icons.deleteImageIc.svg(
                                height: 22.w,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
