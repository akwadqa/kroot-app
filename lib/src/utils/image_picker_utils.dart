import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../theme/app_colors.dart';

Future<File?> showImageSourcePicker(BuildContext context) async {
  final picker = ImagePicker();
  File? pickedFile;

  await showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.camera_alt, color: AppColors.grey600),
              title: Text(
                'take_photo'.tr(),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: 15, fontWeight: FontWeight.w600),
              ),
              onTap: () async {
                final image =
                    await picker.pickImage(source: ImageSource.camera);
                if (image != null) pickedFile = File(image.path);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading:
                  const Icon(Icons.photo_library, color: AppColors.grey600),
              title: Text(
                'Choose_from_gallery'.tr(),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: 15, fontWeight: FontWeight.w600),
              ),
              onTap: () async {
                final image =
                    await picker.pickImage(source: ImageSource.gallery);
                if (image != null) pickedFile = File(image.path);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    },
  );

  return pickedFile;
}
