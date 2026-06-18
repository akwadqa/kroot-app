import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kroot_app/features/auth/presentation/widgets/create_account_page/create_account_field.dart';
import 'package:kroot_app/features/cards/presentation/widgets/customize_card/customize_card_screen_form.dart';
import 'package:kroot_app/features/cards/presentation/widgets/customize_card/customize_card_screen_price.dart';
import 'package:kroot_app/features/event/presentation/widgets/create_event_page/create_event_page_select_language_field.dart';
import 'package:kroot_app/features/event/presentation/widgets/create_event_page/event_details_date.dart';
import 'package:kroot_app/features/event/presentation/widgets/create_event_page/event_details_time.dart';
import 'package:kroot_app/gen/assets.gen.dart';
import 'package:kroot_app/src/extenssions/int_extenssion.dart';
import 'package:kroot_app/src/extenssions/widget_extensions.dart';
import 'package:kroot_app/src/shared_widgets/custom_appbar.dart';
import 'package:kroot_app/src/shared_widgets/custom_button_widget.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';

class CustumizeCardScreen extends StatelessWidget {
  const CustumizeCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'customize_card'.tr()),
      body: const _CustumizeCardScreenBody(),
    );
  }
}

class _CustumizeCardScreenBody extends StatelessWidget {
  const _CustumizeCardScreenBody();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
        children: [
          //? Price card :
          CustomizeCardScreenPrice(),
          20.verticalSpace,

          //? Card image :
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Assets.images.occasionCardImage.image(),
          ).symmetricPadding(horizontal: 40),
          20.verticalSpace,

          //? Details form :
          CustomizeCardScreenForm()
        ],
      ),
    );
  }
}
