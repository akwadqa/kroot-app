import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kroot_app/features/auth/presentation/widgets/create_account_page/create_account_field.dart';
import 'package:kroot_app/features/event/data/models/create_event_request/create_event_request.dart';
import 'package:kroot_app/features/event/data/models/get_user_events/get_user_events_model.dart';
import 'package:kroot_app/features/event/presentation/controller/add_event/add_event_controller.dart';
import 'package:kroot_app/features/event/presentation/controller/add_event/add_event_state.dart';
import 'package:kroot_app/features/event/presentation/controller/home_controller.dart';
import 'package:kroot_app/features/event/presentation/controller/home_state.dart';
import 'package:kroot_app/features/event/presentation/controller/update_event/update_event_controller.dart';
import 'package:kroot_app/features/event/presentation/widgets/add_contact_page/add_contact_page_tile.dart';
import 'package:kroot_app/features/event/presentation/widgets/create_event_page/add_event_page_botton.dart';
import 'package:kroot_app/features/event/presentation/widgets/home_page/home_page_search_field.dart';
import 'package:kroot_app/gen/assets.gen.dart';
import 'package:kroot_app/src/bottm_navigation_bar_provider.dart';
import 'package:kroot_app/src/extenssions/widget_extensions.dart';
import 'package:kroot_app/src/routing/routes.dart';
import 'package:kroot_app/src/shared_widgets/custom_appbar.dart';
import 'package:kroot_app/src/shared_widgets/custom_button_widget.dart';
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

      // if (next.value?.isGetContacts == null) {
      //   //? Loading :
      //   if (next is AsyncLoading && (next.value?.isGetContacts == false)) {
      //     AppAlert.showLoadingDialog(ctx);
      //   }

      //   //? Loaded and the last will be loading - not error :
      //   if (next is AsyncData && prev is AsyncLoading) {
      //     //? Close the loading
      //     ctx.pop();

      //     //? Go to home
      //     // context.pushReplacement(Routes.main);
      //     context.pushReplacement(
      //       Routes.eventDetails,
      //       extra: next.value!.createEventResponse?.eventId,
      //     );

      //     //? Change the tab
      //     // ref.read(bottomNavIndexProvider.notifier).setIndex(0);

      //     //? Cleare event details in create event screen
      //     ref.read(addEventControllerProvider.notifier).clearEventScreen();

      //     //? Show message :
      //     AppToast.doneToast('Contact added!');
      //   }

      //   //? Error :
      //   if (next is AsyncError) {
      //     ctx.pop();
      //     // ScaffoldMessenger.of(context).clearSnackBars();
      //     AppToast.errorToast(next.error.toString());
      //   }
      // }
    });
    // ref.listen(homeControllerProvider, (prev, next) {
    //   //? This listener for create event from this screen :

    // });

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
              //? Search field
              HomePageSearchField(
                onSubmit: (val) {
                  ref
                      .read(addEventControllerProvider.notifier)
                      .getContacts(val);
                },
                hint: context.tr('searchContactHere'),
              ).symmetricPadding(horizontal: 22.w, vertical: 20.h),

              //? Contacts :
              Expanded(
                child: controller.when(
                  data: (data) {
                    if (data.contacts.isEmpty) {
                      //? Empty :
                      return Center(
                        child: Text(
                          context.tr('emptyContacts'),
                          style: AppTextStyle.rubikRegular16.copyWith(
                            color: AppColors.black,
                          ),
                        ),
                      );
                    }

                    //? Data :
                    return _buildList(data.contacts);
                  },

                  error: (e, st) {
                    final state = ref.watch(addEventControllerProvider);
                    //? Error
                    if (state.value!.contacts.isEmpty)
                      return Center(
                        child: Text(
                          context.tr('error_title'),
                          style: AppTextStyle.rubikRegular16.copyWith(
                            color: AppColors.black,
                          ),
                        ),
                      );
                    return _buildList(state.value!.contacts);
                  },
                  loading: () {
                    final state = ref.watch(addEventControllerProvider);
                    if (state.value!.contacts.isEmpty)
                      return Center(
                        child: Assets.images.animationLoading.image(),
                      );
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
