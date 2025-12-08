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

  // final String inviteeId;

  @override
  ConsumerState<ScanQrCodeScreen> createState() => _ScanQrCodeScreenState();
}

class _ScanQrCodeScreenState extends ConsumerState<ScanQrCodeScreen> {
  late MobileScannerController _cameraController;
  final TextEditingController driverIdController = TextEditingController();

  bool _isScanning = true;
  String? _scannedCode;
  int _scannerVersion = 0; // Version counter for forcing rebuild

  @override
  void initState() {
    _initializeCamera();

    super.initState();
    // resetScanner();
  }

  void _initializeCamera() {
    _cameraController = MobileScannerController(
      autoStart: true,
      // formats: [BarcodeFormat.qrCode],
    );
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
      // NEW: store QR + fetch gates + navigate
      await ref
          .read(scanQrCodeControllerProvider.notifier)
          .setScannedCode(code);

      // TODO : here the scan api :
      ref
          .read(scanControllerProvider.notifier)
          .scanQr(
            qrCode: code,
            checkinBy: 'Administrator',
            // inviteeId: widget.inviteeId,
            inviteeId: 'OINV-0185',
          );
      // Navigator.of(
      //   context,
      // ).push(MaterialPageRoute(builder: (_) => const GatesScreen()));
    }
  }

  void _stopScanning() {
    setState(() => _isScanning = false);
  }

  Future<void> resetScanner() async {
    // Dispose old controller
    await _cameraController.stop();

    // Reset state
    setState(() {
      _isScanning = true;
      _scannedCode = null;
      _scannerVersion++; // Force complete rebuild
    });

    // Reinitialize camera
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

    final scanDriverQrController = ref.watch(
      scanQrCodeControllerProvider.notifier,
    );

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
          // showErrorDialog(context, next.error.toString());
        });
      }

      // if (next is AsyncData) {
      //   debugPrint("✅ Order data received: ${next.value}");
      //   WidgetsBinding.instance.addPostFrameCallback((_) {
      //     if (Navigator.of(context, rootNavigator: true).canPop()) {
      //       Navigator.of(context, rootNavigator: true).pop();
      //     }
      //   });
      // }
    });
    return Scaffold(
      appBar: CustomAppbar(title: context.tr('scanTheQrCode')),
      // appBar: PreferredSize(
      //   preferredSize: const Size(double.infinity, 55),
      //   child: CustomAppbar(title: context.tr('scan_code')),
      // ),
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

            // Scanner or scanned result
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 300,
                width: double.infinity,
                color: AppColors.lightGray,
                alignment: Alignment.center,
                child: _isScanning
                    ? MobileScanner(
                        key: Key(
                          'scanner_$_scannerVersion',
                        ), // Force new instance
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

            // Row(
            //   children: [
            //     const Expanded(
            //         child: Divider(height: 1, color: AppColors.lightGray)),
            //     Padding(
            //       padding: const EdgeInsets.symmetric(horizontal: 12),
            //       child: Text("or".tr(),
            //           style: const TextStyle(fontWeight: FontWeight.bold)),
            //     ),
            //     const Expanded(
            //         child: Divider(height: 1, color: AppColors.lightGray)),
            //   ],
            // ),

            // const SizedBox(height: 25),
            // Text("enter_driver_id".tr(),
            //     style: Theme.of(context)
            //         .textTheme
            //         .bodyMedium
            //         ?.copyWith(fontWeight: FontWeight.w600)),

            // const SizedBox(height: 20),
            // TextFormField(
            //   controller: driverIdController,
            //   style: TextStyle(color: AppColors.gray),
            //   decoration: InputDecoration(
            //     hintText: context.tr('driver_id_hint'),
            //     hintStyle: Theme.of(context)
            //         .textTheme
            //         .labelSmall!
            //         .copyWith(fontSize: 14, color: AppColors.grey600),
            //   ),
            //   textInputAction: TextInputAction.next,
            //   validator: qValidator([
            //     IsRequired(context.tr('required')),
            //   ]),
            //   keyboardType: TextInputType.name,
            // ),
            const SizedBox(height: 80),
            // CustomButtonWidget(
            //   text: context.tr("search"),
            //   onTap: () async {
            //     final input = driverIdController.text.trim();
            //     if (input.isNotEmpty) {
            //       // await  ref.read(scanQrCodeControllerProvider.notifier).searchByDriverID(context);
            //       _submitQrCode(input);
            //     }
            //   },
            //   backgroundColor: AppColors.black,
            //   isFiled: true,
            //   height: 52,
            //   radius: 12,
            //   width: MediaQuery.sizeOf(context).width,
            // ).onlyPadding(bottom: 20),
          ],
        ),
      ),
    );
  }
}
