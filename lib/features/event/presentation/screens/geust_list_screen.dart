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
import 'package:wedding_app/features/guests/presentation/controller/guests_controller.dart';
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

  @override
  void initState() {
    super.initState();
    // Future(() {
    //   ref.read(addEventControllerProvider.notifier).getContacts(null);
    // });

    firstName = TextEditingController();
    lastName = TextEditingController();
    number = TextEditingController();
  }

  _openSheetForSelectAdd(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        width: double.infinity,
        height: 375.h,
        child: Column(
          children: [
            30.verticalSpace,

            //? Add from contacts :
            ListTile(
              onTap: () {
                context.push(Routes.addContact, extra: widget.id);
              },
              title: Text(
                context.tr('addFromContacts'),
                style: AppTextStyle.rubikMedium16.copyWith(
                  color: AppColors.primary,
                ),
              ),
              leading: Assets.icons.addFromContactIc.svg(),
              trailing: GestureDetector(
                onTap: () => context.pop(),
                child: Assets.icons.closeIc.svg(),
              ),
            ),
            Divider(color: AppColors.lightGray02),

            //? Add manually :
            ListTile(
              onTap: () {
                context.pop();
                _openSheetForAddMan(context);
              },
              title: Text(
                context.tr('addManually'),
                style: AppTextStyle.rubikMedium16.copyWith(
                  color: AppColors.primary,
                ),
              ),
              leading: Assets.icons.addManuallyIc.svg(),
            ),
            Divider(color: AppColors.grayBorder),

            //? Add from csv :
            ListTile(
              onTap: () {
                if (widget.id == null) {
                  ref
                      .read(addEventControllerProvider.notifier)
                      .importGuestsFromFile();
                } else {
                  ref
                      .read(updateEventControllerProvider.notifier)
                      .importGuestsFromFile();
                }
              },
              title: Text(
                context.tr('importCSVGuestList'),
                style: AppTextStyle.rubikMedium16.copyWith(
                  color: AppColors.primary,
                ),
              ),
              leading: Assets.icons.importCsvFileIc.svg(),
            ),
            Divider(color: AppColors.grayBorder),

            //? Invite someone :
            ListTile(
              onTap: () {},
              title: Text(
                context.tr('inviteSomeoneToManageGuests'),
                style: AppTextStyle.rubikMedium16.copyWith(
                  color: AppColors.primary,
                ),
              ),
              leading: Assets.icons.invieToManageGuestsIc.svg(),
            ),
            Divider(color: AppColors.grayBorder),
          ],
        ),
      ),
    );
  }

  _openSheetForAddMan(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => AddContactManuallBottomSheet(
        firstName: firstName,
        lastName: lastName,
        number: number,
        id: widget.id,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    late BuildContext ctx;

    ref.listen(
      guestsControllerProvider.select(
        (val) => val.value!.updateGuestListRespone,
      ),
      (prev, next) {
        if (next is AsyncLoading) {
          AppAlert.showLoadingDialog(context);
        }

        if (next is AsyncData) {
          context.pop();
          context.pop();
          AppToast.doneToast('Your guests updated');
        }
        if (next is AsyncError) {
          context.pop();
          AppToast.errorToast(next!.error.toString());
        }
      },
    );

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

            context.go(
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

            context.go(
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

    final items = ref
        .watch(updateEventControllerProvider)
        .value!
        .selectedContacts;

    // final items = widget.id != null
    //     ? ref.watch(updateEventControllerProvider).value!.selectedContacts
    //     : ref.watch(addEventControllerProvider).value!.selectedContacts;
    return Scaffold(
      appBar: CustomAppbar(
        title: context.tr('guestList'),
        actionButton: GestureDetector(
          onTap: () {
            // _openSheetForAddMan(context);
            _openSheetForSelectAdd(context);
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

              //? This for update Guest List :
              if (widget.id != null)
                //? Confirm event :
                CustomButtonWidget(
                  text: '',
                  onTap: () async {
                    // context.push(Routes.eventGuestList);
                    ref
                        .read(guestsControllerProvider.notifier)
                        .updateGuestList(occasionId: widget.id!);
                  },
                  isFiled: true,
                  content: Text(
                    context.tr('editGuestList'),
                    style: AppTextStyle.nunitoBold16.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  height: 44.h,
                  width: 330.w,
                  backgroundColor: AppColors.primary,
                ).symmetricPadding(horizontal: 22.w),

              //? This for save draft and continue :
              if (widget.id == null)
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
                                    .read(
                                      updateEventControllerProvider.notifier,
                                    )
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

class AddContactManuallBottomSheet extends StatelessWidget {
  const AddContactManuallBottomSheet({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.number,
    required this.id,
  });

  final TextEditingController firstName;
  final TextEditingController lastName;
  final TextEditingController number;
  final String? id;

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _key = GlobalKey<FormState>();
    return Container(
      height: 700.h,
      padding: EdgeInsets.all(22.w),
      child: Form(
        key: _key,
        child: SingleChildScrollView(
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
              AppTextFormField(
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
              AppTextFormField(
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
              AppTextFormField(
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
                        if (id == null) {
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
}
