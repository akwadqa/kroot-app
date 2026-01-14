import 'package:flutter/material.dart';
import 'package:kroot_app/src/theme/app_colors.dart';

class CustomBackArrowWidget extends StatelessWidget {
  final VoidCallback? onTap;
  const CustomBackArrowWidget({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
       Navigator.of(context).pop();
      },
      child: Container(
          margin: EdgeInsetsDirectional.only(start: 10, bottom: 5, top: 5),
          padding: EdgeInsetsDirectional.only(start: 5),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 18,
          )),
    );
  }
}
