import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kroot_app/features/event/data/models/get_user_events/get_user_events_model.dart';
import 'package:kroot_app/features/event/presentation/controller/add_event/add_event_controller.dart';
import 'package:kroot_app/features/event/presentation/controller/home_controller.dart';
import 'package:kroot_app/features/event/presentation/controller/update_event/update_event_controller.dart';
import 'package:kroot_app/features/event/presentation/widgets/add_contact_page/add_contact_page_tile.dart';
import 'package:kroot_app/features/event/presentation/widgets/create_event_page/add_event_page_botton.dart';
import 'package:kroot_app/features/event/presentation/widgets/home_page/home_page_search_field.dart';
import 'package:kroot_app/src/extenssions/widget_extensions.dart';
import 'package:kroot_app/src/routing/routes.dart';
import 'package:kroot_app/src/shared_widgets/app_error_widget.dart';
import 'package:kroot_app/src/shared_widgets/custom_appbar.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';
import 'package:kroot_app/src/utils/app_alert.dart';
import 'package:kroot_app/src/utils/app_toast.dart';

class UpdateContactScreen extends ConsumerStatefulWidget {
  const UpdateContactScreen({super.key, required this.id});
  final String? id;

  @override
  ConsumerState<UpdateContactScreen> createState() =>
      _UpdateContactScreenState();
}

class _UpdateContactScreenState extends ConsumerState<UpdateContactScreen> {
  @override
  void initState() {
    super.initState();
    Future(() {
      ref.read(addEventControllerProvider.notifier).getContacts(null);
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(addEventControllerProvider);
    late BuildContext ctx;

    ref.listen(updateEventControllerProvider, (prev, next) {
      if (next.value!.isUpdateEvent != null) {
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

            extra: next.value!.createEventResponse?.eventId,
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
        title: context.tr('selectContacts'),
        withBackButton: true,
      ),
      body: Builder(
        builder: (context) {
          ctx = context;
          return Column(
            children: [
              HomePageSearchField(
                onSubmit: (val) {
                  ref
                      .read(addEventControllerProvider.notifier)
                      .getContacts(val);
                },
                hint: context.tr('searchContactHere'),
              ).symmetricPadding(horizontal: 22.w, vertical: 20.h),

              Expanded(
                child: controller.when(
                  data: (data) {
                    if (data.contacts.isEmpty) {
                      return Center(
                        child: Text(
                          context.tr('emptyContacts'),
                          style: AppTextStyle.rubikRegular16.copyWith(
                            color: AppColors.black,
                          ),
                        ),
                      );
                    }

                    return _buildList(data.contacts);
                  },

                  error: (e, st) {
                    final state = ref.watch(addEventControllerProvider);

                    if (state.value!.contacts.isEmpty) {
                      return AppErrorWidget(
                        onTap: () {
                          ref
                              .read(addEventControllerProvider.notifier)
                              .getContacts(null);
                        },
                      );
                    }

                    return _buildList(state.value!.contacts);
                  },
                  loading: () {
                    final state = ref.watch(addEventControllerProvider);
                    if (state.value!.contacts.isEmpty) {
                      return Center(child: MailPulseAnimation());
                    }
                    return _buildList(state.value!.contacts);
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Consumer(
                    builder: (context, ref, child) {
                      return AddEventPageBotton(
                        onTap: () {
                          ref
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
                      );
                    },
                  ),

                  AddEventPageBotton(
                    onTap:
                        ref
                            .read(updateEventControllerProvider)
                            .value!
                            .selectedContacts!
                            .isEmpty
                        ? null
                        : () {
                            context.push(Routes.guestList, extra: widget.id);
                          },
                    isSubmit: ref
                        .read(updateEventControllerProvider)
                        .value!
                        .selectedContacts!
                        .isNotEmpty,
                    child: Text(
                      context.tr('continue'),
                      style: AppTextStyle.rubikSemiBold18.copyWith(
                        color:
                            ref
                                .read(updateEventControllerProvider)
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
              20.verticalSpace,
            ],
          );
        },
      ),
    );
  }

  Widget _buildList(List<Contact> contacts) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 7.w),
      itemBuilder: (context, index) {
        return AddContactScreenTile(
          contact: contacts[index],

          selectedContacts: ref
              .watch(updateEventControllerProvider)
              .value!
              .selectedContacts!,
          onChange: (val) {
            ref.read(updateEventControllerProvider.notifier)
              ..selectContactForUpdatedEvent(contacts[index])
              ..updateDataForEvent(EventModel(), widget.id!);
          },
        );
      },
      separatorBuilder: (context, index) {
        return Divider(color: AppColors.grayBorder);
      },
      itemCount: contacts.length,
    );
  }
}
