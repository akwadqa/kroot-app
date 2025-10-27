import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wedding_app/features/event/presentation/controller/home_controller.dart';
import 'package:wedding_app/features/event/presentation/widgets/create_event_page/add_event_page_botton.dart';
import 'package:wedding_app/features/event/presentation/widgets/guest_list_page/guest_list_item.dart';
import 'package:wedding_app/gen/assets.gen.dart';
import 'package:wedding_app/src/bottm_navigation_bar_provider.dart';
import 'package:wedding_app/src/extenssions/widget_extensions.dart';
import 'package:wedding_app/src/routing/routes.dart';
import 'package:wedding_app/src/shared_widgets/custom_appbar.dart';
import 'package:wedding_app/src/theme/app_colors.dart';
import 'package:wedding_app/src/theme/app_text_style.dart';
import 'package:wedding_app/src/utils/app_alert.dart';

class GeustListScreen extends ConsumerWidget {
  const GeustListScreen({super.key});

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

          //? Go to event details
          // context.pushReplacement(Routes.main);
          context.pushReplacement(
            Routes.eventDetails,
            extra: next.value!.createEventResponse!.eventId,
          );

          //? Change the tab
          // ref.read(bottomNavIndexProvider.notifier).setIndex(0);

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

    final items = ref.watch(homeControllerProvider).value!.selectedContacts;
    return Scaffold(
      appBar: CustomAppbar(
        title: context.tr('guestList'),
        actionButton: GestureDetector(child: Assets.icons.addContactIc.svg()),
      ),

      body: Builder(
        builder: (context) {
          ctx = context;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              20.verticalSpace,
              Text(
                context.tr('additionalGuest'),
                style: AppTextStyle.rubikRegular12.copyWith(
                  color: AppColors.primary,
                ),
              ).onlyPadding(end: 22.w),

              Expanded(
                child:
                    // builder: (context, ref, _) {
                    items.isEmpty
                    ?
                      //? Empty :
                      Center(
                        child: Text(
                          context.tr('emptyContacts'),
                          style: AppTextStyle.rubikRegular16.copyWith(
                            color: AppColors.black,
                          ),
                        ),
                      )
                    : ListView.separated(
                        itemBuilder: (context, index) {
                          return GuestListItem(
                            contact: items[index],
                            decreament: () {
                              ref
                                  .read(homeControllerProvider.notifier)
                                  .decrementCount(items[index].contact);
                            },
                            increament: () {
                              ref
                                  .read(homeControllerProvider.notifier)
                                  .incrementCount(items[index].contact);
                            },
                          );
                        },
                        separatorBuilder: (context, index) =>
                            Divider(color: AppColors.grayBorder),
                        itemCount: items.length,
                      ),
              ),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AddEventPageBotton(
                      onTap: () {
                        ref.read(homeControllerProvider.notifier).createEvent();
                      },
                      isSubmit: false,
                      child: Text(
                        context.tr('saveDraft'),
                        style: AppTextStyle.rubikSemiBold18.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ),

                    AddEventPageBotton(
                      onTap:
                          ref
                              .read(homeControllerProvider)
                              .value!
                              .selectedContacts
                              .isEmpty
                          ? null
                          : () {
                              context.push(Routes.inviteTemplate);
                            },
                      isSubmit: ref
                          .read(homeControllerProvider)
                          .value!
                          .selectedContacts
                          .isNotEmpty,
                      child: Text(
                        context.tr('continue'),
                        style: AppTextStyle.rubikSemiBold18.copyWith(
                          color:
                              ref
                                  .read(homeControllerProvider)
                                  .value!
                                  .selectedContacts
                                  .isEmpty
                              ? AppColors.primary
                              : AppColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              20.verticalSpace,
            ],
          );
        },
      ),
    );
  }
}
