import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kroot_app/gen/assets.gen.dart';
import 'package:kroot_app/src/shared_widgets/custom_appbar.dart';
import 'package:kroot_app/src/utils/app_toast.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key, required this.paymentUrl});
  final String paymentUrl;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}
// 'https://kroot.akwad.qa/payment_form?order_id=al6ci2t52a&subscription_type=Basic&language=ENG',

class _PaymentScreenState extends State<PaymentScreen> {
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
            Assets.images.animationLoading.image();
          },
        ),
      )
      ..loadRequest(
        Uri.parse(
          widget.paymentUrl,
          // 'https://kroot.akwad.qa/payment_form?order_id=al6ci2t52a&subscription_type=Basic&language=ENG',
          // 'https://kroot.akwad.qa/payment_form?order_id=k9rh8gu6li&subscription_type=Basic&language=ENG',
        ),
      );
  }

  Future<void> _onPageFinished(String url) async {
    debugPrint('✅ Page loaded: $url');

    try {
      var bodyText = await controller.runJavaScriptReturningResult(
        "document.body.innerText",
      );

      debugPrint('📄 Body content: $bodyText');

      // if (Platform.isAndroid && (bodyText as String).contains('Txn Success')) {
      if (Platform.isAndroid && (bodyText as String).contains('message')) {
        _handleResult(bodyText);
      }
    } catch (e) {
      debugPrint('❌ Failed to parse response: $e');
    }
  }

  void _handleResult(String rawBody) {
    // if (_hasCompleted) return;
    // _hasCompleted = true;

    try {
      final bodyStr = rawBody.toString();

      // 1. Remove surrounding quotes if needed (on Android)
      final unquoted = bodyStr.startsWith('"') ? json.decode(bodyStr) : bodyStr;

      // 2. Parse the inner JSON string
      final parsed = json.decode(unquoted);

      print('----------------------');
      print(parsed['message']);

      if (parsed['message'] == 'Txn Success') {
        // if (parsed['message'] == 'Txn Success') {
        // widget.onResult?.call(true);
        context.pop(); // ✅ Return to success screen
        AppToast.doneToast('Payment succeeded');
      } else {
        debugPrint("⚠️ Payment failed or unknown response: $parsed");
        // widget.onResult?.call(false);
        context.pop(); // optional: go back with failure
        AppToast.errorToast('Payment failed');
      }
    } catch (e) {
      debugPrint("❌ Failed to decode or handle result: $e");
      // widget.onResult?.call(false);
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
