import 'dart:ui' as ui;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:kroot_app/features/event/presentation/controller/home_state.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';

class AddContactScreenTile extends StatelessWidget {
  const AddContactScreenTile({
    super.key,
    required this.contact,
    required this.selectedContacts,
    required this.onChange,
  });
  final Contact contact;
  final List<SelectedContact> selectedContacts;
  final void Function(bool?) onChange;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        contact.displayName,
        style: AppTextStyle.rubikRegular16.copyWith(color: AppColors.black),
      ),
      subtitle: Directionality(
        textDirection: ui.TextDirection.ltr,
        child: Align(
          alignment: context.locale.languageCode == 'ar'
              ? Alignment.centerRight
              : Alignment.centerLeft,
          child: Text(
            // contact.phones.first.number,
            contact.phones.isNotEmpty
                ? contact.phones.first.number
                : context.tr('no_phone'),
            style: AppTextStyle.rubikRegular16.copyWith(color: AppColors.black),
          ),
        ),
      ),
      trailing: Checkbox(
        fillColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.selected)) {
            return AppColors.primary;
          }
          return AppColors.white;
        }),
        value: selectedContacts.any((c) {
          final cNum = c.contact.phones.isNotEmpty
              ? c.contact.phones.first.number
              : '';
          final tNum = contact.phones.isNotEmpty
              ? contact.phones.first.number
              : '';

          return normalize(cNum) == normalize(tNum);
        }),
        // value: selectedContacts.any((c) => c.contact.id == contact.id),
        onChanged: (val) {
          onChange(val);
        },
      ),
    );
  }

  String normalize(String s) {
    return s.replaceAll(RegExp(r'\D+'), ''); // يحذف كل شيء غير الأرقام
  }
}
