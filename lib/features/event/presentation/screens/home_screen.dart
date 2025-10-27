import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wedding_app/features/event/data/models/events_response/event_response.dart';
import 'package:wedding_app/features/event/presentation/controller/home_controller.dart';
import 'package:wedding_app/src/shared_widgets/app_pagination_widget.dart';
import 'package:wedding_app/src/shared_widgets/bottom_navigation_bar_view.dart';
import 'package:wedding_app/features/auth/application/auth_service.dart';
import 'package:wedding_app/features/event/presentation/widgets/home_page/home_page_app_bar.dart';
import 'package:wedding_app/features/event/presentation/widgets/home_page/home_page_search_field.dart';
import 'package:wedding_app/gen/assets.gen.dart';
import 'package:wedding_app/src/shared_widgets/custom_appbar.dart';
import 'package:wedding_app/src/shared_widgets/custom_button_widget.dart';
import 'package:wedding_app/src/theme/app_colors.dart';
import 'package:wedding_app/src/theme/app_text_style.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future(() {
      ref.read(homeControllerProvider.notifier).getUserEvents(page: 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(homeControllerProvider);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBarView(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            44.verticalSpace,

            //? App bar :
            HomePageAppBar(),
            12.verticalSpace,

            //? Search field :
            HomePageSearchField(hint: context.tr('findEventHere')),
            20.verticalSpace,

            //? Title :
            Text(
              context.tr('allEvents'),
              style: AppTextStyle.rubikSemiBold18.copyWith(
                color: AppColors.primary,
              ),
            ),
            12.verticalSpace,
            controller.when(
              data: (data) {
                if (data.eventResponse?.events.isEmpty ?? true) {
                  return Center(child: Text('Empty events'));
                }
                return Expanded(
                  child: AppPaginationWidget(
                    onLoading: (page) {
                      return ref
                          .read(homeControllerProvider.notifier)
                          .onLoadMoreEvents();
                    },
                    child: ListView.separated(
                      padding: EdgeInsets.zero,
                      separatorBuilder: (context, index) => 12.verticalSpace,
                      itemCount: data.eventResponse?.events.length ?? 0,
                      itemBuilder: (context, index) => HomePageEventItem(
                        event: data.eventResponse!.events[index],
                      ),
                    ),
                  ),
                );
              },
              error: (e, st) {
                return Center(
                  child: Text(
                    e.toString(),
                    style: AppTextStyle.rubikRegular16.copyWith(
                      color: AppColors.black,
                    ),
                  ),
                );
              },
              loading: () => Center(child: CircularProgressIndicator()),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePageEventItem extends StatelessWidget {
  const HomePageEventItem({super.key, required this.event});

  final Event event;

  String? resolveImageUrl() {
    final imagePath = event.imagePath;
    final baseUrl = 'https://kroot.akwad.qa/';
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
            final token = ref.read(userDataProvider);
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
                //? Image section :
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
                    image: resolveImageUrl() == null
                        ? DecorationImage(
                            image: Assets.images.weddingImage.provider(),
                            fit: BoxFit.cover,
                          )
                        : null,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: event.imagePath != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: CachedNetworkImage(
                            imageUrl: resolveImageUrl()!,
                            fit: BoxFit.cover,
                          ),
                        )
                      : null,
                ),
                10.horizontalSpace,
                //? Details :
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
  final Event event;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        4.verticalSpace,

        //? Date :
        SizedBox(
          width: 148.w,
          child: Text(
            // 'Wed, 1-10-2025 08:00PM',
            DateFormat('EEE, d-M-yyyy hh:mma').format(event.date),
            style: AppTextStyle.rubikRegular12.copyWith(
              color: AppColors.blackText,
            ),
          ),
        ),
        // Text(
        //   // 'Wed, 1-10-2025 08:00PM',
        //   DateFormat('EEE, d-M-yyyy hh:mma').format(event.date),
        //   style: AppTextStyle.rubikRegular12.copyWith(
        //     color: AppColors.blackText,
        //   ),
        // ),
        Spacer(),

        //? Type :
        Text(
          // 'Wedding',
          event.type,
          style: AppTextStyle.rubikSemiBold16.copyWith(
            color: AppColors.primary,
          ),
        ),
        Spacer(),

        //? Title :
        if (event.type == 'Wedding')
          Row(
            children: [
              Text(
                'Mohammed',
                style: AppTextStyle.rubikRegular14.copyWith(
                  color: AppColors.blackText,
                ),
              ),
              3.horizontalSpace,
              Assets.images.ringsImage.image(width: 28.w),
              3.horizontalSpace,
              Text(
                'Nour',
                style: AppTextStyle.rubikRegular14.copyWith(
                  color: AppColors.blackText,
                ),
              ),
            ],
          ),

        if (event.type == 'Birthday')
          Text(
            event.title,
            style: AppTextStyle.rubikRegular14.copyWith(
              color: AppColors.blackText,
            ),
          ),

        Spacer(),

        //? Location :
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Assets.icons.locationIc.svg(),
            5.horizontalSpace,
            SizedBox(
              width: 123.w,
              child: Text(
                softWrap: true,
                overflow: TextOverflow.visible,
                // 'Riffa Halls Hall No. 15',
                event.locationName,
                style: AppTextStyle.rubikRegular12.copyWith(
                  color: AppColors.blackText,
                ),
              ),
            ),
          ],
        ),
        Spacer(),
        CustomButtonWidget(
          content: Text(
            // 'Confirmed',
            event.status,
            style: AppTextStyle.rubikRegular14.copyWith(color: AppColors.white),
          ),
          backgroundColor: event.status == 'Confirmed'
              ? AppColors.primary
              : AppColors.gray,
          text: '',
          radius: 32.r,
          onTap: () {},
          isFiled: false,
          height: 25.h,
          width: 83.w,
          topPading: 0,
        ),
      ],
    );
  }
}
