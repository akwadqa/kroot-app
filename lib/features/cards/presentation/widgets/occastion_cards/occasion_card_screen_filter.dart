import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kroot_app/features/cards/domain/template_categories_model/template_categories_mode.dart';
import 'package:kroot_app/features/cards/presentation/controller/cards_controller.dart';
import 'package:kroot_app/src/extenssions/widget_extensions.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';

class OccasionCardsScreenFilters extends ConsumerWidget {
  final Filter templateFilters;
  final String categoryName;
  final String name;
  const OccasionCardsScreenFilters({
    super.key,
    required this.templateFilters,
    required this.categoryName,
    required this.name,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> filters = [
      'All',
      ...templateFilters.options.map((e) => e.optionValue ?? '')
    ];

    final selectedFilter = ref.watch(cardsControllerProvider.select((val) => val
        .value!.selectedOptions
        .firstWhere((option) => option.containsKey(templateFilters.filterLabel),
            orElse: () => {templateFilters.filterLabel: 'All'})
        .values
        .first));
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 18),
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 15,
        children: filters
            .map((filter) => GestureDetector(
                  onTap: () {
                    ref.read(cardsControllerProvider.notifier)
                      ..selectOptionFromFilter(
                          filterName: templateFilters.filterLabel,
                          optionName: filter)
                      ..getTemplates(name);
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
      ).symmetricPadding(vertical: 5, horizontal: 2),
    );
  }
}
