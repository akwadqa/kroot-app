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
import 'package:kroot_app/features/event/presentation/widgets/create_event_page/add_event_page_botton.dart';
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

    Future(() {
      ref.read(addEventControllerProvider.notifier).initLocation();
    });
  }

  @override
  void dispose() {
    _title.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<FormState>();
    late BuildContext ctx;

    ref.listen(
      addEventControllerProvider.select((val) => val.value!.selectedPlace),
      (prev, next) {
        if (next is AsyncLoading) {
          AppAlert.showLoadingDialog(context);
        }

        if ((next is AsyncData && prev is AsyncLoading) ||
            (next is AsyncError && prev is AsyncLoading)) {
          context.pop();
          setState(() {});
        }
      },
    );

    ref.listen(addEventControllerProvider, (prev, next) {
      if (next.value!.isAddEvent != null) {
        if (next is AsyncLoading) {
          AppAlert.showLoadingDialog(ctx);
        }

        if (next is AsyncData && prev is AsyncLoading) {
          ctx.pop();
          AppToast.doneToast("successfullyCompleted".tr());

          ref.read(homeControllerProvider.notifier)
            ..getUserEvents(page: 1)
            ..getUtils();
          context.go(
            Routes.eventDetails,

            extra: {'id': next.value!.createEventResponse?.eventId},
          );
          ref.read(addEventControllerProvider.notifier).clearEventScreen();
        }

        if (next is AsyncError && prev is AsyncLoading) {
          ctx.pop();
          AppToast.errorToast(next.error.toString());
        }
      }
    });

    return Scaffold(
      appBar: CustomAppbar(
        title: context.tr('createEvent'),
        withBackButton: true,
      ),
      body: Builder(
        builder: (context) {
          ctx = context;
          return Form(
            key: key,
            child: Column(
              children: [
                20.verticalSpace,
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
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

                      AppTextFormField(
                        withIcon: false,
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

                      Consumer(
                        builder: (context, ref, child) {
                          final date = ref.watch(
                            addEventControllerProvider.select(
                              (val) => val.value!.eventModel?.date,
                            ),
                          );
                          return EventDetailsDate(
                            date: date,

                            onSelectDate: (date) {
                              ref
                                  .read(addEventControllerProvider.notifier)
                                  .updateEventDate(date);
                            },
                          );
                        },
                      ),

                      20.verticalSpace,

                      Consumer(
                        builder: (context, ref, child) {
                          final date = ref.watch(
                            addEventControllerProvider.select(
                              (val) => val.value!.eventModel?.date,
                            ),
                          );
                          return EventDetailsTime(
                            dateTime: DateTime.parse(
                              date ?? DateTime.now().toString(),
                            ),

                            onSelectTime: (date) {
                              ref
                                  .read(addEventControllerProvider.notifier)
                                  .updateEventTime(date);
                            },
                          );
                        },
                      ),

                      20.verticalSpace,

                      // Consumer(
                      //   builder: (context, ref, child) {
                      //     final lang = ref.watch(
                      //       addEventControllerProvider.select(
                      //         (val) => val.value!.eventModel?.language,
                      //       ),
                      //     );
                      //     return EventDetailsLanguage(
                      //       value: lang ?? 'Arabic',
                      //       onLangChang: (val) {
                      //         ref
                      //             .read(addEventControllerProvider.notifier)
                      //             .updateEvent(EventModel(language: val));
                      //       },
                      //     );
                      //   },
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
                            addEventControllerProvider.select(
                              (val) => val.value!.latLng,
                            ),
                          );

                          return EventLocationWidget(
                            latlng: LatLng(latlng.lat, latlng.lng),
                          );
                        },
                      ),
                      20.verticalSpace,

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          AddEventPageBotton(
                            onTap: () {
                              if (key.currentState!.validate()) {
                                ref.read(addEventControllerProvider.notifier)
                                  ..updateEvent(EventModel(title: _title.text))
                                  ..createEvent();
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
                              if (key.currentState!.validate()) {
                                ref
                                    .read(addEventControllerProvider.notifier)
                                    .updateEvent(
                                      EventModel(title: _title.text),
                                    );
                                context.push(Routes.guestList);
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
    );
  }
}
