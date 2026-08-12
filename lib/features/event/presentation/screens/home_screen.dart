import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kroot_app/features/auth/application/auth_service.dart';
import 'package:kroot_app/features/auth/presentation/controller/auth_controller.dart';
import 'package:kroot_app/features/cards/presentation/controller/cards_controller.dart';
import 'package:kroot_app/features/cards/presentation/screens/occasion_cards_screen.dart';
import 'package:kroot_app/features/cards/presentation/widgets/my_occasions_screen_occasion_grid.dart';
import 'package:kroot_app/features/event/data/models/get_user_events/get_user_events_model.dart';
import 'package:kroot_app/features/event/presentation/controller/home_controller.dart';
import 'package:kroot_app/src/routing/go_router_app.dart';
import 'package:kroot_app/src/routing/routes.dart';
import 'package:kroot_app/src/shared_widgets/app_error_widget.dart';
import 'package:kroot_app/src/shared_widgets/app_pagination_widget.dart';
import 'package:kroot_app/features/event/presentation/widgets/home_page/home_page_app_bar.dart';
import 'package:kroot_app/features/event/presentation/widgets/home_page/home_page_search_field.dart';
import 'package:kroot_app/gen/assets.gen.dart';
import 'package:kroot_app/src/shared_widgets/custom_button_widget.dart';
import 'package:kroot_app/src/shared_widgets/fade_circle_loading_indicator.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';
import 'package:kroot_app/src/utils/app_alert.dart';
import 'package:kroot_app/src/utils/download_image.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    Future(() {
      ref.read(homeControllerProvider);
      ref.read(cardsControllerProvider);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userData = ref.watch(userDataProvider);
    ref.listen(homeControllerProvider, (pre, next) {
      if (next.value?.isDeleteEvent == false ||
          pre?.value?.isDeleteEvent == false) {
        if (context.canPop()) context.pop();
      }
    });
    final eventsController = ref
        .watch(cardsControllerProvider.select((val) => val.value!.categories));

    final homeController = ref.watch(homeControllerProvider);
    // final eventsController = ref.watch(
    //   homeControllerProvider.select((val) => val.value!.eventResponse),
    // );

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: RefreshIndicator(
          onRefresh: () async {
            ref.read(cardsControllerProvider.notifier).getTemplateCategories();
            ref.read(homeControllerProvider.notifier).getUtils();
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.verticalSpace,
              HomePageAppBar(),
              32.verticalSpace,
              Expanded(
                child: CustomScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (userData?.freeSubscribe == 0)
                            HomePageAvailableBalance(),
                          20.verticalSpace,
                          if (eventsController.asData != null &&
                              homeController.error == null)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              spacing: 5,
                              children: [
                                Assets.icons.starForth.svg(
                                    width: 15,
                                    colorFilter: ColorFilter.mode(
                                        AppColors.primaryLight,
                                        BlendMode.srcIn)),
                                Text(
                                  context.tr('select_event_type'),
                                  style: AppTextStyle.rubikSemiBold18.copyWith(
                                    color: AppColors.primary,
                                  ),
                                ),
                                Assets.icons.starForth.svg(
                                    width: 15,
                                    colorFilter: ColorFilter.mode(
                                        AppColors.primaryLight,
                                        BlendMode.srcIn)),
                              ],
                            ),
                          12.verticalSpace,
                        ],
                      ),
                    ),
                    eventsController.when(
                      data: (data) {
                        if (data.isEmpty) {
                          return SliverFillRemaining(
                            hasScrollBody: false,
                            child: Center(child: Assets.icons.emptyIc.svg()),
                          );
                        }
                        // return SliverToBoxAdapter();
                        return MyOccasionsScreenOccasionsGrid(categories: data);

                        // return SliverList(
                        //   delegate: SliverChildBuilderDelegate((
                        //     context,
                        //     index,
                        //   ) {
                        //     final event = data.events![index];
                        //     return Padding(
                        //       padding: EdgeInsets.only(bottom: 12.h),
                        //       child: HomePageEventItem(event: event),
                        //     );
                        //   }, childCount: data.events!.length),
                        // );
                      },
                      loading: () => SliverFillRemaining(
                        hasScrollBody: false,
                        child: Padding(
                          padding: EdgeInsets.only(top: 80.h),
                          child: Center(child: MailPulseAnimation()),
                        ),
                      ),
                      error: (e, st) => SliverFillRemaining(
                        hasScrollBody: false,
                        child: AppErrorWidget(
                          onTap: () {
                            ref
                                .read(homeControllerProvider.notifier)
                                .getUtils();

                            ref
                                .read(cardsControllerProvider.notifier)
                                .getTemplateCategories();
                          },
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(child: 100.verticalSpace),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePageAvailableBalance extends ConsumerWidget {
  const HomePageAvailableBalance({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final utilsController = ref.watch(
      homeControllerProvider.select((val) => val.value!.utilsResponse),
    );
    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        switchInCurve: Curves.easeIn,
        switchOutCurve: Curves.easeOut,
        transitionBuilder: (child, anim) {
          return FadeTransition(opacity: anim, child: child);
        },
        child: utilsController?.whenOrNull(
          data: (data) {
            return Container(
              key: const ValueKey("balance-loaded"),
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 15.h),
              width: double.infinity,
              height: 95.h,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        context.tr('availableBalance'),
                        style: AppTextStyle.rubikMedium14.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                      Text(
                        '${data.subscriber?.remainingBalance} ${context.tr('card')}',
                        style: AppTextStyle.rubikRegular12.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  CustomButtonWidget(
                    content: Text(
                      context.tr('topUp'),
                      style: AppTextStyle.rubikMedium14.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                    backgroundColor: AppColors.white,
                    text: '',
                    radius: 32.r,
                    onTap: () => context.push(Routes.bundle),
                    isFiled: false,
                    height: 34.h,
                    width: 93.w,
                    topPading: 0,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class HomePageEventItem extends StatelessWidget {
  const HomePageEventItem({super.key, required this.event});

  final EventModel event;

  String? resolveImageUrl() {
    final imagePath = event.imageUrl;

    final baseUrl = dotenv.env['BASE_IMAGE'] ?? '';
    if (imagePath == null || imagePath.isEmpty) return null;
    if (imagePath.startsWith('http')) return imagePath;
    final base = baseUrl.endsWith('/') ? baseUrl : '$baseUrl/';
    final path = imagePath.startsWith('/') ? imagePath.substring(1) : imagePath;
    return '$base$path';
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        return GestureDetector(
          onTap: () {
            ref
                .read(goRouterProvider)
                .push(Routes.eventDetails, extra: {'id': event.occasionId});
          },
          child: Container(
            width: double.infinity,
            height: 161.h,
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: AppColors.grayField,
            ),
            child: Row(
              children: [
                Container(
                  width: 116.w,
                  height: 137.h,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 4),
                        blurRadius: 4,
                        spreadRadius: 0,
                        color: AppColors.black.withValues(alpha: .25),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: (event.imageUrl != null && resolveImageUrl() != null)
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: CachedNetworkImage(
                            fadeInCurve: Curves.linear,
                            placeholder: (context, url) =>
                                FadeCircleLoadingIndicator(),
                            imageUrl: resolveImageUrl()!,
                            fit: BoxFit.cover,
                          ),
                        )
                      : Icon(
                          Icons.card_giftcard_sharp,
                          color: AppColors.primary,
                        ),
                ),
                10.horizontalSpace,
                HomePageEventItemDetails(event: event),
              ],
            ),
          ),
        );
      },
    );
  }
}

class HomePageEventItemDetails extends StatelessWidget {
  const HomePageEventItemDetails({super.key, required this.event});
  final EventModel event;

  @override
  Widget build(BuildContext context) {
    final deviceLocale = Localizations.localeOf(context).toString();

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          4.verticalSpace,
          SizedBox(
            width: 148.w,
            child: Text(
              DateFormat(
                'EEE, dd MMM yyyy',
                deviceLocale,
              ).format(DateTime.parse(event.date!)),
              style: AppTextStyle.rubikRegular12.copyWith(
                color: AppColors.blackText,
              ),
            ),
          ),
          Spacer(),
          SizedBox(
            width: 160.w,
            child: Text(
              event.title ?? 'title',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.rubikRegular14.copyWith(
                color: AppColors.blackText,
              ),
            ),
          ),
          Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Assets.icons.locationIc.svg(),
              5.horizontalSpace,
              SizedBox(
                width: 123.w,
                child: Text(
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  event.locationName ?? 'location',
                  style: AppTextStyle.rubikRegular12.copyWith(
                    color: AppColors.blackText,
                  ),
                ),
              ),
            ],
          ),
          Spacer(),
          Row(
            children: [
              Expanded(
                child: CustomButtonWidget(
                  content: Text(
                    event.status?.tr() ?? 'status',
                    style: AppTextStyle.rubikRegular14.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  backgroundColor:
                      (event.status == 'Confirmed' || event.status == 'مؤكد')
                          ? AppColors.primary
                          : AppColors.gray,
                  text: '',
                  radius: 32.r,
                  onTap: () {},
                  isFiled: false,
                  height: 25.h,
                  width: 82.w,
                  topPading: 0,
                ),
              ),
              10.horizontalSpace,
              if (event.role == 'operator')
                CustomButtonWidget(
                  content: Text(
                    context.tr('operator'),
                    style: AppTextStyle.rubikRegular14.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                  backgroundColor: AppColors.redLight,
                  text: '',
                  radius: 32.r,
                  onTap: () {},
                  isFiled: false,
                  height: 25.h,
                  width: 70.w,
                  topPading: 0,
                ),
              if (event.role == 'handler_edit' || event.role == 'handler')
                Expanded(
                  child: CustomButtonWidget(
                    content: Text(
                      context.tr('authorized'),
                      style: AppTextStyle.rubikRegular14.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                    backgroundColor: AppColors.grayLight,
                    text: '',
                    radius: 32.r,
                    onTap: () {},
                    isFiled: false,
                    height: 25.h,
                    width: 84.w,
                    topPading: 0,
                  ),
                ),
              if (event.role == 'owner') Expanded(child: SizedBox()),
            ],
          ),
        ],
      ),
    );
  }
}
