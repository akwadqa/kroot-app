import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wedding_app/features/auth/presentation/widgets/create_account_page/create_account_field.dart';
import 'package:wedding_app/features/event/data/models/get_user_events/get_user_events_model.dart';
import 'package:wedding_app/features/event/presentation/controller/add_event/add_event_controller.dart';
import 'package:wedding_app/features/event/presentation/controller/home_controller.dart';
import 'package:wedding_app/features/event/presentation/controller/update_event/update_event_controller.dart';
import 'package:wedding_app/features/event/presentation/widgets/create_event_page/add_event_page_botton.dart';
import 'package:wedding_app/features/event/presentation/widgets/create_event_page/event_details_date.dart';
import 'package:wedding_app/features/event/presentation/widgets/create_event_page/event_details_image.dart';
import 'package:wedding_app/features/event/presentation/widgets/create_event_page/event_details_language.dart';
import 'package:wedding_app/features/event/presentation/widgets/create_event_page/event_details_type.dart';
import 'package:wedding_app/gen/assets.gen.dart';
import 'package:wedding_app/src/extenssions/int_extenssion.dart';
import 'package:wedding_app/src/extenssions/widget_extensions.dart';
import 'package:wedding_app/src/routing/routes.dart';
import 'package:wedding_app/src/shared_widgets/custom_appbar.dart';
import 'package:wedding_app/src/theme/app_colors.dart';
import 'package:wedding_app/src/theme/app_text_style.dart';
import 'package:wedding_app/src/utils/app_alert.dart';
import 'package:wedding_app/src/utils/app_toast.dart';

class UpdateEventScreen extends ConsumerStatefulWidget {
  final String id;
  const UpdateEventScreen(this.id, {super.key});
  @override
  ConsumerState<UpdateEventScreen> createState() => _UpdateEventScreenState();
}

class _UpdateEventScreenState extends ConsumerState<UpdateEventScreen> {
  late TextEditingController _title, _date;
  @override
  void initState() {
    super.initState();
    Future(() {
      ref.read(updateEventControllerProvider.notifier)
        ..updateDataForEvent(
          ref.read(homeControllerProvider).value!.occasionModel!,
          widget.id,
        )
        ..setSelectedContactsFromGuests(
          ref.read(homeControllerProvider).value!.occasionModel!.guests!,
        );
    });
    _title = TextEditingController(
      text: ref.read(homeControllerProvider).value?.occasionModel?.title,
    );
    _date = TextEditingController(text: '');
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

    ref.listen(updateEventControllerProvider, (prev, next) {
      if (next.value!.isUpdateEvent != null) {
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
            extra: next.value!.updatedEvent!.occasionId,
          );
          ref.read(addEventControllerProvider.notifier).clearEventScreen();
          // }
        }

        if (next is AsyncError) {
          ctx.pop();
          AppToast.errorToast(next.error.toString());
        }
      }
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
                    title: context.tr('updateEvent'),
                    withBackButton: true,
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
                            final imageUrl = ref.watch(
                              updateEventControllerProvider.select(
                                (val) => val.value!.updatedEvent?.imageUrl,
                              ),
                            );
                            final image = ref.watch(
                              updateEventControllerProvider.select(
                                (val) => val.value!.updatedEvent?.image,
                              ),
                            );
                            print('-------------');
                            print(imageUrl);
                            return EventDetailsImage(
                              image: image,
                              deleteFile: null,
                              deleteLink: () {
                                ref
                                    .read(
                                      updateEventControllerProvider.notifier,
                                    )
                                    .deleteImage(widget.id);
                              },
                              imageUrl: imageUrl,
                              onImageSelect: (image) {
                                ref
                                    .read(
                                      updateEventControllerProvider.notifier,
                                    )
                                    .updateDataForEvent(
                                      EventModel(image: image),
                                      widget.id,
                                    );
                              },
                            );
                          },
                        ),

                        20.verticalSpace,

                        //? Date :
                        Consumer(
                          builder: (context, ref, child) {
                            final date = ref.watch(
                              updateEventControllerProvider.select(
                                (val) => val.value!.updatedEvent?.date,
                              ),
                            );
                            return EventDetailsDate(
                              date: date,
                              onSelectDate: (date) {
                                ref
                                    .read(
                                      updateEventControllerProvider.notifier,
                                    )
                                    .updateDataForEvent(
                                      EventModel(date: date.toString()),
                                      widget.id,
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
                              updateEventControllerProvider.select(
                                (val) => val.value!.updatedEvent?.language,
                              ),
                            );
                            return EventDetailsLanguage(
                              value: lang,
                              onLangChang: (val) {
                                ref
                                    .read(
                                      updateEventControllerProvider.notifier,
                                    )
                                    .updateDataForEvent(
                                      EventModel(language: val),
                                      widget.id,
                                    );
                              },
                            );
                          },
                        ),
                        20.verticalSpace,

                        // //? Type :
                        if (ref.read(
                              homeControllerProvider.select((val) {
                                return val.value!.eventResponse?.eventTypes;
                              }),
                            ) !=
                            null)
                          Consumer(
                            builder: (context, ref, child) {
                              final type = ref.watch(
                                updateEventControllerProvider.select(
                                  (val) => val.value!.updatedEvent?.type,
                                ),
                              );
                              return EventDetailsType(
                                value: type,
                                onTypeChange: (val) {
                                  ref
                                      .read(
                                        updateEventControllerProvider.notifier,
                                      )
                                      .updateDataForEvent(
                                        EventModel(type: val),
                                        widget.id,
                                      );
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

                                  ref.read(
                                      updateEventControllerProvider.notifier,
                                    )
                                    ..updateDataForEvent(
                                      EventModel(
                                        title: _title.text,
                                        mapLink: 'map',
                                        locationName: 'qatar',
                                      ),
                                      widget.id,
                                    )
                                    ..updateEventToServer(widget.id);

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
                                  context.push(
                                    Routes.updateContact,
                                    extra: widget.id,
                                  );
                                  // print(
                                  //   ref
                                  //       .read(homeControllerProvider)
                                  //       .value
                                  //       ?.updatedEvent
                                  //       ?.language,
                                  // );
                                  // } else {
                                  // AppToast.errorToast('image is required');
                                  // }
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
