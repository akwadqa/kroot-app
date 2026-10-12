import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kroot_app/gen/assets.gen.dart';
import 'package:kroot_app/src/routing/routes.dart';

class EventDetailsPageBackButton extends StatelessWidget {
  const EventDetailsPageBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 22.w,
        right: context.locale.languageCode == 'ar' ? 0 : 22.w,
      ),
      child: GestureDetector(
        onTap: () {
          if (context.canPop()) {
            context.pop();
          } else {
            context.go(Routes.main);
          }
        },
        child: Assets.icons.verificationArrowBackIc.svg(
          width: context.locale.languageCode == 'ar' ? 30.w : null,
        ),
      ),
    );
  }
}
