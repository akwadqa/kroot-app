import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kroot_app/features/event/presentation/controller/home_controller.dart';
import 'package:kroot_app/features/event/presentation/widgets/guest_list_page/add_guest_number_filed.dart';
import 'package:kroot_app/features/guests/presentation/controller/guests_controller.dart';
import 'package:kroot_app/gen/assets.gen.dart';
import 'package:kroot_app/src/shared_widgets/custom_button_widget.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';
import 'package:kroot_app/src/utils/app_alert.dart';
import 'package:kroot_app/src/utils/app_toast.dart';

class AddOperatorHandlerBotomSheet extends ConsumerStatefulWidget {
  const AddOperatorHandlerBotomSheet({
    required this.title,
    required this.onFinish,

    super.key,
  });
  final String title;
  final void Function(String number) onFinish;

  @override
  ConsumerState<AddOperatorHandlerBotomSheet> createState() =>
      _AddGuestManuallBotomSheetState();
}

class _AddGuestManuallBotomSheetState
    extends ConsumerState<AddOperatorHandlerBotomSheet> {
  late TextEditingController firstName, lastName, number;
  final _key = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    firstName = TextEditingController();
    lastName = TextEditingController();
    number = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      guestsControllerProvider.select((val) => val.value!.addGuestsResponse),
      (prev, next) {
        if (next is AsyncLoading) {
          AppAlert.showLoadingDialog(context);
        }

        if (next is AsyncData) {
          context.pop();
          context.pop();
          AppToast.doneToast("successfullyCompleted".tr());
        }
        if (next is AsyncError) {
          context.pop();
          AppToast.errorToast(next!.error!.toString());
        }
      },
    );

    return Container(
      padding: EdgeInsets.fromLTRB(
        22.w,
        22.w,
        22.w,
        MediaQuery.of(context).viewInsets.bottom + 20,
      ),
      child: Form(
        key: _key,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    widget.title,
                    style: AppTextStyle.rubikSemiBold20.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                  Spacer(),

                  GestureDetector(
                    onTap: () => context.pop(),
                    child: Assets.icons.closeIc.svg(),
                  ),
                ],
              ),
              33.verticalSpace,

              AddGuestNumberField(number),
              33.verticalSpace,

              Consumer(
                builder: (context, ref, child) {
                  final isLoading = ref.read(homeControllerProvider);
                  if (isLoading is AsyncLoading) {
                    return Center(child: MailPulseAnimation());
                  }
                  return CustomButtonWidget(
                    text: '',
                    onTap: () {
                      if (_key.currentState!.validate()) {
                        final userNumber = ref
                            .read(homeControllerProvider)
                            .value!
                            .utilsResponse!
                            .value!
                            .subscriber!
                            .mobile;
                        if (number.text.contains(userNumber!)) {
                          AppToast.errorToast('You can\'t add your number');
                        } else {
                          widget.onFinish(number.text);
                        }
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
            ],
          ),
        ),
      ),
    );
  }
}
