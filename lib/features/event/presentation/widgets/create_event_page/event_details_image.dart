import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kroot_app/gen/assets.gen.dart';
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
    final baseUrl = 'https://kroot.akwad.qa/';
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
      child: DottedBorder(
        options: RoundedRectDottedBorderOptions(
          color: AppColors.primary,
          strokeWidth: 2,
          radius: Radius.circular(7.r),
          dashPattern: [6, 3],
        ),
        child: GestureDetector(
          onTap: () async {
            final newImage = await pickImage();
            if (newImage != null) {
              onImageSelect(newImage);
            }
          },
          child: image == null
              ? Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 13.h,
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.grayBorder,
                        offset: Offset(0, 1),
                        blurRadius: 4,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: (imageUrl != null)
                      ? SizedBox(
                          width: double.infinity,
                          height: 182.h,
                          child: Stack(
                            children: [
                              CachedNetworkImage(
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
                                    print('delete image');
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
                            Assets.icons.uploadImageIc.svg(),
                            15.horizontalSpace,
                            Text(
                              context.tr('uploadImage'),
                              style: AppTextStyle.rubikRegular16.copyWith(
                                color: AppColors.grayHint,
                              ),
                            ),
                          ],
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
                                  print('delete image');
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
      ),
    );
  }
}
