import 'dart:async';
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wedding_app/features/auth/application/auth_service.dart';
import 'package:wedding_app/src/extenssions/int_extenssion.dart';
import 'package:wedding_app/src/extenssions/widget_extensions.dart';
import 'package:wedding_app/src/shared_widgets/custom_button_widget.dart';
import '../../gen/assets.gen.dart';
import '../theme/app_colors.dart';
// app_dialogs.dart
import 'package:flutter/material.dart';

class AppDialogs {
  AppDialogs._();

  /// Simple loading overlay (blocks UI)
  static Future<void> loading(
    BuildContext context, {
    bool dismissible = false,
  }) {
    return showDialog<void>(
      context: context,
      barrierDismissible: dismissible,
      useRootNavigator: true,
      builder: (_) => const Center(
        child: _LoadingIndicator(),
      ),
    );
  }

  /// Close any open dialog (loading or others)
  static void close(BuildContext context) {
    if (Navigator.of(context, rootNavigator: true).canPop()) {
      Navigator.of(context, rootNavigator: true).pop();
    }
  }

  /// Success dialog with optional [message] and/or custom [child] content.
  static Future<void> success(
    BuildContext context, {
    required String title,
    String? message,
    Widget? child,
    String okText = 'OK',
    bool dismissible = true,
  }) {
    return showDialog<void>(
      context: context,
      barrierDismissible: dismissible,
      builder: (_) => _ResultDialog(
        icon: const Icon(Icons.check_circle, color: Colors.green, size: 24),
        title: title,
        message: message,
        child: child,
        okText: okText,
      ),
    );
  }

  /// Error dialog with optional [message] and/or custom [child] content.
  static Future<void> error(
    BuildContext context, {
    required String title,
    String? message,
    Widget? child,
    String okText = 'OK',
    bool dismissible = true,
  }) {
    return showDialog<void>(
      context: context,
      barrierDismissible: dismissible,
      builder: (_) => _ResultDialog(
        icon: const Icon(Icons.cancel, color: Colors.red, size: 24),
        title: title,
        message: message,
        child: child,
        okText: okText,
      ),
    );
  }

  /// Confirm dialog (returns true if confirmed)
  static Future<bool> confirm(
    BuildContext context, {
    required String title,
    String? message,
    Widget? child,
    String cancelText = 'Cancel',
    String confirmText = 'Confirm',
    bool destructive = false,
    bool dismissible = true,
  }) async {
    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: dismissible,
      builder: (_) => _ConfirmDialog(
        title: title,
        message: message,
        child: child,
        cancelText: cancelText,
        confirmText: confirmText,
        destructive: destructive,
      ),
    );
    return result ?? false;
  }
}

/// -------------------- Internals --------------------

class _LoadingIndicator extends StatelessWidget {
  const _LoadingIndicator();

  @override
  Widget build(BuildContext context) {
    final bg = Theme.of(context).dialogBackgroundColor;
    return Material(
      color: Colors.black38,
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(16),
          ),
          child: const SizedBox(
            width: 48,
            height: 48,
            child: CircularProgressIndicator(strokeWidth: 3),
          ),
        ),
      ),
    );
  }
}

class _ResultDialog extends StatelessWidget {
  final Widget icon;
  final String title;
  final String? message;
  final Widget? child;
  final String okText;

  const _ResultDialog({
    required this.icon,
    required this.title,
    this.message,
    this.child,
    required this.okText,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleMedium;
    final bodyStyle = Theme.of(context).textTheme.bodyMedium;

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      titlePadding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      contentPadding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
      actionsPadding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
      title: Row(
        children: [
          icon,
          const SizedBox(width: 8),
          Expanded(child: Text(title, style: titleStyle)),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (message != null) Text(message!, style: bodyStyle),
          if (message != null && child != null) const SizedBox(height: 12),
          if (child != null) child!,
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(okText),
        ),
      ],
    );
  }
}

class _ConfirmDialog extends StatelessWidget {
  final String title;
  final String? message;
  final Widget? child;
  final String cancelText;
  final String confirmText;
  final bool destructive;

  const _ConfirmDialog({
    required this.title,
    this.message,
    this.child,
    required this.cancelText,
    required this.confirmText,
    required this.destructive,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleMedium;
    final bodyStyle = Theme.of(context).textTheme.bodyMedium;

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      titlePadding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      contentPadding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
      actionsPadding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
      title: Text(title, style: titleStyle),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (message != null) Text(message!, style: bodyStyle),
          if (message != null && child != null) const SizedBox(height: 12),
          if (child != null) child!,
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: Text(cancelText),
        ),
        FilledButton(
          style: destructive
              ? FilledButton.styleFrom(backgroundColor: Colors.red)
              : null,
          onPressed: () => Navigator.pop(context, true),
          child: Text(confirmText),
        ),
      ],
    );
  }
}

Future<void> showCustomDialog({
  required BuildContext context,
  required Widget title,
  Widget? icon,
  bool? withDismiss,
}) {
  return showDialog(
    context: context,
    barrierDismissible: withDismiss ?? true,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 300, // Replace with appropriate fixed or dynamic size
            maxHeight: 400,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 50),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                icon ?? SizedBox(),
                28.verticalSpace,
                title,
                // Text(
                //   title,
                //   textAlign: TextAlign.center,
                //   style: Theme.of(context)
                //       .textTheme
                //       .displayLarge!
                //       .copyWith(fontSize: 22),
                // ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

Future<void> showAutoClosingDialog(BuildContext context, String message) async {
  Timer timer;

  // Start timer to auto-close the dialog
  timer = Timer(Duration(seconds: 3), () {
    Navigator.of(context).pop();
  });

  await showDialog(
    context: context,
    barrierDismissible: true, // User can still tap outside to close
    builder: (context) => AlertDialog(
      title: Text(
        message,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
          fontSize: 16,
          // fontWeight: FontWeight.w700,
          // color: Colors.grey,
        ),
      ).centered(),
      icon: Icon(Icons.error, color: AppColors.darkRed, size: 50),
      actions: [
        TextButton(
          onPressed: () {
            if (timer.isActive) timer.cancel();
            Navigator.of(context).pop(); // User manually closes
          },
          child: Text(
            "OK",
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ).centered(),
        ),
      ],
    ),
  ).then((val) {
    if (timer.isActive) {
      timer.cancel();
    }
  });
}

Dialog showYesNowChoicesDialog(
  BuildContext context, {
  required String title,
  required String dsc,
  required VoidCallback yesButton,
  VoidCallback? noButton,
}) {
  return Dialog(
    insetPadding: EdgeInsets.symmetric(horizontal: 20),
    backgroundColor: Colors.white.withOpacity(0.8),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        40.verticalSpace,
        Text(
          title.tr(),
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            // color: Colors.grey,
          ),
        ).centered(),
        40.verticalSpace,
        Text(
          dsc.tr(),
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
            fontSize: 14,
            color: AppColors.darkerGray,
            fontWeight: FontWeight.w500,
          ),
        ).centered(),
        40.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: CustomButtonWidget(
                text: context.tr("yes"),
                onTap: yesButton,
                backgroundColor: AppColors.black,
                isFiled: true,
                height: 45,
                radius: 12,
                width: MediaQuery.sizeOf(context).width,
              ),
            ),
            20.horizontalSpace,
            Flexible(
              child: CustomButtonWidget(
                text: context.tr("no"),
                onTap:
                    noButton ??
                    () {
                      Navigator.pop(context);
                    },
                color: AppColors.black,
                isFiled: false,
                // b: AppColors.darkGray,
                height: 45,
                radius: 12,
                width: MediaQuery.sizeOf(context).width,
              ),
            ),
          ],
        ),
      ],
    ).symmetricPadding(horizontal: 20, vertical: 25),
  );
}


void showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Consumer(
        builder: (context, ref, _) {
          final userData = ref.read(userDataProvider.notifier);
          return Container(
            child: showYesNowChoicesDialog(
              context,
              title: "logout".tr(),
              dsc: "logout_confirmation".tr(),
              yesButton: () async {
                Navigator.pop(context);
                await userData.removeData();
                // context.router.replaceAll([const LoginRoute()]);

                // Navigator.pop(context);
              },
            ),
          );
        },
      );
    },
  );
}

showErrorDialog(BuildContext context, String message) {
  return showCustomDialog(
    context: context,
    title: Text(message),
    icon: Icon(Icons.error, color: AppColors.darkRed, size: 50),
  );
}

showAboutInfoDialog(
  BuildContext context,
  String message, {
  IconData? icon,
  Color? iconColor,
  bool? withDismiss,
}) {
  return showCustomDialog(
    withDismiss: withDismiss,
    context: context,
    title: Text(message),
    icon: Icon(
      icon ?? Icons.info,
      color: iconColor ?? AppColors.primary,
      size: 50,
    ),
  );
}

Future<void> showSuccessWiwthdrawingDialog({required BuildContext context}) {
  return showDialog(
    context: context,
    useSafeArea: false,
    builder: (BuildContext context) {
      return Dialog(
        insetPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            Icon(
              Icons.check_circle_rounded,
              color: AppColors.primary,
              size: 175,
            ),
            28.verticalSpace,
            Text(
              "the request has been successfully sent",
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.displayLarge!.copyWith(fontSize: 22),
            ),
            20.verticalSpace,
            Text(
              "your request is being processed",
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.displayMedium!.copyWith(fontSize: 16),
            ),
            Spacer(),
            CustomButtonWidget(
              text: context.tr("main screen"),
              onTap: () {
                Navigator.pop(context);
              },
              backgroundColor: AppColors.black,
              color: AppColors.white,
              isFiled: false,
              // borderColor: AppColors.darkGray,
              height: 50,
              radius: 12,
              width: MediaQuery.sizeOf(context).width,
            ).onlyPadding(bottom: 25, start: 16, end: 16),
          ],
        ),
      );
    },
  );
}
