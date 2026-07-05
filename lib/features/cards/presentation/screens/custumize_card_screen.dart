import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kroot_app/features/cards/domain/template_model/template_model.dart';
import 'package:kroot_app/features/cards/presentation/controller/cards_controller.dart';
import 'package:kroot_app/features/cards/presentation/widgets/customize_card/customize_card_screen_form.dart';
import 'package:kroot_app/features/cards/presentation/widgets/customize_card/customize_card_screen_price.dart';
import 'package:kroot_app/src/extenssions/int_extenssion.dart';
import 'package:kroot_app/src/extenssions/widget_extensions.dart';
import 'package:kroot_app/src/shared_widgets/app_error_widget.dart';
import 'package:kroot_app/src/shared_widgets/custom_appbar.dart';
import 'package:kroot_app/src/utils/app_alert.dart';

class CustumizeCardScreen extends StatelessWidget {
  const CustumizeCardScreen({super.key, required this.template});
  final InvitationTemplateModel template;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'customize_card'.tr()),
      body: _CustumizeCardScreenBody(template: template),
    );
  }
}

class _CustumizeCardScreenBody extends ConsumerStatefulWidget {
  const _CustumizeCardScreenBody({required this.template});
  final InvitationTemplateModel template;

  @override
  ConsumerState<_CustumizeCardScreenBody> createState() =>
      _CustumizeCardScreenBodyState();
}

class _CustumizeCardScreenBodyState
    extends ConsumerState<_CustumizeCardScreenBody> {
  @override
  void initState() {
    super.initState();
    Future(() {
      ref
          .read(cardsControllerProvider.notifier)
          .getFields(widget.template.name ?? '');
    });
  }

  @override
  Widget build(BuildContext context) {
    final baseUrl = dotenv.env['BASE_IMAGE'] ?? '';

    final fields = ref.watch(
        cardsControllerProvider.select((val) => val.value!.templateFields));

    return PopScope(
      onPopInvoked: (didPop) =>
          ref.read(cardsControllerProvider.notifier).clearFieldsValues(),
      child: fields.when(
          error: (error, st) => AppErrorWidget(onTap: () {
                ref
                    .read(cardsControllerProvider.notifier)
                    .getFields(widget.template.name ?? '');
              }),
          loading: () => Center(child: MailPulseAnimation()),
          data: (fields) => ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                children: [
                  //? Price card :
                  CustomizeCardScreenPrice(),
                  20.verticalSpace,

                  //? Card image :
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                        imageUrl: baseUrl + widget.template.sampleImage,
                        fit: BoxFit.cover),
                  ).symmetricPadding(horizontal: 40),
                  20.verticalSpace,

                  //? Details form :
                  CustomizeCardScreenForm(
                    fields: fields,
                  )
                ],
              )),
    );
  }
}
