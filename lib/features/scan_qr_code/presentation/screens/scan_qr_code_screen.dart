import 'package:go_router/go_router.dart';
import 'package:kroot_app/features/scan/presentation/controller/scan_controller.dart';
import 'package:kroot_app/features/scan_qr_code/presentation/controller/scan_qr_code_controller.dart';
import 'package:kroot_app/features/scan_qr_code/presentation/screens/gates_screen.dart';
import 'package:kroot_app/src/shared_widgets/app_dialogs.dart';
import 'package:kroot_app/src/shared_widgets/custom_appbar.dart';
import 'package:kroot_app/src/shared_widgets/fade_circle_loading_indicator.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:kroot_app/src/utils/app_alert.dart';
import 'package:kroot_app/src/utils/app_toast.dart';

class ScanQrCodeScreen extends ConsumerStatefulWidget {
  const ScanQrCodeScreen({super.key});

  @override
  ConsumerState<ScanQrCodeScreen> createState() => _ScanQrCodeScreenState();
}

class _ScanQrCodeScreenState extends ConsumerState<ScanQrCodeScreen> {
  late MobileScannerController _cameraController;
  final TextEditingController driverIdController = TextEditingController();

  bool _isScanning = true;
  String? _scannedCode;
  int _scannerVersion = 0;

  @override
  void initState() {
    _initializeCamera();

    super.initState();
  }

  void _initializeCamera() {
    _cameraController = MobileScannerController(autoStart: true);
  }

  @override
  void dispose() {
    driverIdController.dispose();
    _cameraController.dispose();
    super.dispose();
  }

  Future<void> _handleScan(BarcodeCapture capture) async {
    if (!_isScanning || capture.barcodes.isEmpty) return;

    final code = capture.barcodes.first.rawValue;
    if (code != null && code.isNotEmpty) {
      _stopScanning();
      setState(() {
        _scannedCode = code;
        driverIdController.text = code;
      });

      await ref
          .read(scanQrCodeControllerProvider.notifier)
          .setScannedCode(code);

      ref
          .read(scanControllerProvider.notifier)
          .scanQr(qrCode: code, inviteeId: 'OINV-0185');
    }
  }

  void _stopScanning() {
    setState(() => _isScanning = false);
  }

  Future<void> resetScanner() async {
    await _cameraController.stop();

    setState(() {
      _isScanning = true;
      _scannedCode = null;
      _scannerVersion++;
    });

    _initializeCamera();
  }

  Future<void> _submitQrCode(String gate) async {
    debugPrint("Submitted Driver ID from QR: $gate");
    FocusScope.of(context).unfocus();
    await ref
        .read(scanQrCodeControllerProvider.notifier)
        .setScannedCode(_scannedCode!);

    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => const GatesScreen()));
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(scanControllerProvider, (prev, next) {
      if (next is AsyncLoading) {
        AppAlert.showLoadingDialog(context);
      }

      if (next is AsyncData) {
        context.pop();
        AppToast.doneToast(next.value!.scanQrResponse!.invitee);
      }
      if (next is AsyncError) {
        context.pop();
        AppToast.errorToast(next.error!.toString());
      }
    });

   

    ref.listen<AsyncValue<ScanDriverQrState?>>(scanQrCodeControllerProvider, (
      prev,
      next,
    ) {
      debugPrint("📡 Listener triggered: $next");

      if (next is AsyncLoading) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const Center(child: FadeCircleLoadingIndicator()),
          );
        });
      }

      if (next is AsyncError) {
        debugPrint("❌ Error in controller: ${next.error}");
        Navigator.of(context, rootNavigator: true).pop();

        WidgetsBinding.instance.addPostFrameCallback((_) async {
          Navigator.of(context, rootNavigator: true).pop();
          await showAutoClosingDialog(context, next.error.toString());
        });
      }
    });
    return Scaffold(
      appBar: CustomAppbar(title: context.tr('scanTheQrCode')),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Text(
              "scan_code_msg".tr(),
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 30),

            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 300,
                width: double.infinity,
                color: AppColors.lightGray,
                alignment: Alignment.center,
                child: _isScanning
                    ? MobileScanner(
                        key: Key('scanner_$_scannerVersion'),
                        controller: _cameraController,
                        onDetect: _handleScan,
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.qr_code, size: 60, color: AppColors.gray),
                          const SizedBox(height: 12),
                          Text(
                            _scannedCode ?? '',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 12),
                          TextButton(
                            onPressed: () => resetScanner(),
                            child: Text("scan_again".tr()),
                          ),
                        ],
                      ),
              ),
            ),

            const SizedBox(height: 50),

            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
