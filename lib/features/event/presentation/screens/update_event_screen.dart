import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kroot_app/features/auth/presentation/widgets/create_account_page/create_account_field.dart';
import 'package:kroot_app/features/event/data/models/get_user_events/get_user_events_model.dart';
import 'package:kroot_app/features/event/presentation/controller/add_event/add_event_controller.dart';
import 'package:kroot_app/features/event/presentation/controller/home_controller.dart';
import 'package:kroot_app/features/event/presentation/controller/update_event/update_event_controller.dart';
import 'package:kroot_app/features/event/presentation/widgets/create_event_page/event_details_date.dart';
import 'package:kroot_app/features/event/presentation/widgets/create_event_page/event_details_image.dart';
import 'package:kroot_app/features/event/presentation/widgets/create_event_page/event_details_language.dart';
import 'package:kroot_app/features/event/presentation/widgets/create_event_page/event_details_time.dart';
import 'package:kroot_app/features/event/presentation/widgets/create_event_page/event_location_widget.dart';
import 'package:kroot_app/gen/assets.gen.dart';
import 'package:kroot_app/src/extenssions/int_extenssion.dart';
import 'package:kroot_app/src/extenssions/widget_extensions.dart';
import 'package:kroot_app/src/routing/routes.dart';
import 'package:kroot_app/src/shared_widgets/custom_appbar.dart';
import 'package:kroot_app/src/shared_widgets/custom_button_widget.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';
import 'package:kroot_app/src/utils/app_alert.dart';
import 'package:kroot_app/src/utils/app_toast.dart';

class UpdateEventScreen extends ConsumerStatefulWidget {
  final String? id;
  final EventModel eventModel;
  const UpdateEventScreen({
    super.key,
    required this.id,
    required this.eventModel,
  });
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
          widget.eventModel,
          widget.eventModel.occasionId ?? widget.id!,
        )
        ..setSelectedContactsFromGuests(
          // ref.read(homeControllerProvider).value!.occasionModel!.value!.guests!,
          widget.eventModel.guests!,
        );
    });
    _title = TextEditingController(
      // text: ref.read(homeControllerProvider).value?.occasionModel?.value!.title,
      text: widget.eventModel.title,
    );
    _date = TextEditingController(text: '');
  }

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<FormState>();
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

    // late BuildContext context;

    ref.listen(updateEventControllerProvider, (prev, next) {
      if (next.value!.isUpdateEvent != null) {
        if (next is AsyncLoading) {
          AppAlert.showLoadingDialog(context);
        }

        if (next is AsyncData && prev is AsyncLoading) {
          // if (context.canPop()) {

          //? For loading :
          context.pop();

          //? For edit screen :
          context.pop();

          //? For bottom sheet in detaisl screen :
          context.pop();
          AppToast.doneToast(next.value!.msg);
          ref
              .read(homeControllerProvider.notifier)
              .getEventDetails(widget.id ?? widget.eventModel.occasionId!);

          // context.pushReplacement(Routes.main);
          // ref.read(bottomNavIndexProvider.notifier).setIndex(0);

          // context.go(
          //   Routes.eventDetails,
          //   // extra: widget.id != null
          //   //? next.value!.updatedEvent!.occasionId
          //   extra: {'id': next.value!.updatedEvent!.occasionId},
          // );
          ref.read(addEventControllerProvider.notifier).clearEventScreen();
          // }
        }

        if (next is AsyncError) {
          context.pop();
          AppToast.errorToast(next.error.toString());
        }
      }
    });

    return Scaffold(
      appBar: CustomAppbar(
        title: context.tr('updateEvent'),
        // withBackButton: true,
      ),
      body: Form(
        key: key,
        child: Column(
          children: [
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
                  AppTextFormField(
                    controller: _title,
                    isReadOnly: false,
                    hint: context.tr('enterEventTitle'),
                    isRequired: false,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return context.tr('required');
                      }
                      return null;
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
                              .read(updateEventControllerProvider.notifier)
                              .deleteImage(
                                widget.eventModel.occasionId ?? widget.id!,
                              );
                        },
                        imageUrl: imageUrl,
                        onImageSelect: (image) {
                          ref
                              .read(updateEventControllerProvider.notifier)
                              .updateDataForEvent(
                                EventModel(image: image),
                                widget.eventModel.occasionId ?? widget.id!,
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
                              .read(updateEventControllerProvider.notifier)
                              .updateEventDate(
                                date,
                                widget.eventModel.occasionId ?? widget.id!,
                              );
                        },
                      );
                    },
                  ),

                  20.verticalSpace,
                  //? Time :
                  Consumer(
                    builder: (context, ref, child) {
                      final date = ref.watch(
                        updateEventControllerProvider.select(
                          (val) => val.value!.updatedEvent?.date,
                        ),
                      );
                      return EventDetailsTime(
                        dateTime: DateTime.parse(
                          date ?? DateTime.now().toString(),
                        ),
                        onSelectTime: (date) {
                          ref
                              .read(updateEventControllerProvider.notifier)
                              .updateEventTime(
                                date,
                                widget.eventModel.occasionId ?? widget.id!,
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
                              .read(updateEventControllerProvider.notifier)
                              .updateDataForEvent(
                                EventModel(language: val),
                                widget.eventModel.occasionId ?? widget.id!,
                              );
                        },
                      );
                    },
                  ),
                  20.verticalSpace,

                  // //? Type :
                  // if (ref.read(
                  //       homeControllerProvider.select((val) {
                  //         return val
                  //             .value!
                  //             .eventResponse
                  //             ?.value
                  //             ?.eventTypes;
                  //       }),
                  //     ) !=
                  //     null)
                  // Consumer(
                  //   builder: (context, ref, child) {
                  //     // final type = ref.watch(
                  //     //   updateEventControllerProvider.select(
                  //     //     (val) => val.value!.updatedEvent?.type,
                  //     //   ),
                  //     // );
                  //     final type = 'Birthday';
                  //     return EventDetailsType(
                  //       value: type,
                  //       onTypeChange: (val) {
                  //         ref
                  //             .read(
                  //               updateEventControllerProvider.notifier,
                  //             )
                  //             .updateDataForEvent(
                  //               EventModel(type: val),
                  //               widget.eventModel?.occasionId ??
                  //                   widget.id!,
                  //             );
                  //       },
                  //     );
                  //   },
                  // ),
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
                  Consumer(
                    builder: (context, ref, child) {
                      final latlng = ref.watch(
                        updateEventControllerProvider.select((val) {
                          final lat = val.value!.updatedEvent!.mapLatitude;
                          final lng = val.value!.updatedEvent!.mapLongitude;
                          return LatLng(double.parse(lat!), double.parse(lng!));
                        }),
                      );
                      return EventLocationWidget(
                        id: widget.id ?? widget.eventModel.occasionId!,
                        latlng: LatLng(latlng.latitude, latlng.longitude),
                        // latlng: LatLng(
                        //   double.parse(lat),
                        //   double.parse(lng),
                        // ),
                      );
                    },
                  ),

                  // Container(
                  //   width: double.infinity,
                  //   height: 194.h,
                  //   decoration: BoxDecoration(
                  //     color: AppColors.deepGreen,
                  //     borderRadius: BorderRadius.circular(10.r),
                  //   ),
                  // ),
                  20.verticalSpace,

                  //? Save :
                  CustomButtonWidget(
                    text: '',
                    onTap: () async {
                      // context.push(Routes.eventGuestList);
                      if (key.currentState!.validate()) {
                        ref.read(updateEventControllerProvider.notifier)
                          ..updateDataForEvent(
                            EventModel(title: _title.text),
                            widget.eventModel.occasionId ?? widget.id!,
                          )
                          ..updateEventToServer(
                            widget.eventModel.occasionId ?? widget.id!,
                          );
                      }
                    },
                    isFiled: true,
                    content: Text(
                      context.tr('save'),
                      style: AppTextStyle.nunitoBold16.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    height: 44.h,
                    width: 330.w,
                    backgroundColor: AppColors.primary,
                  ),
                  20.verticalSpace,
                  CustomButtonWidget(
                    text: '',
                    onTap: () {
                      // context.push(Routes.eventGuestList, extra: event.occasionId);
                      context.push(
                        Routes.inviteTemplate,
                        extra: widget.eventModel.occasionId ?? widget.id!,
                      );
                    },
                    isFiled: true,
                    content: Text(
                      context.tr('eventTemplate'),
                      style: AppTextStyle.nunitoBold16.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                    boxDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: AppColors.primary.withValues(alpha: .25),
                        ),
                      ],
                    ),
                    height: 44.h,
                    width: 330.w,
                    backgroundColor: AppColors.white,
                  ),

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     AddEventPageBotton(
                  //       onTap: () {
                  //         if (_key.currentState!.validate()) {
                  //           // if (image != null) {

                  //           ref.read(
                  //               updateEventControllerProvider.notifier,
                  //             )
                  //             ..updateDataForEvent(
                  //               EventModel(
                  //                 title: _title.text,
                  //                 mapLink: 'map',
                  //                 locationName: 'qatar',
                  //               ),
                  //               widget.id,
                  //             )
                  //             ..updateEventToServer(widget.id);

                  //           // } else {
                  //           //   AppToast.errorToast('image is required');
                  //           // }
                  //         }
                  //       },
                  //       isSubmit: false,
                  //       child: Text(
                  //         context.tr('saveDraft'),
                  //         style: AppTextStyle.rubikSemiBold18.copyWith(
                  //           color: AppColors.primary,
                  //         ),
                  //       ),
                  //     ),

                  //     AddEventPageBotton(
                  //       onTap: () {
                  //         if (_key.currentState!.validate()) {
                  //           // if (image != null) {
                  //           ref
                  //               .read(addEventControllerProvider.notifier)
                  //               .updateEvent(
                  //                 EventModel(
                  //                   title: _title.text,
                  //                   mapLink: 'map',
                  //                   locationName: 'qatar',
                  //                 ),
                  //               );
                  //           context.push(
                  //             Routes.updateContact,
                  //             extra: widget.id,
                  //           );
                  //           // print(
                  //           //   ref
                  //           //       .read(homeControllerProvider)
                  //           //       .value
                  //           //       ?.updatedEvent
                  //           //       ?.language,
                  //           // );
                  //           // } else {
                  //           // AppToast.errorToast('image is required');
                  //           // }
                  //         }
                  //       },
                  //       isSubmit: true,
                  //       child: Text(
                  //         context.tr('continue'),
                  //         style: AppTextStyle.rubikSemiBold18.copyWith(
                  //           color: AppColors.white,
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  20.verticalSpace,
                ],
              ),
            ),
          ],
        ).onlyPadding(start: 16.w, end: 23.w),
      ),
    );
  }
}
