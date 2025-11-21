import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kroot_app/src/theme/app_colors.dart';

class AddEventPageBotton extends StatelessWidget {
  const AddEventPageBotton({
    super.key,
    required this.isSubmit,
    this.onTap,
    required this.child,
  });

  final bool isSubmit;
  final void Function()? onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.r),
      child: Material(
        color: isSubmit ? AppColors.primary : null,
        child: InkWell(
          onTap: onTap,
          child: Container(
            width: 150.w,
            height: 44.h,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.grayBorder),
              borderRadius: BorderRadius.circular(10.r),
            ),
            alignment: Alignment.center,
            child: child,
          ),
        ),
      ),
    );
  }
}
