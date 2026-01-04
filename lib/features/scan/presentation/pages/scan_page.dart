import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kroot_app/features/event/data/models/get_user_events/get_user_events_model.dart';
import 'package:kroot_app/features/scan/presentation/controller/scan_controller.dart';
import 'package:kroot_app/gen/assets.gen.dart';
import 'package:kroot_app/src/routing/routes.dart';
import 'package:kroot_app/src/shared_widgets/app_error_widget.dart';
import 'package:kroot_app/src/shared_widgets/app_pagination_widget.dart';
import 'package:kroot_app/src/shared_widgets/custom_appbar.dart';
import 'package:kroot_app/src/shared_widgets/custom_button_widget.dart';
import 'package:kroot_app/src/shared_widgets/fade_circle_loading_indicator.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';
import 'package:kroot_app/src/utils/app_alert.dart';

class ScanPage extends ConsumerStatefulWidget {
  const ScanPage({super.key});

  @override
  ConsumerState<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends ConsumerState<ScanPage> {
  @override
  void initState() {
    super.initState();

    Future(() {
      ref.read(scanControllerProvider.notifier).getUserScanEvent(page: 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(scanControllerProvider);
    return Scaffold(
      appBar: CustomAppbar(title: context.tr('scan'), withBackButton: false),

      // body: _buildBody(),
      body: controller.when(
        data: (data) {
          if (data.userScanEventResponse?.events.isEmpty ?? false) {
            return Center(child: Assets.icons.emptyIc.svg());
          }
          return _buildBody(data.userScanEventResponse?.events ?? []);
        },
        error: (e, st) {
          return AppErrorWidget(
            onTap: () {
              ref
                  .read(scanControllerProvider.notifier)
                  .getUserScanEvent(page: 1);
            },
          );
        },
        loading: () {
          // return Center(child: Assets.images.animationLoading.image());
          return Center(child: MailPulseAnimation());
        },
      ),
    );
  }

  Widget _buildBody(List<EventModel> events) {
    debugPrint(events.length.toString()??"kod");
    return AppPaginationWidget(
      enablePullDown: true,
      onRefresh: () =>
          ref.read(scanControllerProvider.notifier).refreshEvents(),
      onLoading: (_) =>
          ref.read(scanControllerProvider.notifier).onLoadMoreEvents(),
      child: ListView.separated(
        separatorBuilder: (context, index) => 20.verticalSpace,
        padding: EdgeInsets.fromLTRB(22.w, 25.h, 22.w, 75.h),
        itemBuilder: (context, index) => ScanScreenItem(event: events[index]),
        itemCount: events.length,
      ),
    );
  }
}

class ScanScreenItem extends StatelessWidget {
  const ScanScreenItem({super.key, required this.event});
  final EventModel event;

  String? resolveImageUrl() {
    final imagePath = event.imageUrl;
    final baseUrl = 'https://kroot.akwad.qa/';
    if (imagePath == null || imagePath.isEmpty) return null;
    if (imagePath.startsWith('http')) return imagePath;
    final base = baseUrl.endsWith('/') ? baseUrl : '$baseUrl/';
    final path = imagePath.startsWith('/') ? imagePath.substring(1) : imagePath;
    return '$base$path';
  }

  @override
  Widget build(BuildContext context) {
    final deviceLocale = Localizations.localeOf(context).toString();
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.r),

      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: AppColors.grayField,
          boxShadow: [
            BoxShadow(
              offset: Offset(4, 4),
              blurRadius: 4,
              color: AppColors.black.withValues(alpha: .25),
            ),
          ],
        ),
        width: double.infinity,
        child: Column(
          children: [
            Column(
              children: [
                (event.imageUrl != null && resolveImageUrl() != null)
                    // ? Assets.images.weddingImage.image(
                    //     height: 129.h,
                    //     width: double.infinity,
                    //     fit: BoxFit.cover,
                    //   )
                    ? CachedNetworkImage(
                        fadeInCurve: Curves.linear,
                        placeholder: (context, url) =>
                            FadeCircleLoadingIndicator(),
                        imageUrl: resolveImageUrl()!,
                        height: 129.h,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      )
                    : SizedBox(
                        width: double.infinity,
                        height: 129.h,
                        child: Icon(
                          Icons.card_giftcard_sharp,
                          color: AppColors.primary,
                        ),
                      ),
                10.verticalSpace,
                Row(
                  children: [
                    19.horizontalSpace,
                    Text(
                      // 'Wedding',
                      // TODO
                      // "Wedding",
                      event.title ?? '',
                      style: AppTextStyle.rubikMedium14.copyWith(
                        color: AppColors.primary,
                      ),
                    ),

                    Spacer(),
                    // Text(
                    //   // 'Wed, 1-10-2025 08:00PM',
                    //   // DateFormat('EEE, d-M-yyyy hh:mma').format(DateTime.now()),
                    //   DateFormat(
                    //     'EEE, d-M-yyyy hh:mma',
                    //   ).format(DateTime.parse(event.date ?? '')),
                    //   style: AppTextStyle.rubikRegular12.copyWith(
                    //     color: AppColors.blackText,
                    //   ),
                    // ),
                    // 19.horizontalSpace,
                  ],
                ),
                15.verticalSpace,
                Row(
                  children: [
                    19.horizontalSpace,
                    //? Operator tag :
                    if (event.role == 'operator')
                      CustomButtonWidget(
                        content: Text(
                          // 'Handler',
                          context.tr('operator'),
                          // event.status ?? 'status',
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

                    //? This for handler
                    if (event.role == 'handler')
                      CustomButtonWidget(
                        content: Text(
                          // 'Handler',
                                            context.tr('authorized'),

                          // event.status ?? 'status',
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
                    // Text(
                    //   // 'Wedding',
                    //   // TODO
                    //   // "Wedding",
                    //   event.type ?? '',
                    //   style: AppTextStyle.rubikSemiBold16.copyWith(
                    //     color: AppColors.primary,
                    //   ),
                    // ),
                    Spacer(),
                    Text(
                      // 'Wed, 1-10-2025 08:00PM',
                      // DateFormat('EEE, d-M-yyyy hh:mma').format(DateTime.now()),
                      DateFormat(
                        'EEEE dd MMMM yyyy',
                        deviceLocale,
                      ).format(DateTime.parse(event.date ?? '')),
                      style: AppTextStyle.rubikRegular12.copyWith(
                        color: AppColors.blackText,
                      ),
                    ),
                    19.horizontalSpace,
                  ],
                ),
                15.verticalSpace,
                CustomButtonWidget(
                  text: '',
                  onTap: () {
                    context.push(Routes.scanQr , extra: event.occasionId);
                  },
                  content: Text(
                    context.tr('scan'),
                    style: AppTextStyle.rubikMedium14.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  isFiled: false,
                  height: 44.h,
                  width: 294.w,
                  backgroundColor: AppColors.primary,
                ),
                12.verticalSpace,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
