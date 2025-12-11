import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kroot_app/features/event/presentation/controller/add_event/add_event_controller.dart';
import 'package:kroot_app/features/event/presentation/controller/home_controller.dart';
import 'package:kroot_app/features/event/presentation/controller/update_event/update_event_controller.dart';
import 'package:kroot_app/features/event/presentation/widgets/create_event_page/add_event_page_botton.dart';
import 'package:kroot_app/features/event/presentation/widgets/create_event_page/create_event_page_select_language_field.dart';
import 'package:kroot_app/src/extenssions/int_extenssion.dart';
import 'package:kroot_app/src/extenssions/widget_extensions.dart';
import 'package:kroot_app/src/routing/routes.dart';
import 'package:kroot_app/src/shared_widgets/custom_appbar.dart';
import 'package:kroot_app/src/shared_widgets/custom_button_widget.dart';
import 'package:kroot_app/src/shared_widgets/fade_circle_loading_indicator.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';
import 'package:kroot_app/src/utils/app_alert.dart';
import 'package:kroot_app/src/utils/app_toast.dart';

class InviteTemplateScreen extends ConsumerWidget {
  const InviteTemplateScreen({super.key, this.id});
  final String? id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final imageUrl = ref.read(
      updateEventControllerProvider.select(
        (val) => val.value!.updatedEvent?.imageUrl,
      ),
    );
    final image = id != null
        ? ref.read(
            updateEventControllerProvider.select(
              (val) => val.value!.updatedEvent!.image,
            ),
          )
        : ref.read(
            addEventControllerProvider.select(
              (val) => val.value!.eventModel!.image,
            ),
          );

    String? resolveImageUrl() {
      final imagePath = imageUrl;
      final baseUrl = 'https://kroot.akwad.qa/';
      if (imagePath == null || imagePath.isEmpty) return null;
      if (imagePath.startsWith('http')) return imagePath;
      final base = baseUrl.endsWith('/') ? baseUrl : '$baseUrl/';
      final path = imagePath.startsWith('/')
          ? imagePath.substring(1)
          : imagePath;
      return '$base$path';
    }

    // final image = id != null
    //     ? ref.read(homeControllerProvider).value!.updatedEvent?.image
    //     : ref.read(homeControllerProvider).value!.createEventRequest?.image;
    late BuildContext ctx;
    if (id == null) {
      //? Listener for add :
      ref.listen(addEventControllerProvider, (prev, next) {
        //? This listener for create event in this screen :
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

            context.go(
              Routes.eventDetails,
              // extra: widget.id != null
              //? next.value!.updatedEvent!.occasionId
              // extra: next.value!.createEventResponse?.eventId,
              extra: {'id': next.value!.createEventResponse?.eventId},
            );
            ref.read(addEventControllerProvider.notifier).clearEventScreen();
          }
          // }

          if (next is AsyncError && prev is AsyncLoading) {
            ctx.pop();
            AppToast.errorToast(next.error.toString());
          }
        }

        //? This listener for add new contact :
        if (next.value?.isAddContact ?? false) {
          if (next is AsyncData) {
            context.pop();
            AppToast.doneToast('Contact added!');
          }

          if (next is AsyncError) {
            context.pop();
            AppToast.errorToast(next.error.toString());
          }
        }
      });
    } else {
      ref.listen(updateEventControllerProvider, (prev, next) {
        //? This listener for create event in this screen :
        if (next.value!.isUpdateEvent != null) {
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

            context.go(
              Routes.eventDetails,
              // extra: widget.id != null
              //? next.value!.updatedEvent!.occasionId
              // extra: next.value!.updatedEvent?.occasionId,
              extra: {'id': next.value!.updatedEvent?.occasionId},
            );
            ref.read(addEventControllerProvider.notifier).clearEventScreen();
          }
          // }

          if (next is AsyncError && prev is AsyncLoading) {
            ctx.pop();
            AppToast.errorToast(next.error.toString());
          }
        }
      });
    }

    final name = ref
        .read(homeControllerProvider)
        .value!
        .utilsResponse!
        .value!
        .subscriber!
        .name!;

    return Scaffold(
      appBar: CustomAppbar(title: context.tr('createEvent')),
      body: Builder(
        builder: (context) {
          ctx = context;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              30.verticalSpace,
              CreateEventPageSelectLanguageField(
                value: ref.watch(
                  addEventControllerProvider.select((val) {
                    return val.value!.eventModel?.inviteTemplate ??
                        'Kroot Invite-';
                  }),
                ),
                onChanged: (val) {
                  // ref
                  //     .read(homeControllerProvider.notifier)
                  //     .updateEvent(CreateEventRequest(invite_template: val));
                },
                title: context.tr('eventTemplate'),
                items: [
                  DropdownMenuItem(
                    value: 'Kroot Invite-',
                    child: Text(
                      context.tr('defaultTemplate'),
                      // 'Arabic',
                      style: AppTextStyle.rubikRegular16.copyWith(
                        color: AppColors.grayHint,
                      ),
                    ),
                  ),
                  DropdownMenuItem(
                    value: '2',
                    child: Text(
                      context.tr('template2'),
                      // 'English',
                      style: AppTextStyle.rubikRegular16.copyWith(
                        color: AppColors.grayHint,
                      ),
                    ),
                  ),
                  DropdownMenuItem(
                    value: '3',
                    child: Text(
                      context.tr('template3'),
                      // 'English',
                      style: AppTextStyle.rubikRegular16.copyWith(
                        color: AppColors.grayHint,
                      ),
                    ),
                  ),
                ],
              ),

              10.verticalSpace,
              Text(
                context.tr('preview'),
                style: AppTextStyle.rubikSemiBold18.copyWith(
                  color: AppColors.primary,
                ),
              ),
              12.verticalSpace,
              Text(
                context.tr('inviteLooks'),
                style: AppTextStyle.rubikRegular14.copyWith(
                  color: AppColors.primary,
                ),
              ),
              20.verticalSpace,

              //? invite item :
              Expanded(
                child: SingleChildScrollView(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.r),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        border: Border.all(color: AppColors.grayBorder),
                        borderRadius: BorderRadius.circular(20.r),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 2),
                            blurRadius: 4,
                            color: AppColors.primary.withValues(alpha: .25),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Assets.images.weddingImage.image(),

                          //? in update case :
                          id != null
                              ?
                                //? if update image updated :
                                resolveImageUrl() != null
                                    ? SizedBox(
                                        width: double.infinity,
                                        height: 182.h,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: CachedNetworkImage(
                                            width: double.infinity,
                                            height: double.infinity,
                                            fit: BoxFit.cover,
                                            fadeInCurve: Curves.linear,
                                            placeholder: (context, url) =>
                                                FadeCircleLoadingIndicator(),
                                            imageUrl: resolveImageUrl()!,
                                          ),
                                        ),
                                      )
                                    : image != null
                                    ? SizedBox(
                                        width: double.infinity,
                                        height: 182.h,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Image.file(
                                            image,
                                            fit: BoxFit.cover,
                                            width: double.infinity,
                                            height: double.infinity,
                                          ),
                                        ),
                                      )
                                    // image != null
                                    //     ? Align(
                                    //         alignment: Alignment.center,
                                    //         child: Image.file(image),
                                    //       )
                                    //     //? if there is a link image :
                                    //     : (imageUrl != null && imageUrl.isNotEmpty)
                                    //     ? CachedNetworkImage(imageUrl: imageUrl)
                                    : SizedBox.shrink()
                              //? In add event case :
                              : image != null
                              ? SizedBox(
                                  width: double.infinity,
                                  height: 182.h,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Image.file(
                                      image,
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height: double.infinity,
                                    ),
                                  ),
                                )
                              : SizedBox.shrink(),

                          18.verticalSpace,
                          Text(
                            // 'Hadeel',
                            name,
                            style: AppTextStyle.rubikMedium16.copyWith(
                              color: AppColors.black,
                            ),
                          ).onlyPadding(start: 18.w),

                          10.verticalSpace,
                          Text(
                            context.tr('weddingInvite'),
                            style: AppTextStyle.rubikRegular14.copyWith(
                              color: AppColors.black,
                            ),
                          ).onlyPadding(start: 18.w),

                          18.verticalSpace,

                          //? Buttons :
                          Row(
                            children: [
                              Spacer(),
                              CustomButtonWidget(
                                text: '',
                                backgroundColor: AppColors.white,
                                content: Text(
                                  context.tr('confirm'),
                                  style: AppTextStyle.rubikRegular18.copyWith(
                                    color: AppColors.black,
                                  ),
                                ),
                                boxDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0, 2),
                                      blurRadius: 4,
                                      color: AppColors.primary.withValues(
                                        alpha: .25,
                                      ),
                                    ),
                                  ],
                                ),
                                onTap: () {},
                                isFiled: true,
                                height: 44.h,
                                width: 138.w,
                              ),
                              Spacer(),
                              CustomButtonWidget(
                                text: '',
                                backgroundColor: AppColors.white,
                                content: Text(
                                  context.tr('declined'),
                                  style: AppTextStyle.rubikRegular18.copyWith(
                                    color: AppColors.black,
                                  ),
                                ),
                                boxDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: Offset(0, 2),
                                      blurRadius: 4,
                                      color: AppColors.primary.withValues(
                                        alpha: .25,
                                      ),
                                    ),
                                  ],
                                ),
                                onTap: () {},
                                isFiled: true,
                                height: 44.h,
                                width: 125.w,
                              ),

                              Spacer(),
                            ],
                          ),
                          18.verticalSpace,
                          CustomButtonWidget(
                            text: '',
                            backgroundColor: AppColors.white,
                            content: Text(
                              context.tr('eventLocation'),
                              style: AppTextStyle.rubikRegular18.copyWith(
                                color: AppColors.black,
                              ),
                            ),
                            boxDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 2),
                                  blurRadius: 4,
                                  color: AppColors.primary.withValues(
                                    alpha: .25,
                                  ),
                                ),
                              ],
                            ),
                            onTap: () {},
                            isFiled: true,
                            height: 44.h,
                            width: double.infinity,
                          ).symmetricPadding(horizontal: 22.w),
                          18.verticalSpace,
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // Spacer(),
              //? TODO :
              // if (image == null) 250.verticalSpace,
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AddEventPageBotton(
                      onTap: () {
                        id != null
                            //? Update case :
                            ? ref
                                  .read(updateEventControllerProvider.notifier)
                                  .updateEventToServer(id!)
                            //? Add case :
                            : ref
                                  .read(addEventControllerProvider.notifier)
                                  .createEvent();
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
                        context.push(Routes.qrScreen, extra: id);
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
              ),
              18.verticalSpace,
            ],
          ).symmetricPadding(horizontal: 18.w);
        },
      ),
    );
  }
}
