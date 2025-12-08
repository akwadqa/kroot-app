import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kroot_app/gen/assets.gen.dart';
import 'package:kroot_app/src/shared_widgets/custom_appbar.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';

class AddOperatorsScreen extends StatelessWidget {
  const AddOperatorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: context.tr('addOperators'),
        actionButton: GestureDetector(
          onTap: () {
            // _openSheetForAddMan(context);
            // _openSheetForSelectAdd(context);
          },

          child: Assets.icons.addContactIc.svg(),
        ),
      ),
      body: ListView.separated(
        padding: EdgeInsets.only(top: 20.h),
        itemBuilder: (context, index) => ListTile(
          contentPadding: EdgeInsetsGeometry.fromSTEB(20.w, 0, 20.w, 0),
          title: Text(
            '+974999999999',
            style: AppTextStyle.rubikRegular16.copyWith(color: AppColors.black),
          ),
          trailing: GestureDetector(child: Assets.icons.deleteEventIc.svg()),
        ),
        separatorBuilder: (_, __) => Divider(),
        itemCount: 3,
      ),
      //? Empty :
      // Center(
      //   child: Text(
      //     context.tr('emptyContacts'),
      //     style: AppTextStyle.rubikRegular16.copyWith(color: AppColors.black),
      //   ),
      // ),
    );
  }
}
