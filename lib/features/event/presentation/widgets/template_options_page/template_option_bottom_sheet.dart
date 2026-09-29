
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kroot_app/features/event/presentation/controller/add_event/add_event_controller.dart';
import 'package:kroot_app/features/event/presentation/controller/home_controller.dart';
import 'package:kroot_app/features/event/presentation/screens/templates_options_screen.dart';
import 'package:kroot_app/features/event/presentation/widgets/template_options_page/template_screen_bottom_sheet_item.dart';
import 'package:kroot_app/gen/assets.gen.dart';
import 'package:kroot_app/src/shared_widgets/custom_button_widget.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';

class TemplateOptionsBottomSheet extends ConsumerStatefulWidget {
  const TemplateOptionsBottomSheet({super.key});

  @override
  ConsumerState<TemplateOptionsBottomSheet> createState() =>
      _TemplateOptionsBottomSheetState();
}

class _TemplateOptionsBottomSheetState
    extends ConsumerState<TemplateOptionsBottomSheet> {
  late String selectedTemplate;

  @override
  void initState() {
    selectedTemplate = ref.read(
        addEventControllerProvider.select((val) => val.value!.templateMessage));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final templates = ref.read(homeControllerProvider
        .select((val) => val.value!.utilsResponse!.value!.templates ?? []));

    final currentTemplate = ref.watch(
        addEventControllerProvider.select((val) => val.value!.templateMessage));

    // selectedTemplate = currentTemplate;

    return Container(
      height: 600.h,
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(
        22.w,
        22.w,
        22.w,
        MediaQuery.of(context).viewInsets.bottom,
      ),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  context.tr('choose_invitation_message_description'),
                  style: AppTextStyle.rubikMedium16.copyWith(
                    color: AppColors.primary,
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    if (FocusManager.instance.primaryFocus != null) {
                      FocusManager.instance.primaryFocus!.unfocus();
                    }
                    context.pop();
                  },
                  child: Assets.icons.closeIc.svg(),
                ),
              ],
            ),
            16.verticalSpace,
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: templates.length,
                separatorBuilder: (context, index) => 12.verticalSpace,
                itemBuilder: (context, index) {
                  return TemplateScreenBottomSheetItem(
                    currentTemplate: selectedTemplate,
                    templateName: templates[index],
                    onChanged: (val) {
                      selectedTemplate = val ?? '';
                      setState(() {});
                    },
                  );
                },
              ),
            ),
            // TemplateScreenBottomSheetItem(),
            Consumer(
              builder: (context, ref, child) {
                return CustomButtonWidget(
                  text: '',
                  onTap: () {
                    ref
                        .read(addEventControllerProvider.notifier)
                        .changeTemplateMessage(
                          selectedTemplate,
                        );
                    // if (widget.id == null) {
                    //   if (FocusManager.instance.primaryFocus != null) {
                    //     FocusManager.instance.primaryFocus!.unfocus();
                    //   }
                    //   ref
                    //       .read(addEventControllerProvider.notifier)
                    //       .addNewContact(
                    //         firstName: firstName.text,
                    //         lastName: lastName.text,
                    //         phoneNumber: number.text,
                    //         code: code.text,
                    //       );
                    // } else {
                    //   ref
                    //       .read(updateEventControllerProvider.notifier)
                    //       .addNewContact(
                    //         firstName: firstName.text,
                    //         lastName: lastName.text,
                    //         phoneNumber: number.text,
                    //         code: code.text,
                    //       );
                    // }
                    context.pop();
                  },
                  isFiled: true,
                  boxDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary,
                        spreadRadius: 1,
                      ),
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
            20.verticalSpace,
          ],
        ),
      ),
    );
  }
}
