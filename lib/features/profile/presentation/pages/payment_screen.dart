import 'dart:convert';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kroot_app/features/event/presentation/controller/home_controller.dart';
import 'package:kroot_app/gen/assets.gen.dart';
import 'package:kroot_app/src/bottm_navigation_bar_provider.dart';
import 'package:kroot_app/src/routing/routes.dart';
import 'package:kroot_app/src/shared_widgets/custom_appbar.dart';
import 'package:kroot_app/src/utils/app_alert.dart';
import 'package:kroot_app/src/utils/app_toast.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentScreen extends ConsumerStatefulWidget {
  const PaymentScreen({super.key, required this.paymentUrl});
  final String paymentUrl;

  @override
  ConsumerState<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends ConsumerState<PaymentScreen> {
  late final WebViewController controller;
  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: _onPageFinished,
          onProgress: (progress) {
            // Assets.images.animationLoading.image();
            Center(child: MailPulseAnimation());
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.paymentUrl));
  }

  Future<void> _onPageFinished(String url) async {
    debugPrint('✅ Page loaded: $url');

    try {
      var bodyText = await controller.runJavaScriptReturningResult(
        "document.body.innerText",
      );

      debugPrint('📄 Body content: $bodyText');

      if (Platform.isAndroid && (bodyText as String).contains('message')) {
        _handleResult(bodyText);
      }
    } catch (e) {
      debugPrint('❌ Failed to parse response: $e');
    }
  }

  void _handleResult(String rawBody) {
    try {
      final bodyStr = rawBody.toString();

      final unquoted = bodyStr.startsWith('"') ? json.decode(bodyStr) : bodyStr;

      final parsed = json.decode(unquoted);

      if (parsed['message'] == 'Txn Success') {
        ref.read(bottomNavIndexProvider.notifier).setIndex(0);
        ref.read(homeControllerProvider.notifier).getUtils();
        context.go(Routes.main);
        AppToast.doneToast('successfullyCompleted'.tr());
      } else {
        debugPrint("⚠️ Payment failed or unknown response: $parsed");

        context.pop();
        AppToast.errorToast('Payment failed');
      }
    } catch (e) {
      debugPrint("❌ Failed to decode or handle result: $e");

      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Payment'),
      body: WebViewWidget(controller: controller),
    );
  }
}
