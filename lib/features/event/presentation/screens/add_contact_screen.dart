import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wedding_app/features/auth/presentation/widgets/create_account_page/create_account_field.dart';
import 'package:wedding_app/features/event/data/models/create_event_request/create_event_request.dart';
import 'package:wedding_app/features/event/presentation/controller/home_controller.dart';
import 'package:wedding_app/features/event/presentation/controller/home_state.dart';
import 'package:wedding_app/features/event/presentation/widgets/add_contact_page/add_contact_page_tile.dart';
import 'package:wedding_app/features/event/presentation/widgets/create_event_page/add_event_page_botton.dart';
import 'package:wedding_app/features/event/presentation/widgets/home_page/home_page_search_field.dart';
import 'package:wedding_app/gen/assets.gen.dart';
import 'package:wedding_app/src/bottm_navigation_bar_provider.dart';
import 'package:wedding_app/src/extenssions/widget_extensions.dart';
import 'package:wedding_app/src/routing/routes.dart';
import 'package:wedding_app/src/shared_widgets/custom_appbar.dart';
import 'package:wedding_app/src/shared_widgets/custom_button_widget.dart';
import 'package:wedding_app/src/theme/app_colors.dart';
import 'package:wedding_app/src/theme/app_text_style.dart';
import 'package:wedding_app/src/utils/app_alert.dart';

class AddContactScreen extends ConsumerStatefulWidget {
  const AddContactScreen({super.key});

  @override
  ConsumerState<AddContactScreen> createState() => _AddContactScreenState();
}

class _AddContactScreenState extends ConsumerState<AddContactScreen> {
  late TextEditingController name, number;
  final _key = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    Future(() {
      ref.read(homeControllerProvider.notifier).getContacts(null);
    });

    name = TextEditingController();
    number = TextEditingController();
  }

  _openBottomSheet() {
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

              //? name :
              CreataAccountField(
                controller: name,
                hint: context.tr('enterName'),
                icon: Assets.icons.contactNameIc,
                label: context.tr('name'),
                isRequired: false,
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return context.tr('required');
                  }
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
              200.verticalSpace,
              Consumer(
                builder: (context, ref, child) {
                  final isLoading = ref.read(homeControllerProvider);
                  if (isLoading is AsyncLoading)
                    return Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    );
                  return CustomButtonWidget(
                    text: '',
                    onTap: () {
                      if (_key.currentState!.validate()) {
                        ref
                            .read(homeControllerProvider.notifier)
                            .addNewContact(
                              name: name.text,
                              phoneNumber: number.text,
                            );
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
    final controller = ref.watch(homeControllerProvider);
    late BuildContext ctx;
    ref.listen(homeControllerProvider, (prev, next) {
      //? This listener for create event from this screen :
      if (next.value?.isCreatingEvent != null) {
        //? Loading :
        if (next is AsyncLoading) {
          AppAlert.showLoadingDialog(ctx);
        }

        //? Loaded and the last will be loading - not error :
        if (next is AsyncData && prev is AsyncLoading) {
          //? Close the loading
          ctx.pop();

          //? Go to home
          context.pushReplacement(Routes.main);

          //? Change the tab
          ref.read(bottomNavIndexProvider.notifier).setIndex(0);

          //? Cleare event details in create event screen
          ref.read(homeControllerProvider.notifier).clearEventScreen();

          //? Show message :
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('content added')));
        }

        //? Error :
        if (next is AsyncError) {
          ctx.pop();
          // ScaffoldMessenger.of(context).clearSnackBars();
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(next.error.toString())));
        }
      }

      //? This listener for add new contact :
      if (next.value?.isAddContact ?? false) {
        if (next is AsyncData) {
          context.pop();
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('content added')));
        }

        if (next is AsyncError) {
          context.pop();
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('error')));
        }
      }

      name.clear();
      number.clear();
    });

    return Scaffold(
      appBar: CustomAppbar(
        title: context.tr('selectContacts'),
        withBackButton: true,
        actionButton: GestureDetector(
          onTap: _openBottomSheet,

          child: Assets.icons.addContactIc.svg(),
        ),
      ),
      body: Builder(
        builder: (context) {
          ctx = context;
          return Column(
            children: [
              //? Search field
              HomePageSearchField(
                onSubmit: (val) {
                  ref.read(homeControllerProvider.notifier).getContacts(val);
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
                    return _buildList(data);
                  },

                  error: (e, st) {
                    final state = ref.watch(homeControllerProvider);
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
                    return _buildList(state.value!);
                  },
                  loading: () {
                    final state = ref.watch(homeControllerProvider);
                    if (state.value!.contacts.isEmpty)
                      return Center(child: CircularProgressIndicator());
                    return _buildList(state.value!);
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
                              .read(homeControllerProvider.notifier)
                              .createEvent();
                        },
                        isSubmit: false,
                        child:
                            (ref
                                    .watch(homeControllerProvider)
                                    .value!
                                    .isCreatingEvent ??
                                false)
                            ? CircularProgressIndicator()
                            : Text(
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
                            .read(homeControllerProvider)
                            .value!
                            .selectedContacts
                            .isEmpty
                        ? null
                        : () {
                            context.push(Routes.guestList);
                          },
                    isSubmit: ref
                        .read(homeControllerProvider)
                        .value!
                        .selectedContacts
                        .isNotEmpty,
                    child: Text(
                      context.tr('continue'),
                      style: AppTextStyle.rubikSemiBold18.copyWith(
                        color:
                            ref
                                .read(homeControllerProvider)
                                .value!
                                .selectedContacts
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

  Widget _buildList(HomeState data) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 7.w),
      itemBuilder: (context, index) {
        return AddContactScreenTile(
          contact: data.contacts[index],

          selectedContacts: ref
              .read(homeControllerProvider)
              .value!
              .selectedContacts,
          onChange: (val) {
            ref.read(homeControllerProvider.notifier)
              ..selectContact(data.contacts[index])
              ..updateEvent(CreateEventRequest());
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
