import 'package:flutter/material.dart';
import 'package:kroot_app/src/theme/app_colors.dart';

void notifyUser({
  required BuildContext context,
  required String message,
  required bool success,
}) {
  final snackBar = SnackBar(
    content: Text(
      message,
      style: Theme.of(
        context,
      ).textTheme.bodySmall!.copyWith(color: AppColors.offWhite),
    ),
    behavior: SnackBarBehavior.floating,
    backgroundColor: success ? Colors.green : Colors.red,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
