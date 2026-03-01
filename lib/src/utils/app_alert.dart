import 'package:flutter/material.dart';
import 'package:wedding_app/src/theme/app_colors.dart';

class AppAlert {
  //? Loading :
  static void showLoadingDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      pageBuilder: (ctx, animation, secondaryAnimation) {
        // dialogContext = ctx;
        return PopScope(
          canPop: false,
          child: const Center(
            child: CircularProgressIndicator(color: AppColors.primary),
          ),
        );
      },
    );
  }
}
