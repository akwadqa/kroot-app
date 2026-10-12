import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kroot_app/src/shared_widgets/fade_circle_loading_indicator.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';

class EventDetailsPageFlexibleSpace extends StatelessWidget {
  const EventDetailsPageFlexibleSpace({
    super.key,
    required this.expandedH,
    required this.resolvedUrl,
    required this.title,
  });

  final double expandedH;
  final String? resolvedUrl;
  final String title;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double top = constraints.biggest.height;

        final double collapsedH =
            kToolbarHeight + MediaQuery.of(context).padding.top;

        final double t = (expandedH <= 0)
            ? 0
            : ((top - collapsedH) / (expandedH - collapsedH)).clamp(0.0, 1.0);

        final bool showTitle = t <= 0.02;

        return Stack(
          fit: StackFit.expand,
          children: [
            Container(color: AppColors.white),
            if (resolvedUrl != null)
              Opacity(
                opacity: t,
                child: CachedNetworkImage(
                  fadeInCurve: Curves.linear,
                  placeholder: (context, url) => FadeCircleLoadingIndicator(),
                  imageUrl: resolvedUrl!,
                  // بما أننا قمنا بحساب الارتفاع بدقة بناءً على نسبة الأبعاد،
                  // فإن استخدام BoxFit.cover لن يقوم بقص الصورة في وضعها الطبيعي،
                  // وسيسمح لها بالتلاشي والقص بشكل أنيق وسلس عند السحب للأعلى
                  fit: BoxFit.cover,
                ),
              ),
            IgnorePointer(
              ignoring: true,
              child: Container(
                color: AppColors.white.withOpacity((1 - t) * 0.10),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: SafeArea(
                bottom: false,
                child: Padding(
                  padding: EdgeInsetsDirectional.only(
                    start: 72.w,
                    end: 22.w,
                    bottom: 12.h,
                  ),
                  child: AnimatedOpacity(
                    opacity: showTitle ? 1 : 0,
                    duration: const Duration(milliseconds: 180),
                    curve: Curves.easeOut,
                    child: Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.rubikMedium20.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
