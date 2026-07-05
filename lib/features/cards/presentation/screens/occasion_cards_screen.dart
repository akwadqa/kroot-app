import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kroot_app/features/cards/domain/template_categories_model/template_categories_mode.dart';
import 'package:kroot_app/features/cards/domain/template_model/template_model.dart';
import 'package:kroot_app/features/cards/presentation/controller/cards_controller.dart';
import 'package:kroot_app/features/cards/presentation/widgets/occastion_cards/occasion_card_screen_filter.dart';
import 'package:kroot_app/features/event/data/models/utils_response/utils_response.dart';
import 'package:kroot_app/gen/assets.gen.dart';
import 'package:kroot_app/src/extenssions/widget_extensions.dart';
import 'package:kroot_app/src/routing/routes.dart';
import 'package:kroot_app/src/shared_widgets/app_error_widget.dart';
import 'package:kroot_app/src/shared_widgets/custom_appbar.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';
import 'package:kroot_app/src/utils/app_alert.dart';

class OccasionCardsScreen extends StatelessWidget {
  const OccasionCardsScreen({super.key, required this.category});
  final TemplateCategoriesModel category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbar(title: category.categoryName ?? ''),
        body: _OccasionCardsScreenBody(category: category));
  }
}

class _OccasionCardsScreenBody extends ConsumerStatefulWidget {
  const _OccasionCardsScreenBody({required this.category});

  final TemplateCategoriesModel category;

  @override
  ConsumerState<_OccasionCardsScreenBody> createState() =>
      _OccasionCardsScreenBodyState();
}

class _OccasionCardsScreenBodyState
    extends ConsumerState<_OccasionCardsScreenBody> {
  @override
  void initState() {
    super.initState();

    Future(() {
      ref
          .read(cardsControllerProvider.notifier)
          .getTemplates(widget.category.categoryName ?? '');
    });
  }

  @override
  Widget build(BuildContext context) {
    final templates = ref
        .watch(cardsControllerProvider.select((val) => val.value!.templates));
    return PopScope(
      onPopInvoked: (didPop) =>
          ref.read(cardsControllerProvider.notifier).cleanFilters(),
      child: Column(
        spacing: 22,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //? Filters :
          ...widget.category.filters.map((filter) => OccasionCardsScreenFilters(
                templateFilters: filter,
                categoryName: widget.category.categoryName ?? '',
              )),
          // OccasionCardsScreenFilters(),

          templates.when(
            data: (data) => _buildTempatesGrid(data),
            error: (error, st) => AppErrorWidget(onTap: () {
              ref
                  .read(cardsControllerProvider.notifier)
                  .getTemplateCategories();
            }),
            loading: () => Center(child: MailPulseAnimation()),
          )

          // _buildTempatesGrid(),
        ],
      ).symmetricPadding(horizontal: 18),
    );
  }

  Expanded _buildTempatesGrid(List<InvitationTemplateModel> templates) {
    final baseUrl = dotenv.env['BASE_IMAGE'] ?? '';

    return Expanded(
      child: GridView.builder(
        itemCount: templates.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 11,
            childAspectRatio: 1 / 1.6),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            context.push(Routes.customizeCard , extra: templates[index]);
          },
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              // child: Assets.images.occasionCardImage.image(fit: BoxFit.cover)),
              child: CachedNetworkImage(
                  imageUrl: baseUrl + templates[index].sampleImage,
                  fit: BoxFit.cover)),
        ),
      ),
    );
  }
}
