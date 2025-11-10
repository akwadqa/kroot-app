import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wedding_app/features/scan_qr_code/presentation/screens/scan_qr_code_screen.dart';
import 'package:wedding_app/gen/assets.gen.dart';
import 'package:wedding_app/src/extenssions/widget_extensions.dart';
import 'package:wedding_app/src/routing/routes.dart';
import 'package:wedding_app/src/shared_widgets/custom_appbar.dart';
import 'package:wedding_app/src/shared_widgets/custom_button_widget.dart';
import 'package:wedding_app/src/theme/app_colors.dart';
import 'package:wedding_app/src/theme/app_text_style.dart';

class ScanQrEventPage extends StatelessWidget {
  const ScanQrEventPage({super.key});

  @override
  Widget build(BuildContext context) {
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
          Assets.icons.scanQrIc.svg(),
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
              context.push(Routes.scanCameraQR);
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
