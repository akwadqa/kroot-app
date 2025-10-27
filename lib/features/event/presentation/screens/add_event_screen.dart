import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wedding_app/features/auth/presentation/widgets/create_account_page/create_account_field.dart';
import 'package:wedding_app/features/event/data/models/create_event_request/create_event_request.dart';
import 'package:wedding_app/features/event/presentation/controller/home_controller.dart';
import 'package:wedding_app/features/event/presentation/controller/home_ui_controller.dart';
import 'package:wedding_app/features/event/presentation/widgets/create_event_page/add_event_page_botton.dart';
import 'package:wedding_app/features/event/presentation/widgets/create_event_page/create_event_page_select_language_field.dart';
import 'package:wedding_app/gen/assets.gen.dart';
import 'package:wedding_app/src/bottm_navigation_bar_provider.dart';
import 'package:wedding_app/src/extenssions/int_extenssion.dart';
import 'package:wedding_app/src/extenssions/widget_extensions.dart';
import 'package:wedding_app/src/routing/routes.dart';
import 'package:wedding_app/src/shared_widgets/custom_appbar.dart';
import 'package:wedding_app/src/theme/app_colors.dart';
import 'package:wedding_app/src/theme/app_text_style.dart';
import 'package:wedding_app/src/utils/app_alert.dart';
import 'package:wedding_app/src/utils/image_picker.dart';

class AddEventScreen extends ConsumerStatefulWidget {
  const AddEventScreen({super.key});

  @override
  ConsumerState<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends ConsumerState<AddEventScreen> {
  late TextEditingController _title, _date;
  @override
  void initState() {
    super.initState();
    _title = TextEditingController();
    _date = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final date = ref
        .watch(homeControllerProvider)
        .value!
        .createEventRequest
        ?.date;
    _date.text = date != null
        ? DateFormat('EEE, d-M-yyyy hh:mma').format(DateTime.parse(date))
        : '';
    final _key = GlobalKey<FormState>();
    //? Event image :
    final image = ref
        .watch(homeControllerProvider)
        .value!
        .createEventRequest
        ?.image;

    //? Event types :
    final items =
        ref.watch(homeControllerProvider).value!.eventResponse?.eventTypes ??
        [];

    late BuildContext ctx;

    ref.listen(homeControllerProvider, (prev, next) {
      if (next is AsyncLoading && (next.value!.isCreatingEvent ?? false)) {
        AppAlert.showLoadingDialog(ctx);
      }

      if (next is AsyncData && prev is AsyncLoading) {
        // if (context.canPop()) {
        ctx.pop();
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('done')));
        // context.pushReplacement(Routes.main);
        // ref.read(bottomNavIndexProvider.notifier).setIndex(0);
        context.pushReplacement(
          Routes.eventDetails,
          extra: next.value!.createEventResponse!.eventId,
        );
        ref.read(homeControllerProvider.notifier).clearEventScreen();
        // }
      }

      if (next is AsyncError && prev is AsyncLoading) {
        ctx.pop();
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('error')));
      }
    });

    return SafeArea(
      bottom: true,
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
                        AnimatedSize(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                          child: DottedBorder(
                            options: RoundedRectDottedBorderOptions(
                              color: AppColors.primary,
                              strokeWidth: 2,
                              radius: Radius.circular(7.r),
                              dashPattern: [6, 3],
                            ),
                            child: GestureDetector(
                              onTap: () async {
                                final newImage = await pickImage();
                                if (newImage != null) {
                                  ref
                                      .read(homeControllerProvider.notifier)
                                      .updateEvent(
                                        CreateEventRequest(image: newImage),
                                      );
                                }
                                print("Picked image path: ${newImage?.path}");

                                // ref
                                //     .read(homeControllerProvider.notifier)
                                //     .pickImageToEvent();
                              },
                              child: image == null
                                  ? Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 16.w,
                                        vertical: 13.h,
                                      ),
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: AppColors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: AppColors.grayBorder,
                                            offset: Offset(0, 1),
                                            blurRadius: 4,
                                            spreadRadius: 0,
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        children: [
                                          Assets.icons.uploadImageIc.svg(),

                                          15.horizontalSpace,
                                          Text(
                                            context.tr('uploadImage'),
                                            style: AppTextStyle.rubikRegular16
                                                .copyWith(
                                                  color: AppColors.grayHint,
                                                ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : Center(
                                      child: AnimatedSwitcher(
                                        duration: Duration(milliseconds: 300),
                                        switchInCurve: Curves.easeIn,
                                        switchOutCurve: Curves.easeOut,
                                        child: Image.file(
                                          image,
                                          key: ValueKey(image.path),
                                        ),
                                      ),
                                    ),
                            ),
                          ),
                        ),
                        20.verticalSpace,

                        //? Date :
                        CreataAccountField(
                          controller: _date,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return context.tr('required');
                            }
                          },
                          hint: context.tr('selectDate'),
                          isRequired: false,
                          label: context.tr('eventDate'),
                          icon: Assets.icons.selectedDateIc,
                          isReadOnly: true,
                          onTap: () async {
                            final date = await showDatePicker(
                              context: context,
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                            );

                            if (date != null) {
                              ref
                                  .read(homeControllerProvider.notifier)
                                  .updateEvent(
                                    CreateEventRequest(date: date.toString()),
                                  );
                            }
                          },
                        ),
                        20.verticalSpace,
                        //? Language :
                        CreateEventPageSelectLanguageField(
                          value: ref
                              .watch(homeControllerProvider)
                              .value!
                              .createEventRequest
                              ?.language,
                          onChanged: (val) {
                            ref
                                .read(homeControllerProvider.notifier)
                                .updateEvent(CreateEventRequest(language: val));
                          },
                          title: context.tr('eventLanguage'),
                          items: [
                            DropdownMenuItem(
                              value: context.tr('arabic'),
                              child: Text(
                                context.tr('arabic'),
                                style: AppTextStyle.rubikRegular16.copyWith(
                                  color: AppColors.grayHint,
                                ),
                              ),
                            ),
                            DropdownMenuItem(
                              value: context.tr('english'),
                              child: Text(
                                context.tr('english'),
                                style: AppTextStyle.rubikRegular16.copyWith(
                                  color: AppColors.grayHint,
                                ),
                              ),
                            ),
                          ],
                        ),
                        20.verticalSpace,

                        //? Type :
                        CreateEventPageSelectLanguageField(
                          value: ref
                              .watch(homeControllerProvider)
                              .value!
                              .createEventRequest
                              ?.type,
                          onChanged: (val) {
                            ref
                                .read(homeControllerProvider.notifier)
                                .updateEvent(CreateEventRequest(type: val));
                          },
                          title: context.tr('eventType'),
                          items: items
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(
                                    e,
                                    style: AppTextStyle.rubikRegular16.copyWith(
                                      color: AppColors.grayHint,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
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
                                  if (image != null) {
                                    ref.read(homeControllerProvider.notifier)
                                      ..updateEvent(
                                        CreateEventRequest(
                                          title: _title.text,
                                          map_link: 'map',
                                          location_name: 'qatar',
                                        ),
                                      )
                                      ..createEvent();
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('image is required'),
                                      ),
                                    );
                                  }
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
                                  if (image != null) {
                                    ref
                                        .read(homeControllerProvider.notifier)
                                        .updateEvent(
                                          CreateEventRequest(
                                            title: _title.text,
                                            map_link: 'map',
                                            location_name: 'qatar',
                                          ),
                                        );
                                    context.push(Routes.addContact);
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('image is required'),
                                      ),
                                    );
                                  }
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
