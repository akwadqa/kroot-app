import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:kroot_app/features/scan/presentation/controller/scan_controller.dart';
import 'package:kroot_app/features/scan_qr_code/presentation/controller/scan_qr_code_controller.dart';
import 'package:kroot_app/features/scan_qr_code/presentation/screens/gates_screen.dart';
import 'package:kroot_app/features/scan_qr_code/presentation/screens/scan_qr_code_screen.dart';
import 'package:kroot_app/gen/assets.gen.dart';
import 'package:kroot_app/src/extenssions/widget_extensions.dart';
import 'package:kroot_app/src/routing/routes.dart';
import 'package:kroot_app/src/shared_widgets/custom_appbar.dart';
import 'package:kroot_app/src/shared_widgets/custom_button_widget.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';
import 'package:kroot_app/src/utils/app_alert.dart';
import 'package:kroot_app/src/utils/app_toast.dart';

class ScanQrEventPage extends ConsumerStatefulWidget {
  const ScanQrEventPage({super.key});

  @override
  ConsumerState<ScanQrEventPage> createState() => _ScanQrEventPageState();
}

class _ScanQrEventPageState extends ConsumerState<ScanQrEventPage> {
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
        AppToast.doneToast('Check-in successful');
      }
      if (next is AsyncError) {
        context.pop();
        AppToast.errorToast(next.error!.toString());
      }
    });
    return Scaffold(
      appBar: CustomAppbar(title: context.tr('scanTheQrCode')),
      body: Column(
        children: [
          50.verticalSpace,
          Text(
            context.tr('placeTheQRCodeInsideTheFrameToScanIt'),
            style: AppTextStyle.rubikRegular16.copyWith(
              color: AppColors.blackText,
            ),
          ).symmetricPadding(horizontal: 32.w),
          45.verticalSpace,
          // Assets.icons.scanQrIc.svg(),
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
          ).symmetricPadding(horizontal: 32.w),

          60.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.icons.scanQrFirstIc.svg(),
              21.horizontalSpace,
              Assets.icons.scanQrSecondIc.svg(),
              21.horizontalSpace,
              Assets.icons.scanQrThirdIc.svg(),
            ],
          ),
          58.verticalSpace,
          CustomButtonWidget(
            text: '',
            onTap: () {
              // context.push(Routes.scanCameraQR);
              // Navigator.of(context).push(
              //   MaterialPageRoute(builder: (context) => ScanQrCodeScreen()),
              // );
            },
            content: Text(
              context.tr('scanQrWithYourCamera'),
              style: AppTextStyle.rubikSemiBold16.copyWith(
                color: AppColors.white,
              ),
            ),
            isFiled: false,
            height: 44.h,
            width: double.infinity,
            backgroundColor: AppColors.primary,
          ).symmetricPadding(horizontal: 22.w),
        ],
      ),
    );
  }
}
