import 'dart:convert';
import 'dart:typed_data';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kroot_app/features/cards/presentation/controller/cards_controller.dart';
import 'package:kroot_app/features/cards/presentation/widgets/generating_card_loader.dart';
import 'package:kroot_app/gen/assets.gen.dart';
import 'package:kroot_app/src/extenssions/int_extenssion.dart';
import 'package:kroot_app/src/extenssions/widget_extensions.dart';
import 'package:kroot_app/src/routing/routes.dart';
import 'package:kroot_app/src/shared_widgets/app_dialogs.dart';
import 'package:kroot_app/src/shared_widgets/app_error_widget.dart';
import 'package:kroot_app/src/shared_widgets/custom_appbar.dart';
import 'package:kroot_app/src/shared_widgets/custom_button_widget.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';
import 'package:kroot_app/src/utils/app_alert.dart';
import 'package:kroot_app/src/utils/app_toast.dart';

class FinalPreviewScreen extends StatelessWidget {
  const FinalPreviewScreen({super.key, required this.templateName});
  final String templateName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'final_preview'.tr()),
      body: _FinalPreviewScreenContent(templateName: templateName),
    );
  }
}

class _FinalPreviewScreenContent extends ConsumerStatefulWidget {
  const _FinalPreviewScreenContent({super.key, required this.templateName});
  final String templateName;

  @override
  ConsumerState<_FinalPreviewScreenContent> createState() =>
      _FinalPreviewScreenContentState();
}

class _FinalPreviewScreenContentState
    extends ConsumerState<_FinalPreviewScreenContent> {
  @override
  void initState() {
    Future(() {
      ref
          .read(cardsControllerProvider.notifier)
          .previewCard(widget.templateName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
        cardsControllerProvider.select(
            (val) => val.value!.confirmPreviewCardResponse), (prev, next) {
      if (next is AsyncLoading) {
        AppAlert.showLoadingDialog(context);
      }
      if (next is AsyncData) {
        context.pop();
        AppToast.doneToast('successfullyCompleted'.tr());
        context.push(Routes.cardPreview, extra: next!.value);
      }
      if (next is AsyncError) {
        if (next!.error.toString().contains('balance')) {
          context.pop();
          AppAlert.showGlobalDialog(
            context: context,
            isLogout: true,
            title: context.tr('balance_title'),
            text: Text(
              context.tr('balance_error'),
              style: AppTextStyle.rubikRegular14.copyWith(
                color: AppColors.primary,
              ),
            ),
            onSubmit: () {
              context.pop();
              context.push(Routes.bundle);
            },
          );
          return;
        } else {
          context.pop();
          AppToast.errorToast(next!.error.toString());
        }
      }
    });
    final controller = ref.watch(
        cardsControllerProvider.select((val) => val.value!.previewCardUrl));
    return controller.when(
      data: (url) {
        return _buildBody(url);
      },
      error: (error, st) => AppErrorWidget(onTap: () {
        ref
            .read(cardsControllerProvider.notifier)
            .previewCard(widget.templateName);
      }),
      loading: () => GeneratingCardLoader(),
    );
    // return _buildBody();
  }

  Padding _buildBody(String url) {
    if (url.contains(',')) {
      url = url.split(',').last;
    }
    Uint8List bytes = base64Decode(url);
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          children: [
            20.verticalSpace,
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.memory(
                bytes,
                height: 500,
              ),
            ).symmetricPadding(horizontal: 17),
            47.verticalSpace,

            //? Confirm :
            CustomButtonWidget(
                text: 'pay_now',
                backgroundColor: AppColors.primary,
                color: AppColors.white,
                onTap: () => ref
                    .read(cardsControllerProvider.notifier)
                    .confirmPreviewCard(widget.templateName),
                isFiled: true,
                height: 50,
                width: double.infinity)
          ],
        ));
  }
}
