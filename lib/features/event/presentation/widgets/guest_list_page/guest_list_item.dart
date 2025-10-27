import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:wedding_app/features/auth/presentation/widgets/create_account_page/create_account_field.dart';
import 'package:wedding_app/features/event/presentation/controller/home_controller.dart';
import 'package:wedding_app/features/event/presentation/controller/home_state.dart';
import 'package:wedding_app/features/event/presentation/controller/home_ui_controller.dart';
import 'package:wedding_app/features/event/presentation/widgets/guest_list_page/edit_guest_bottom_sheet.dart';
import 'package:wedding_app/features/event/presentation/widgets/guest_list_page/edit_guest_name_bottom_sheet.dart';
import 'package:wedding_app/gen/assets.gen.dart';
import 'package:wedding_app/src/shared_widgets/custom_button_widget.dart';
import 'package:wedding_app/src/theme/app_colors.dart';
import 'package:wedding_app/src/theme/app_text_style.dart';

class GuestListItem extends StatelessWidget {
  final SelectedContact contact;
  const GuestListItem({
    super.key,
    required this.contact,
    required this.increament,
    required this.decreament,
  });
  final void Function() increament;
  final void Function() decreament;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => Consumer(
              builder: (context, ref, child) {
                List<Widget> pages = [
                  EditGuestBottomSheet(contact: contact),
                  EditGuestNameBottomSheet(contact: contact),
                ];
                final index = ref
                    .watch(homeUiControllerProvider)
                    .bottomSheetIndex;
                return pages[index!];
              },
            ),
          );
        },
        icon: Icon(Icons.more_vert),
      ),
      title: Text(
        contact.contact.displayName,
        style: AppTextStyle.rubikRegular16.copyWith(color: AppColors.black),
      ),
      subtitle: Directionality(
        textDirection: ui.TextDirection.ltr,
        child: Align(
          alignment: context.locale.languageCode == 'ar'
              ? Alignment.centerRight
              : Alignment.centerLeft,
          child: Text(
            contact.contact.phones.first.number,
            style: AppTextStyle.rubikRegular16.copyWith(color: AppColors.black),
          ),
        ),
      ),
      trailing: SizedBox(
        width: 60.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: increament,
              child: Text(
                '+',
                style: AppTextStyle.rubikRegular16.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ),
            Text(
              contact.count.toString(),
              style: AppTextStyle.rubikRegular16.copyWith(
                color: AppColors.primary,
              ),
            ),
            GestureDetector(
              onTap: decreament,
              child: Text(
                '-',
                style: AppTextStyle.rubikRegular16.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
