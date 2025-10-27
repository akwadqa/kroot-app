import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wedding_app/features/event/presentation/controller/home_controller.dart';
import 'package:wedding_app/src/bottm_navigation_bar_provider.dart';
import 'package:wedding_app/src/extenssions/int_extenssion.dart';
import 'package:wedding_app/src/extenssions/widget_extensions.dart';
import 'package:wedding_app/src/routing/routes.dart';
import 'package:wedding_app/src/shared_widgets/custom_appbar.dart';
import 'package:wedding_app/src/shared_widgets/custom_button_widget.dart';
import 'package:wedding_app/src/theme/app_colors.dart';
import 'package:wedding_app/src/theme/app_text_style.dart';
import 'package:wedding_app/src/utils/app_alert.dart';

class SendInviteScreen extends ConsumerWidget {
  const SendInviteScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    late BuildContext ctx;
    ref.listen(homeControllerProvider, (prev, next) {
      //? This listener for create event from this screen :
      if (next.value?.isCreatingEvent != null) {
        //? Loading :
        if (next is AsyncLoading) {
          AppAlert.showLoadingDialog(ctx);
        }

        //? Loaded and the last will be loading - not error :
        if (next is AsyncData && prev is AsyncLoading) {
          //? Close the loading
          ctx.pop();

          //? Go to home
          // context.pushReplacement(Routes.main);
          context.pushReplacement(
            Routes.eventDetails,
            extra: next.value!.createEventResponse!.eventId,
          );

          //? Change the tab
          ref.read(bottomNavIndexProvider.notifier).setIndex(0);

          //? Cleare event details in create event screen
          ref.read(homeControllerProvider.notifier).clearEventScreen();

          //? Show message :
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('content added')));
        }

        //? Error :
        if (next is AsyncError) {
          ctx.pop();
          // ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(next.error.toString())));
        }
      }
    });

    return Scaffold(
      appBar: CustomAppbar(title: context.tr('send')),

      body: Builder(
        builder: (context) {
          ctx = context;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              30.verticalSpace,

              Text(
                context.tr('sendInvite'),
                style: AppTextStyle.rubikSemiBold18.copyWith(
                  color: AppColors.primary,
                ),
              ),
              12.verticalSpace,
              Text(
                context.tr('sendEventInvite'),
                style: AppTextStyle.rubikRegular14.copyWith(
                  color: AppColors.primary,
                ),
              ),

              Consumer(
                builder: (context, ref, child) {
                  final contact = ref
                      .read(homeControllerProvider)
                      .value!
                      .selectedContacts;
                  return Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) =>
                          Divider(color: AppColors.grayBorder),
                      padding: EdgeInsets.zero,
                      itemCount: contact.length,

                      itemBuilder: (context, index) => ListTile(
                        title: Text(
                          contact[index].contact.displayName,
                          // 'Hadeel',
                          style: AppTextStyle.rubikRegular16.copyWith(
                            color: AppColors.black,
                          ),
                        ),
                        subtitle: Directionality(
                          textDirection: ui.TextDirection.ltr,
                          child: Align(
                            alignment: context.locale.languageCode == 'ar'
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Text(
                              contact[index].contact.phones.first.number,
                              // '+974999999999',
                              style: AppTextStyle.rubikRegular16.copyWith(
                                color: AppColors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              Spacer(),
              CustomButtonWidget(
                text: '',
                onTap: () {
                  // context.pushReplacement(Routes.eventDetails, extra: id);
                  ref.read(homeControllerProvider.notifier).createEvent();
                },
                backgroundColor: AppColors.primary,
                isFiled: true,
                height: 44.h,
                content: Text(
                  context.tr('send'),
                  style: AppTextStyle.rubikSemiBold18.copyWith(
                    color: AppColors.white,
                  ),
                ),
                width: double.infinity,
              ),
              18.verticalSpace,
            ],
          ).symmetricPadding(horizontal: 22.w);
        },
      ),
    );
  }
}
