import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:kroot_app/features/cards/domain/template_categories_model/template_categories_mode.dart';
import 'package:kroot_app/src/constants/Api/services_urls.dart';
import 'package:kroot_app/src/routing/routes.dart';
import 'package:kroot_app/src/theme/app_colors.dart';
import 'package:kroot_app/src/theme/app_text_style.dart';

class MyOccasionsScreenOccasionItem extends StatelessWidget {
  const MyOccasionsScreenOccasionItem({
    super.key,
    required this.category,
  });
  final TemplateCategoriesModel category;

  @override
  Widget build(BuildContext context) {
    final baseUrl = dotenv.env['BASE_IMAGE'] ?? '';

    return GestureDetector(
      onTap: () => context.push(Routes.occasionCards , extra: category),
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
            SvgPicture.network(baseUrl + (category.categoryIcon ?? ''),
                width: 50, height: 50),
            // CircleAvatar(
            //   backgroundColor: AppColors.primarySwatch.withValues(alpha: 0.2),
            //   radius: 34,
            // child: CachedNetworkImage(
            //   imageUrl: ServicesUrls.imageUrl + (category.categoryIcon ?? ''),
            // ),
            // child: SvgPicture.network(baseUrl + (category.categoryIcon ?? ''),
            //     width: 30, height: 30),

            // child: Icon(
            //   Icons.card_giftcard_outlined,
            //   size: 50,
            //   color: AppColors.primarySwatch,
            // ),
            // ),
            SizedBox(height: 10),
            Text(
              category.categoryName ?? 'name',
              textAlign: TextAlign.center,
              style: AppTextStyle.rubikRegular20
                  .copyWith(color: AppColors.cardTitle),
            ),
          ],
        ),
      ),
    );
  }
}
