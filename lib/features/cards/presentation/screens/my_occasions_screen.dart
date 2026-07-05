import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kroot_app/features/cards/domain/template_categories_model/template_categories_mode.dart';
import 'package:kroot_app/features/cards/presentation/controller/cards_controller.dart';
import 'package:kroot_app/features/cards/presentation/widgets/my_occasions_screen_occasion_grid.dart';
import 'package:kroot_app/src/extenssions/widget_extensions.dart';
import 'package:kroot_app/src/shared_widgets/app_error_widget.dart';
import 'package:kroot_app/src/shared_widgets/custom_appbar.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';
import 'package:kroot_app/src/utils/app_alert.dart';

class MyOccasionsScreen extends StatelessWidget {
  const MyOccasionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbar(
          title: context.tr('my_occasions'),
          withBackButton: false,
        ),
        body: const _MyOccasionsScreenBody());
  }
}

class _MyOccasionsScreenBody extends ConsumerStatefulWidget {
  const _MyOccasionsScreenBody();

  @override
  ConsumerState<_MyOccasionsScreenBody> createState() =>
      _MyOccasionsScreenBodyState();
}

class _MyOccasionsScreenBodyState
    extends ConsumerState<_MyOccasionsScreenBody> {
  @override
  void initState() {
    Future(() async {
      await ref.read(cardsControllerProvider.notifier).getTemplateCategories();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref
        .watch(cardsControllerProvider.select((val) => val.value!.categories));

    return controller.when(
      data: (data) => _buildBody(data),
      error: (error, st) => AppErrorWidget(onTap: () {
        ref.read(cardsControllerProvider.notifier).getTemplateCategories();
      }),
      loading: () => Center(child: MailPulseAnimation()),
    );
  }

  Widget _buildBody(List<TemplateCategoriesModel> categories) {
    return Column(
      spacing: 20,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //? Title :
        Text(
          'select_event_type'.tr(),
          style: AppTextStyle.rubikMedium18.copyWith(color: AppColors.primary),
        ),

        //? Grid :
        MyOccasionsScreenOccasionsGrid(categories: categories),
      ],
    ).symmetricPadding(
      horizontal: 20,
      vertical: 10,
    );
  }
}
