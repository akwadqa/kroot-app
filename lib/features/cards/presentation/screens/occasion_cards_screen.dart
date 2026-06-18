import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kroot_app/features/cards/presentation/controller/cards_controller.dart';
import 'package:kroot_app/gen/assets.gen.dart';
import 'package:kroot_app/src/extenssions/widget_extensions.dart';
import 'package:kroot_app/src/routing/routes.dart';
import 'package:kroot_app/src/shared_widgets/custom_appbar.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';

class OccasionCardsScreen extends StatelessWidget {
  const OccasionCardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbar(title: 'Graduation'),
        body: _OccasionCardsScreenBody());
  }
}

class _OccasionCardsScreenBody extends ConsumerWidget {
  const _OccasionCardsScreenBody();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      spacing: 22,
      children: [
        //? Filters :
        OccasionCardsScreenFilters(),

        Expanded(
          child: GridView.builder(
            itemCount: 10,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 11,
                childAspectRatio: 1 / 1.6),
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                context.push(Routes.customizeCard);
              },
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child:
                      Assets.images.occasionCardImage.image(fit: BoxFit.cover)),
            ),
          ),
        ),
      ],
    ).symmetricPadding(horizontal: 18);
  }
}

class OccasionCardsScreenFilters extends ConsumerWidget {
  const OccasionCardsScreenFilters({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> filters = ['All', 'Boys', 'Girls'];

    final selectedFilter = ref.watch(
        cardsControllerProvider.select((val) => val.value!.selectedFiltre));
    return Row(
      spacing: 15,
      children: filters
          .map((filter) => GestureDetector(
                onTap: () {
                  ref
                      .read(cardsControllerProvider.notifier)
                      .changeFilterType(filter);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 6),
                  decoration: BoxDecoration(
                    color: filter == selectedFilter
                        ? AppColors.primary
                        : AppColors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withValues(alpha: 0.25),
                        blurRadius: 4,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  child: Text(
                    filter,
                    style: AppTextStyle.rubikRegular16.copyWith(
                        color: filter == selectedFilter
                            ? AppColors.white
                            : AppColors.black),
                  ),
                ),
              ))
          .toList(),
    );
  }
}
