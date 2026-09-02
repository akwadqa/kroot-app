import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kroot_app/features/cards/domain/confirm_card_preview_response/confirm_preview_card_response.dart';
import 'package:kroot_app/features/cards/domain/template_categories_model/template_categories_mode.dart';
import 'package:kroot_app/features/cards/presentation/controller/cards_controller.dart';
import 'package:kroot_app/features/cards/presentation/widgets/my_occasions_screen_card_item.dart';
import 'package:kroot_app/features/cards/presentation/widgets/my_occasions_screen_occasion_grid.dart';
import 'package:kroot_app/features/event/data/models/get_user_events/get_user_events_model.dart';
import 'package:kroot_app/features/event/presentation/controller/home_controller.dart';
import 'package:kroot_app/features/event/presentation/screens/home_screen.dart';
import 'package:kroot_app/features/event/presentation/widgets/home_page/home_page_search_field.dart';
import 'package:kroot_app/gen/assets.gen.dart';
import 'package:kroot_app/src/extenssions/int_extenssion.dart';
import 'package:kroot_app/src/extenssions/widget_extensions.dart';
import 'package:kroot_app/src/shared_widgets/app_error_widget.dart';
import 'package:kroot_app/src/shared_widgets/app_pagination_widget.dart';
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
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    final isCards =
        ref.watch(cardsControllerProvider.select((val) => val.value!.isCards));

    final categriesFilter = ref.watch(
        homeControllerProvider.select((val) => val.value!.categoriesFilter));

    final filters = ['All', ...categriesFilter];
    final selectedFilter = ref
        .watch(cardsControllerProvider.select((val) => val.value!.filerValue));

    final controller = ref.watch(homeControllerProvider
        .select((val) => val.value!.eventResponse ?? AsyncLoading()));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HomePageSearchField(
          hint: context.tr('findEventHere'),
          onChange: (val) {
            ref
                .read(homeControllerProvider.notifier)
                .getUserEvents(page: 1, search: val);
          },
        ),
        20.verticalSpace,
        MyOccasionsScreenCardsEventsFilter(),
        20.verticalSpace,
        Expanded(
          child: AppPaginationWidget(
            enablePullDown: true,
            onRefresh: () {
              return ref.read(homeControllerProvider.notifier).refreshEvents();
            },
            key: ValueKey<String>(selectedFilter),
            onLoading: (page) =>
                ref.read(homeControllerProvider.notifier).onLoadMoreEvents(),
            child: ListView(
              shrinkWrap: true,
              children: [
                if (categriesFilter.isNotEmpty && isCards)
                  MyOccasionsScreenCategoriesFilter(
                      filters: filters, selectedFilter: selectedFilter),
                20.verticalSpace,
                controller.when(
                    data: (data) {
                      final currentList = isCards ? data.kroot : data.events;

                      if (currentList == null || currentList.isEmpty) {
                        return MyOccasionsScreenEmptyData(ref: ref);
                      }
                      

                      return MyOccasionsScreenList(currentList: currentList);
                    },
                    error: (error, st) => AppErrorWidget(onTap: () {
                          ref
                              .read(homeControllerProvider.notifier)
                              .getUserEvents(page: 1);
                        }),
                    loading: () => Center(child: MailPulseAnimation())),
                // 100.verticalSpace,
              ],
            ),
          ),
        )
      ],
    ).symmetricPadding(
      horizontal: 20,
      vertical: 10,
    );
  }
}

class MyOccasionsScreenList extends ConsumerWidget {
  const MyOccasionsScreenList({
    super.key,
    required this.currentList,
  });

  final List<Object>? currentList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isCards =
        ref.watch(cardsControllerProvider.select((val) => val.value!.isCards));

    return Column(
      spacing: 20,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //? Title :
        Text(
          isCards ? 'my_cards'.tr() : 'allEvents'.tr(),
          style: AppTextStyle.rubikMedium18.copyWith(color: AppColors.primary),
        ),

        ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: currentList!.length,
            separatorBuilder: (context, index) => 20.verticalSpace,
            itemBuilder: (context, index) {
              if (isCards) {
                final card = currentList![index] as ConfirmPreviewCardResponse;

                return MyOccasionsScreenCardItem(
                  card: card,
                );
              }
              final event = currentList![index] as EventModel;
              return HomePageEventItem(event: event);
            }),
      ],
    );
  }
}

class MyOccasionsScreenCategoriesFilter extends ConsumerWidget {
  const MyOccasionsScreenCategoriesFilter({
    super.key,
    required this.filters,
    required this.selectedFilter,
  });

  final List<String> filters;
  final String selectedFilter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        // spacing: 7,
        // runSpacing: 7,
        // alignment: WrapAlignment.start,
        // crossAxisAlignment: WrapCrossAlignment.start,
        children: filters
            .map<Widget>((filter) => GestureDetector(
                  onTap: () {
                    ref
                        .read(cardsControllerProvider.notifier)
                        .changeFilterValue(filter);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    padding: EdgeInsets.symmetric(horizontal: 21, vertical: 6),
                    decoration: BoxDecoration(
                      color: filter == selectedFilter
                          ? AppColors.primary
                          : AppColors.white,
                      border: Border.all(color: AppColors.primary),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Text(filter,
                        style: AppTextStyle.rubikRegular14.copyWith(
                            color: filter == selectedFilter
                                ? AppColors.white
                                : AppColors.black)),
                  ),
                ))
            .toList(),
      ),
    );
  }
}

class MyOccasionsScreenEmptyData extends StatelessWidget {
  const MyOccasionsScreenEmptyData({
    super.key,
    required this.ref,
  });

  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () =>
          ref.read(homeControllerProvider.notifier).getUserEvents(page: 1),
      child: ListView(
        shrinkWrap: true,
        children: [
          Center(child: Assets.icons.emptyIc.svg()),
          100.verticalSpace,
        ],
      ),
    );
  }
}

class MyOccasionsScreenCardsEventsFilter extends ConsumerWidget {
  const MyOccasionsScreenCardsEventsFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isCards =
        ref.watch(cardsControllerProvider.select((val) => val.value!.isCards));
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: AppColors.grayField,
        borderRadius: BorderRadius.circular(60),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                ref.read(cardsControllerProvider.notifier)
                  ..setIsCards(false)
                  ..changeFilterValue('All');
                ref.read(homeControllerProvider.notifier)
                  ..makeCategoriesEmpty()
                  ..getUserEvents(page: 1);
              },
              child: Container(
                alignment: Alignment.center,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: isCards ? null : AppColors.primary,
                  borderRadius: BorderRadius.circular(60),
                ),
                child: Text(
                  'invitations'.tr(),
                  style: AppTextStyle.rubikSemiBold16.copyWith(
                      color: isCards ? AppColors.primary : AppColors.white),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                ref.read(cardsControllerProvider.notifier)
                  ..setIsCards(true)
                  ..changeFilterValue('All');
                ref.read(homeControllerProvider.notifier)
                  ..makeCategoriesEmpty()
                  ..getUserEvents(page: 1);
              },
              child: Container(
                alignment: Alignment.center,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: isCards ? AppColors.primary : null,
                  borderRadius: BorderRadius.circular(60),
                ),
                child: Text(
                  'appTitle'.tr(),
                  style: AppTextStyle.rubikSemiBold16.copyWith(
                      color: isCards ? AppColors.white : AppColors.primary),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
