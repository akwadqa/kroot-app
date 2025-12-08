import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kroot_app/features/event/presentation/controller/home_state.dart';
import 'package:kroot_app/features/event/presentation/controller/home_ui_controller.dart';
import 'package:kroot_app/features/event/presentation/widgets/guest_list_page/edit_guest_bottom_sheet.dart';
import 'package:kroot_app/features/event/presentation/widgets/guest_list_page/edit_guest_name_bottom_sheet.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';

class GuestListItem extends StatelessWidget {
  final SelectedContact contact;
  final String? id;
  const GuestListItem({
    super.key,
    required this.contact,
    required this.id,
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
                  EditGuestBottomSheet(contact: contact, id: id),
                  EditGuestNameBottomSheet(contact: contact, id: id),
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
        '${contact.contact.name.first} ${contact.contact.name.last}',
        style: AppTextStyle.rubikRegular16.copyWith(color: AppColors.black),
      ),
      subtitle: Directionality(
        textDirection: ui.TextDirection.ltr,
        child: Align(
          alignment: context.locale.languageCode == 'ar'
              ? Alignment.centerRight
              : Alignment.centerLeft,
          child: Text(
            // contact.contact.phones.first.number,
            contact.contact.phones.isNotEmpty
                ? contact.contact.phones.first.number
                : context.tr('no_phone'),
            style: AppTextStyle.rubikRegular16.copyWith(color: AppColors.black),
          ),
        ),
      ),
      trailing: SizedBox(
        width: 100.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TextButton(
                onPressed: increament,
                child: Text(
                  '+',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.rubikRegular16.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),
            Text(
              contact.count.toString(),
              style: AppTextStyle.rubikRegular16.copyWith(
                color: AppColors.primary,
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: decreament,
                child: Text(
                  '-',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.rubikRegular16.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
