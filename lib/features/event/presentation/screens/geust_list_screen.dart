import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kroot_app/features/event/presentation/controller/add_event/add_event_controller.dart';
import 'package:kroot_app/features/event/presentation/controller/home_controller.dart';
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

    firstName = TextEditingController();
    lastName = TextEditingController();
    number = TextEditingController();
  }

  void _openSheetForSelectAdd(BuildContext context, String? id) {
    showModalBottomSheet(
      context: context,
      constraints: BoxConstraints(minWidth: double.infinity),
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
            ),
            Divider(color: AppColors.grayBorder),

            //? Add manually :
            ListTile(
              onTap: () {
                context.pop();
                _openSheetForAddManually(context);
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

            //? Invite someone :
            if (id == null)
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
            if (id == null) Divider(color: AppColors.grayBorder),
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
      phones:
          original.phones.map((p) => Phone(p.number, label: p.label)).toList(),
      emails:
          original.emails.map((e) => Email(e.address, label: e.label)).toList(),
    );
  }

  void _openSheetForAddManually(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      constraints: BoxConstraints(maxWidth: double.infinity),
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
          AppToast.doneToast('successfullyCompleted'.tr());
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
            ctx.pop();

            // AppToast.doneToast("successfullyCompleted".tr());
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

        //? This listener for add new contact :
        if (next.value?.isAddContact ?? false) {
          if (next is AsyncData) {
            AppToast.doneToast('successfullyCompleted'.tr());
          }

          if (next is AsyncError) {
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
            ctx.pop();
            AppToast.doneToast("successfullyCompleted".tr());
            context.go(
              Routes.eventDetails,
              extra: {'id': next.value!.updatedEvent?.occasionId},
            );
            ref.read(addEventControllerProvider.notifier).clearEventScreen();
          }

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

    final isChanged = ref.watch(
      updateEventControllerProvider.select((val) => val.value!.isChanged),
    );

    return Scaffold(
      appBar: CustomAppbar(
        title: context.tr('guestList'),
        actionButton: GestureDetector(
          onTap: () {
            _openSheetForSelectAdd(context, widget.id);
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
                child: items!.isEmpty
                    ?
                    //? Empty :
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 22.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              widget.id == null
                                  ? context.tr('emptyContacts1')
                                  : context.tr('emptyContacts1forUpdate'),
                              textAlign: TextAlign.center,
                              style: AppTextStyle.rubikRegular18.copyWith(
                                color: AppColors.black,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              spacing: 4,
                              children: [
                                Text(
                                  context.tr('emptyContacts2'),
                                  textAlign: TextAlign.center,
                                  style: AppTextStyle.rubikRegular18.copyWith(
                                    color: AppColors.black,
                                  ),
                                ),
                                // Assets.icons.addContactIc.svg(),
                                CircleAvatar(
                                  backgroundColor: AppColors.primary,
                                  child: Icon(
                                    Icons.add,
                                    color: AppColors.white,
                                  ),
                                ),
                                Text(
                                  context.tr('emptyContacts3'),
                                  textAlign: TextAlign.center,
                                  style: AppTextStyle.rubikRegular18.copyWith(
                                    color: AppColors.black,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              context.tr('emptyContacts4'),
                              textAlign: TextAlign.center,
                              style: AppTextStyle.rubikRegular18.copyWith(
                                color: AppColors.black,
                              ),
                            ),
                          ],
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
                                        updateEventControllerProvider.notifier,
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
                                        updateEventControllerProvider.notifier,
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
              if (widget.id != null && isChanged!)
                //? Update guest :
                CustomButtonWidget(
                  text: '',
                  onTap: () async {
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
