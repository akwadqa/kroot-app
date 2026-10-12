import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kroot_app/features/event/data/models/get_user_events/get_user_events_model.dart';
import 'package:kroot_app/features/event/presentation/controller/home_controller.dart';
import 'package:kroot_app/features/event/presentation/widgets/event_details_page/event_details_page_body.dart';
import 'package:kroot_app/features/event/presentation/widgets/event_details_page/event_details_page_sliver_app_bar.dart';
import 'package:kroot_app/src/routing/routes.dart';
import 'package:kroot_app/src/shared_widgets/app_error_widget.dart';
import 'package:kroot_app/src/utils/app_alert.dart';
import 'package:kroot_app/src/utils/app_toast.dart';
import 'package:kroot_app/src/utils/resolve_image_url.dart';

class EventDetailsScreen extends ConsumerStatefulWidget {
  const EventDetailsScreen({
    super.key,
    required this.eventModel,
    required this.id,
  });
  final String? id;
  final EventModel? eventModel;

  @override
  ConsumerState<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends ConsumerState<EventDetailsScreen> {
  // متغيرات لحفظ أبعاد الصورة وحالتها
  double? _calculatedHeight;
  String? _lastImageUrl;

  @override
  void initState() {
    super.initState();
    Future(() {
      if (widget.eventModel == null) {
        ref.read(homeControllerProvider.notifier).getEventDetails(widget.id!);
      }
    });
  }

  // دالة حساب أبعاد الصورة في الخلفية
  void _calculateImageHeight(String url) {
    final ImageStream stream =
        CachedNetworkImageProvider(url).resolve(const ImageConfiguration());

    stream.addListener(
      ImageStreamListener((ImageInfo info, bool _) {
        final double width = info.image.width.toDouble();
        final double height = info.image.height.toDouble();
        final double aspectRatio = width / height;

        if (mounted) {
          setState(() {
            // حساب الطول المناسب لعرض الشاشة الحالي
            _calculatedHeight = MediaQuery.sizeOf(context).width / aspectRatio;
          });
        }
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final image = ref.watch(
      homeControllerProvider.select(
        (val) => val.value?.occasionModel?.value?.imageUrl,
      ),
    );
    final controller = ref.watch(
      homeControllerProvider.select((val) => val.value!.occasionModel),
    );

    // --- منطق تحديث أبعاد الصورة عند جلبها ---
    final resolvedUrl = resolveImageUrl(image);
    if (resolvedUrl != null && resolvedUrl != _lastImageUrl) {
      _lastImageUrl = resolvedUrl;
      _calculateImageHeight(resolvedUrl);
    }
    // -----------------------------------------

    ref.listen(homeControllerProvider.select((val) => val.value!.retryFailue), (
      prev,
      next,
    ) {
      if (next is AsyncLoading) {
        AppAlert.showLoadingDialog(context);
      }
      if (next is AsyncError) {
        context.pop();
        AppToast.errorToast(next!.error.toString());
      }
      if (next is AsyncData) {
        context.pop();
        AppToast.doneToast('successfullyCompleted'.tr());
        context.go(Routes.eventDetails, extra: {'id': widget.id});
      }
    });

    ref.listen(homeControllerProvider, (pre, next) {
      if (next.value?.isDeleteEvent != null) {
        if (next is AsyncLoading) {
          Future.delayed(Duration(milliseconds: 300), () {
            AppAlert.showLoadingDialog(
              Navigator.of(context, rootNavigator: true).context,
            );
          });
        }

        if (next is AsyncData && pre is AsyncLoading) {
          Navigator.of(context, rootNavigator: true).pop();

          AppToast.doneToast('successfullyCompleted'.tr());
          context.pushReplacement(Routes.main);
          ref.read(homeControllerProvider.notifier).getUserEvents(page: 1);
        }

        if (next is AsyncError) {
          Navigator.of(context, rootNavigator: true).pop();
          AppToast.errorToast(next.error.toString());
        }
      }
    });

    // استخدام الطول المحسوب للصورة إذا اكتمل الحساب، وإلا نستخدم 213 كقيمة مبدئية، أو 0 إذا لم تكن هناك صورة
    final double expandedH = (resolvedUrl != null && resolvedUrl.isNotEmpty)
        ? (_calculatedHeight ?? 213.h)
        : 0;

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (didPop) return;

        if (context.canPop()) {
          context.pop();
        } else {
          context.go(Routes.main);
        }
      },
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: () async {
            ref.read(homeControllerProvider.notifier).getEventDetails(
                widget.id ?? widget.eventModel?.occasionId ?? '');
          },
          child: CustomScrollView(
            slivers: [
              EventDetailsPageSliverAppBar(
                controller: controller,
                eventModel: widget.eventModel,
                expandedH: expandedH,
                resolvedUrl: resolvedUrl,
              ),
              controller!.when(
                data: (event) => EventDetailsPageBody(
                  event: event,
                  eventModel: widget.eventModel,
                ),
                error: (e, st) => SliverToBoxAdapter(
                  child: AppErrorWidget(
                    onTap: () {
                      ref
                          .read(homeControllerProvider.notifier)
                          .getEventDetails(widget.id!);
                    },
                  ),
                ),
                loading: () => SliverFillRemaining(
                  child: Center(child: MailPulseAnimation()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
