import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wedding_app/features/auth/presentation/widgets/create_account_page/create_account_field.dart';
import 'package:wedding_app/features/event/presentation/controller/add_event/add_event_controller.dart';
import 'package:wedding_app/features/event/presentation/controller/home_controller.dart';
import 'package:wedding_app/features/event/presentation/controller/update_event/update_event_controller.dart';
import 'package:wedding_app/features/event/presentation/widgets/create_event_page/add_event_page_botton.dart';
import 'package:wedding_app/features/event/presentation/widgets/guest_list_page/guest_list_item.dart';
import 'package:wedding_app/gen/assets.gen.dart';
import 'package:wedding_app/src/bottm_navigation_bar_provider.dart';
import 'package:wedding_app/src/extenssions/widget_extensions.dart';
import 'package:wedding_app/src/routing/routes.dart';
import 'package:wedding_app/src/shared_widgets/custom_appbar.dart';
import 'package:wedding_app/src/shared_widgets/custom_button_widget.dart';
import 'package:wedding_app/src/theme/app_colors.dart';
import 'package:wedding_app/src/theme/app_text_style.dart';
import 'package:wedding_app/src/utils/app_alert.dart';
import 'package:wedding_app/src/utils/app_toast.dart';

// class GeustListScreen extends StatelessWidget {
//   const GeustListScreen({super.key});

class GeustListScreen extends ConsumerStatefulWidget {
  const GeustListScreen({super.key, required this.id});
  final String? id;

  @override
  ConsumerState<GeustListScreen> createState() => _GeustListScreenState();
}

class _GeustListScreenState extends ConsumerState<GeustListScreen> {
  late TextEditingController firstName, lastName, number;
  final _key = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    Future(() {
      ref.read(addEventControllerProvider.notifier).getContacts(null);
    });

    firstName = TextEditingController();
    lastName = TextEditingController();
    number = TextEditingController();
  }

  _openBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => Container(
        height: 700.h,
        padding: EdgeInsets.all(22.w),
        child: Form(
          key: _key,
          child: Column(
            children: [
              Row(
                children: [
                  //? Title :
                  Text(
                    context.tr('addContact'),
                    style: AppTextStyle.rubikSemiBold20.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                  Spacer(),

                  //? Close button :
                  GestureDetector(
                    onTap: () => context.pop(),
                    child: Assets.icons.closeIc.svg(),
                  ),
                ],
              ),
              33.verticalSpace,

              //? First name :
              CreataAccountField(
                controller: firstName,
                hint: context.tr('enterAnyFirstName'),
                icon: Assets.icons.contactNameIc,
                label: context.tr('firstName'),
                isRequired: false,
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return context.tr('required');
                  }
                },
              ),
              20.verticalSpace,

              //? Last name :
              CreataAccountField(
                controller: lastName,
                hint: context.tr('enterAnyLastName'),
                icon: Assets.icons.contactNameIc,
                label: context.tr('lastName'),
                isRequired: false,
                validator: (val) {
                  //TODO
                  // if (val == null || val.isEmpty) {
                  //   return context.tr('required');
                  // }
                },
              ),
              20.verticalSpace,

              //? number :
              CreataAccountField(
                controller: number,
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return context.tr('required');
                  }
                },
                inputType: TextInputType.number,
                hint: context.tr('enterPhone'),
                icon: Assets.icons.contactNumberIc,
                label: context.tr('phone_number'),
                isRequired: false,
              ),
              150.verticalSpace,
              Consumer(
                builder: (context, ref, child) {
                  final isLoading = ref.read(homeControllerProvider);
                  if (isLoading is AsyncLoading) {
                    return Center(
                      child: Assets.images.animationLoading.image(
                        color: AppColors.primary,
                      ),
                    );
                  }
                  return CustomButtonWidget(
                    text: '',
                    onTap: () {
                      if (_key.currentState!.validate()) {
                        if (widget.id == null) {
                          ref
                              .read(addEventControllerProvider.notifier)
                              .addNewContact(
                                firstName: firstName.text,
                                lastName: lastName.text,
                                phoneNumber: number.text,
                              );
                        } else {
                          ref
                              .read(updateEventControllerProvider.notifier)
                              .addNewContact(
                                firstName: firstName.text,
                                lastName: lastName.text,
                                phoneNumber: number.text,
                              );
                        }
                        context.pop();
                      }
                    },
                    isFiled: true,
                    boxDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: [
                        BoxShadow(color: AppColors.primary, spreadRadius: 1),
                        BoxShadow(
                          color: AppColors.primary,
                          offset: Offset(0, 1),
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    height: 44.h,
                    width: double.infinity,
                    backgroundColor: AppColors.primary,
                    content: Text(
                      context.tr('add'),
                      style: AppTextStyle.rubikSemiBold18.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  );
                },
              ),

              //? Add button:
              31.verticalSpace,
              CustomButtonWidget(
                text: '',
                onTap: () {
                  context.pop();
                },
                isFiled: false,
                boxDecoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: .25),
                      blurRadius: 4,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10.r),
                ),
                height: 44.h,
                width: double.infinity,
                backgroundColor: AppColors.white,
                content: Text(
                  context.tr('cancel'),
                  style: AppTextStyle.rubikSemiBold18.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    late BuildContext ctx;

    if (widget.id == null) {
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

        //? This listener for add new contact :
        if (next.value?.isAddContact ?? false) {
          if (next is AsyncData) {
            // context.pop();
            AppToast.doneToast('Contact added!');
          }

          if (next is AsyncError) {
            // context.pop();
            AppToast.errorToast(next.error.toString());
          }
          firstName.clear();
          lastName.clear();
          number.clear();
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

            context.pushReplacement(
              Routes.eventDetails,
              // extra: widget.id != null
              //? next.value!.updatedEvent!.occasionId
              extra: next.value!.updatedEvent?.occasionId,
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

    final items = widget.id != null
        ? ref.watch(updateEventControllerProvider).value!.selectedContacts
        : ref.watch(addEventControllerProvider).value!.selectedContacts;
    return Scaffold(
      appBar: CustomAppbar(
        title: context.tr('guestList'),
        actionButton: GestureDetector(
          onTap: () {
            _openBottomSheet(context);
          },

          child: Assets.icons.addContactIc.svg(),
        ),
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
                    items!.isEmpty
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
                            id: widget.id,
                            contact: items[index],
                            decreament: () {
                              widget.id != null
                                  ? ref
                                        .read(
                                          updateEventControllerProvider
                                              .notifier,
                                        )
                                        .decrementCount(items[index])
                                  : ref
                                        .read(
                                          addEventControllerProvider.notifier,
                                        )
                                        .decrementCount(items[index]);
                            },
                            increament: () {
                              widget.id != null
                                  ? ref
                                        .read(
                                          updateEventControllerProvider
                                              .notifier,
                                        )
                                        .incrementCount(items[index])
                                  : ref
                                        .read(
                                          addEventControllerProvider.notifier,
                                        )
                                        .incrementCount(items[index]);
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
                        widget.id == null
                            ? ref
                                  .read(addEventControllerProvider.notifier)
                                  .createEvent()
                            : ref
                                  .read(updateEventControllerProvider.notifier)
                                  .updateEventToServer(widget.id!);
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
                      onTap: widget.id != null
                          ? ref
                                    .watch(updateEventControllerProvider)
                                    .value!
                                    .selectedContacts!
                                    .isEmpty
                                ? null
                                : () {
                                    context.push(
                                      Routes.inviteTemplate,
                                      extra: widget.id,
                                    );
                                  }
                          : ref
                                .watch(addEventControllerProvider)
                                .value!
                                .selectedContacts!
                                .isEmpty
                          ? null
                          : () {
                              context.push(Routes.inviteTemplate);
                            },
                      // onTap:
                      //     ref
                      //         .read(addEventControllerProvider)
                      //         .value!
                      //         .selectedContacts!
                      //         .isEmpty
                      //     ? null
                      //     : () {
                      //         context.push(
                      //           Routes.inviteTemplate,
                      //           extra: widget.id,
                      //         );
                      //       },
                      isSubmit: widget.id != null
                          ? ref
                                .read(updateEventControllerProvider)
                                .value!
                                .selectedContacts!
                                .isNotEmpty
                          : ref
                                .read(addEventControllerProvider)
                                .value!
                                .selectedContacts!
                                .isNotEmpty,

                      child: Text(
                        context.tr('continue'),
                        style: AppTextStyle.rubikSemiBold18.copyWith(
                          color: widget.id != null
                              ? ref
                                        .watch(updateEventControllerProvider)
                                        .value!
                                        .selectedContacts!
                                        .isEmpty
                                    ? AppColors.primary
                                    : AppColors.white
                              : ref
                                    .watch(addEventControllerProvider)
                                    .value!
                                    .selectedContacts!
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
