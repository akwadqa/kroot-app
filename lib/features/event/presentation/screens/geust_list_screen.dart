import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kroot_app/features/auth/presentation/widgets/create_account_page/create_account_field.dart';
import 'package:kroot_app/features/event/presentation/controller/add_event/add_event_controller.dart';
import 'package:kroot_app/features/event/presentation/controller/home_controller.dart';
import 'package:kroot_app/features/event/presentation/controller/home_state.dart';
import 'package:kroot_app/features/event/presentation/controller/update_event/update_event_controller.dart';
import 'package:kroot_app/features/event/presentation/widgets/create_event_page/add_event_page_botton.dart';
import 'package:kroot_app/features/event/presentation/widgets/guest_list_page/add_contact_manuall_bottom_sheet.dart';
import 'package:kroot_app/features/event/presentation/widgets/guest_list_page/guest_list_item.dart';
import 'package:kroot_app/features/guests/presentation/controller/guests_controller.dart';
import 'package:kroot_app/gen/assets.gen.dart';
import 'package:kroot_app/src/extenssions/widget_extensions.dart';
import 'package:kroot_app/src/routing/routes.dart';
import 'package:kroot_app/src/shared_widgets/custom_appbar.dart';
import 'package:kroot_app/src/shared_widgets/custom_button_widget.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';
import 'package:kroot_app/src/utils/app_alert.dart';
import 'package:kroot_app/src/utils/app_toast.dart';

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

  void _openSheetForSelectAdd(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SizedBox(
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
              // trailing: GestureDetector(
              //   onTap: () => context.pop(),
              //   child: Assets.icons.closeIc.svg(),
              // ),
            ),
            Divider(color: AppColors.grayBorder),

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
            // ListTile(
            //   onTap: () {
            //     if (widget.id == null) {
            //       ref
            //           .read(addEventControllerProvider.notifier)
            //           .importGuestsFromFile();
            //     } else {
            //       ref
            //           .read(updateEventControllerProvider.notifier)
            //           .importGuestsFromFile();
            //     }
            //   },
            //   title: Text(
            //     context.tr('importCSVGuestList'),
            //     style: AppTextStyle.rubikMedium16.copyWith(
            //       color: AppColors.primary,
            //     ),
            //   ),
            //   leading: Assets.icons.importCsvFileIc.svg(),
            // ),
            // Divider(color: AppColors.grayBorder),

            //? Invite someone :
            ListTile(
              onTap: () {
                context.push(Routes.manageAccess);
              },
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

  Contact deepCopyContact(Contact original) {
    return Contact(
      id: original.id,
      displayName: original.displayName,
      name: original.name,
      phones: original.phones
          .map((p) => Phone(p.number, label: p.label))
          .toList(),
      emails: original.emails
          .map((e) => Email(e.address, label: e.label))
          .toList(),
    );
  }

  void _openSheetForAddMan(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => AddContactManuallBottomSheet(id: widget.id),
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
          ref.read(homeControllerProvider.notifier).getEventDetails(widget.id!);
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

            AppToast.doneToast("successfullyCompleted".tr());

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
            AppToast.doneToast("successfullyCompleted".tr());

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

    final items = widget.id != null
        ? ref.watch(updateEventControllerProvider).value!.selectedContacts
        : ref.watch(addEventControllerProvider).value!.selectedContacts;

    // final newItems = items?.map((contact) {
    //   //? if number start with + or has code it owns :
    //   if (contact.contact.phones.first.number.contains('+') ||
    //       contact.contact.phones.first.number.length > 11) {
    //     final newContact = SelectedContact(
    //       contact: Contact(
    //         name: contact.contact.name,
    //         phones: [Phone(contact.contact.phones.first.number.substring(4))],
    //       ),
    //       code: contact.code,
    //       id: contact.id,
    //     );
    //     return newContact;
    //   } else {
    //     final newContact = SelectedContact(
    //       contact: Contact(
    //         name: contact.contact.name,
    //         phones: [Phone(contact.contact.phones.first.number.substring(1))],
    //       ),
    //       code: contact.code,
    //       id: contact.id,
    //     );
    //     return newContact;
    //   }
    // }).toList();
    // final newItems = items?.map((contact) {
    //   final copied = deepCopySelected(contact);

    //   final number = copied.contact.phones.first.number;

    //   String normalized;
    //   if (number.startsWith('+') || number.length > 11) {
    //     normalized = number.substring(4); // مثال فقط كما كنت تفعل
    //   } else {
    //     normalized = number.substring(1);
    //   }

    //   copied.contact.phones = [Phone(normalized)];

    //   return SelectedContact(
    //     contact: copied.contact,
    //     code: copied.code,
    //     id: copied.id,
    //     count: copied.count,
    //   );
    // }).toList();

    return Scaffold(
      appBar: CustomAppbar(
        title: context.tr('guestList'),
        actionButton: GestureDetector(
          onTap: () {
            // _openSheetForAddMan(context);
            _openSheetForSelectAdd(context);
          },

          child: Assets.icons.addContactIc.svg(width: 30.w),
        ),
      ),

      body: Builder(
        builder: (context) {
          ctx = context;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              20.verticalSpace,
              if (items?.isNotEmpty ?? false)
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
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 22.w),
                          child: Text(
                            context.tr('emptyContacts'),
                            textAlign: TextAlign.center,
                            style: AppTextStyle.rubikRegular16.copyWith(
                              color: AppColors.black,
                            ),
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
                //? Update guest :
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
                    context.tr("done".tr()),
                    style: AppTextStyle.nunitoBold16.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  height: 60.h,
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
