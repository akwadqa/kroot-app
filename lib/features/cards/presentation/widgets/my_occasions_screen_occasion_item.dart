
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kroot_app/src/routing/routes.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';

class MyOccasionsScreenOccasionItem extends StatelessWidget {
  const MyOccasionsScreenOccasionItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>context.push(Routes.occasionCards),
      child: Container(
        // width: 200,
        // height: 200,
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.grayBorder2),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withValues(alpha: 0.05),
              blurRadius: 2,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: AppColors.primarySwatch.withValues(alpha: 0.2),
              radius: 34,
              child: Icon(
                Icons.card_giftcard_outlined,
                size: 50,
                color: AppColors.primarySwatch,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Graduation',
              style: AppTextStyle.rubikRegular20
                  .copyWith(color: AppColors.cardTitle),
            ),
          ],
        ),
      ),
    );
  }
}
