import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:queen_validators/queen_validators.dart';
import 'package:kroot_app/src/theme/app_colors.dart';


class EmailTextFormField extends StatelessWidget {
  const EmailTextFormField({super.key, this.onSaved, this.controller});
  final void Function(String?)? onSaved;
    final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyle(color: AppColors.gray),
      
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person_outline_sharp),
        hintText: context.tr('email'),
        hintStyle: Theme.of(context)
            .textTheme
            .labelSmall!
            .copyWith(fontSize: 14, color: AppColors.grey600),
      ),
      textInputAction: TextInputAction.next,
      validator: qValidator([
        IsRequired(context.tr('required')),
        IsEmail(context.tr('emailValidatorMessage'))
      ]),
      keyboardType: TextInputType.emailAddress,
      onSaved: onSaved,
    );
  }
}
