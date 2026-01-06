import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kroot_app/features/event/data/models/get_user_events/get_user_events_model.dart';
import 'package:kroot_app/features/event/presentation/controller/add_event/add_event_controller.dart';
import 'package:kroot_app/features/event/presentation/controller/add_event/add_event_state.dart';
import 'package:kroot_app/features/event/presentation/controller/home_controller.dart';
import 'package:kroot_app/features/event/presentation/controller/update_event/update_event_controller.dart';
import 'package:kroot_app/features/event/presentation/widgets/add_contact_page/add_contact_page_tile.dart';
import 'package:kroot_app/features/event/presentation/widgets/home_page/home_page_search_field.dart';
import 'package:kroot_app/src/extenssions/widget_extensions.dart';
import 'package:kroot_app/src/routing/routes.dart';
import 'package:kroot_app/src/shared_widgets/app_error_widget.dart';
import 'package:kroot_app/src/shared_widgets/custom_appbar.dart';
import 'package:kroot_app/src/shared_widgets/custom_button_widget.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';
import 'package:kroot_app/src/utils/app_alert.dart';
import 'package:kroot_app/src/utils/app_toast.dart';

class AddContactScreen extends ConsumerStatefulWidget {
  const AddContactScreen({super.key, required this.id});
  final String? id;

  @override
  ConsumerState<AddContactScreen> createState() => _AddContactScreenState();
}

class _AddContactScreenState extends ConsumerState<AddContactScreen> {
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

                    return _buildList(data);
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
                    return _buildList(state.value!);
                  },
                  loading: () {
                    final state = ref.watch(addEventControllerProvider);
                    if (state.value!.contacts.isEmpty) {
                      return Center(child: MailPulseAnimation());
                    }
                    return _buildList(state.value!);
                  },
                ),
              ),
              CustomButtonWidget(
                text: '',
                onTap: () {
                  context.pop();
                },
                isFiled: true,
                content: Text(
                  context.tr('confirm'),
                  style: AppTextStyle.nunitoBold16.copyWith(
                    color: AppColors.white,
                  ),
                ),
                height: 44.h,
                width: 330.w,
                backgroundColor: AppColors.primary,
              ).symmetricPadding(horizontal: 22.w),

              20.verticalSpace,
            ],
          );
        },
      ),
    );
  }

  Widget _buildList(AddEventState data) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 7.w),
      itemBuilder: (context, index) {
        return AddContactScreenTile(
          contact: data.contacts[index],
          selectedContacts: widget.id == null
              ? ref.watch(addEventControllerProvider).value!.selectedContacts!
              : ref
                    .watch(updateEventControllerProvider)
                    .value!
                    .selectedContacts!,
          onChange: (val) {
            widget.id == null
                ? (ref.read(addEventControllerProvider.notifier)
                    ..selectContact(data.contacts[index])
                    ..updateEvent(EventModel()))
                : (ref.read(updateEventControllerProvider.notifier)
                    ..selectContactForUpdatedEvent(data.contacts[index])
                    ..updateDataForEvent(EventModel(), widget.id!));
          },
        );
      },
      separatorBuilder: (context, index) {
        return Divider(color: AppColors.grayBorder);
      },
      itemCount: data.contacts.length,
    );
  }
}
