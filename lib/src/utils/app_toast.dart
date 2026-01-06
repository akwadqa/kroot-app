import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';
import 'package:kroot_app/src/theme/app_colors.dart';

class AppToast {
  static void errorToast(String message) {
    if (message.isEmpty) {
      message = 'Error , please try again later';
    }
    message = message.replaceAll('Exception:', '').trim();

    if (message.contains('null')) message = 'Error , please try again later';

    toastification.dismissAll();

    toastification.show(
      autoCloseDuration: const Duration(seconds: 5),
      alignment: Alignment.bottomCenter,
      type: ToastificationType.error,
      showProgressBar: false,
      style: ToastificationStyle.flat,
      description: Text(message),
    );
  }

  static void doneToast(String message) {
    toastification.dismissAll();
    toastification.show(
      autoCloseDuration: const Duration(seconds: 5),
      alignment: Alignment.bottomCenter,
      primaryColor: AppColors.deepGreen,
      showProgressBar: false,
      style: ToastificationStyle.flat,
      type: ToastificationType.success,
      description: Text(message),
    );
  }
}
