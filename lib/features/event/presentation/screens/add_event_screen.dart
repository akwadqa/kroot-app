import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kroot_app/features/auth/presentation/widgets/create_account_page/create_account_field.dart';
import 'package:kroot_app/features/event/data/models/get_user_events/get_user_events_model.dart';
import 'package:kroot_app/features/event/presentation/controller/add_event/add_event_controller.dart';
import 'package:kroot_app/features/event/presentation/controller/home_controller.dart';
import 'package:kroot_app/features/event/presentation/widgets/create_event_page/add_event_page_botton.dart';
import 'package:kroot_app/features/event/presentation/widgets/create_event_page/event_details_date.dart';
import 'package:kroot_app/features/event/presentation/widgets/create_event_page/event_details_image.dart';
import 'package:kroot_app/features/event/presentation/widgets/create_event_page/event_details_language.dart';
import 'package:kroot_app/features/event/presentation/widgets/create_event_page/event_details_type.dart';
import 'package:kroot_app/gen/assets.gen.dart';
import 'package:kroot_app/src/extenssions/int_extenssion.dart';
import 'package:kroot_app/src/extenssions/widget_extensions.dart';
import 'package:kroot_app/src/routing/routes.dart';
import 'package:kroot_app/src/shared_widgets/custom_appbar.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';
import 'package:kroot_app/src/utils/app_alert.dart';
import 'package:kroot_app/src/utils/app_toast.dart';

class AddEventScreen extends ConsumerStatefulWidget {
  const AddEventScreen({super.key});
  @override
  ConsumerState<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends ConsumerState<AddEventScreen> {
  late TextEditingController _title;
  @override
  void initState() {
    super.initState();
    _title = TextEditingController(text: '');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _title.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _key = GlobalKey<FormState>();
    //? Event image :
    // final image = ref
    //     .watch(homeControllerProvider)
    //     .value!
    //     .createEventRequest
    //     ?.image;

    //? Event types :
    // final items =
    //     ref.watch(homeControllerProvider).value!.eventResponse?.eventTypes ??
    //     [];

    late BuildContext ctx;

    ref.listen(addEventControllerProvider, (prev, next) {
      if (next.value!.isAddEvent != null) {
        //? For loading :
        if (next is AsyncLoading) {
          AppAlert.showLoadingDialog(ctx);
        }

        if (next is AsyncData && prev is AsyncLoading) {
          // if (context.canPop()) {
          ctx.pop();
          AppToast.doneToast('Done');

          // context.pushReplacement(Routes.main);
          // ref.read(bottomNavIndexProvider.notifier).setIndex(0);

          context.pushReplacement(
            Routes.eventDetails,
            // extra: widget.id != null
            //? next.value!.updatedEvent!.occasionId
            extra: next.value!.createEventResponse?.eventId,
          );
          ref.read(addEventControllerProvider.notifier).clearEventScreen();
        }
        // }

        if (next is AsyncError && prev is AsyncLoading) {
          ctx.pop();
          AppToast.errorToast(next.error.toString());
        }
      }
      // if (next is AsyncLoading && next.value?.isGetContacts == null) {
      //   AppAlert.showLoadingDialog(ctx);
      // }

      // if (next is AsyncData && prev is AsyncLoading) {
      //   // if (context.canPop()) {
      //   ctx.pop();
      //   if (next.value?.isGetContacts == null) {
      //     AppToast.doneToast('Done');

      //     // context.pushReplacement(Routes.main);
      //     // ref.read(bottomNavIndexProvider.notifier).setIndex(0);

      //     context.pushReplacement(
      //       Routes.eventDetails,
      //       // extra: widget.id != null
      //       //? next.value!.updatedEvent!.occasionId
      //       extra: next.value!.createEventResponse?.eventId,
      //     );
      //     ref.read(addEventControllerProvider.notifier).clearEventScreen();
      //   }
      //   // }
      // }

      // if (next is AsyncError && prev is AsyncLoading) {
      //   ctx.pop();
      //   AppToast.errorToast(next.error.toString());
      // }
    });

    return SafeArea(
      bottom: true,
      top: false,
      child: Scaffold(
        body: Builder(
          builder: (context) {
            ctx = context;
            return Form(
              key: _key,
              child: Column(
                children: [
                  CustomAppbar(
                    title: context.tr('createEvent'),
                    withBackButton: false,
                  ),

                  20.verticalSpace,

                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        //? Event details :
                        Text(
                          context.tr('eventDetails'),
                          style: AppTextStyle.rubikSemiBold18.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                        12.verticalSpace,
                        Text(
                          context.tr('fillDetails'),
                          style: AppTextStyle.rubikRegular14.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                        20.verticalSpace,

                        //? Name :
                        CreataAccountField(
                          controller: _title,
                          isReadOnly: false,
                          hint: context.tr('enterEventTitle'),
                          isRequired: false,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return context.tr('required');
                            }
                          },

                          label: context.tr('eventName'),
                          icon: Assets.icons.eventNameIc,
                        ),
                        20.verticalSpace,
                        Text(
                          context.tr('eventImage'),
                          style: AppTextStyle.rubikRegular18.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                        12.verticalSpace,

                        //? For image :
                        Consumer(
                          builder: (context, ref, child) {
                            final image = ref.watch(
                              addEventControllerProvider.select(
                                (val) => val.value!.eventModel?.image,
                              ),
                            );
                            return EventDetailsImage(
                              deleteLink: null,
                              deleteFile: () {
                                ref
                                    .read(addEventControllerProvider.notifier)
                                    .deleteImage();
                              },
                              onImageSelect: (image) {
                                ref
                                    .read(addEventControllerProvider.notifier)
                                    .updateEvent(EventModel(image: image));
                              },
                              image: image,
                              imageUrl: null,
                            );
                          },
                        ),

                        20.verticalSpace,

                        //? Date :
                        Consumer(
                          builder: (context, ref, child) {
                            final date = ref.watch(
                              addEventControllerProvider.select(
                                (val) => val.value!.eventModel?.date,
                              ),
                            );
                            return EventDetailsDate(
                              date: date,
                              // controller: ,
                              onSelectDate: (date) {
                                ref
                                    .read(addEventControllerProvider.notifier)
                                    .updateEvent(
                                      EventModel(date: date.toString()),
                                    );
                              },
                            );
                          },
                        ),

                        20.verticalSpace,
                        //? Language :
                        Consumer(
                          builder: (context, ref, child) {
                            final lang = ref.watch(
                              addEventControllerProvider.select(
                                (val) => val.value!.eventModel?.language,
                              ),
                            );
                            return EventDetailsLanguage(
                              value: lang,
                              onLangChang: (val) {
                                ref
                                    .read(addEventControllerProvider.notifier)
                                    .updateEvent(EventModel(language: val));
                              },
                            );
                          },
                        ),
                        20.verticalSpace,

                        // //? Type :
                        if (ref
                                .read(homeControllerProvider)
                                .value
                                ?.eventResponse
                                ?.eventTypes !=
                            null)
                          // if (ref.read(
                          //       homeControllerProvider.select((val) {
                          //         return val.value!.eventResponse?.eventTypes;
                          //       }),
                          //     ) !=
                          //     null)
                          Consumer(
                            builder: (context, ref, child) {
                              final type = ref.watch(
                                addEventControllerProvider.select(
                                  (val) => val.value!.eventModel?.type,
                                ),
                              );
                              return EventDetailsType(
                                value: type,
                                onTypeChange: (val) {
                                  ref
                                      .read(addEventControllerProvider.notifier)
                                      .updateEvent(EventModel(type: val));
                                },
                              );
                            },
                          ),
                        20.verticalSpace,

                        // Row(
                        //   children: [
                        //     Checkbox(value: false, onChanged: (val) {}),
                        //     Text(
                        //       context.tr('showQrinvite'),
                        //       style: AppTextStyle.rubikRegular16.copyWith(
                        //         color: AppColors.primary,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // 20.verticalSpace,
                        Text(
                          context.tr('eventLocation'),
                          style: AppTextStyle.rubikRegular18.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                        12.verticalSpace,
                        Container(
                          width: double.infinity,
                          height: 194.h,
                          decoration: BoxDecoration(
                            color: AppColors.deepGreen,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                        20.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            AddEventPageBotton(
                              onTap: () {
                                if (_key.currentState!.validate()) {
                                  // if (image != null) {

                                  ref.read(addEventControllerProvider.notifier)
                                    ..updateEvent(
                                      EventModel(
                                        title: _title.text,
                                        mapLink: 'map',
                                        locationName: 'qatar',
                                      ),
                                    )
                                    ..createEvent();

                                  // } else {
                                  //   AppToast.errorToast('image is required');
                                  // }
                                }
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
                              onTap: () {
                                if (_key.currentState!.validate()) {
                                  // if (image != null) {
                                  ref
                                      .read(addEventControllerProvider.notifier)
                                      .updateEvent(
                                        EventModel(
                                          title: _title.text,
                                          mapLink: 'map',
                                          locationName: 'qatar',
                                        ),
                                      );
                                  context.push(Routes.addContact);
                                }
                              },
                              isSubmit: true,
                              child: Text(
                                context.tr('continue'),
                                style: AppTextStyle.rubikSemiBold18.copyWith(
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        20.verticalSpace,
                      ],
                    ),
                  ),
                ],
              ).onlyPadding(start: 16.w, end: 23.w),
            );
          },
        ),
      ),
    );
  }
}
