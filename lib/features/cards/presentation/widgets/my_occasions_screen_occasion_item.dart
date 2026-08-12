import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:kroot_app/features/cards/domain/template_categories_model/template_categories_mode.dart';
import 'package:kroot_app/src/constants/Api/services_urls.dart';
import 'package:kroot_app/src/routing/routes.dart';
import 'package:kroot_app/src/shared_widgets/fade_circle_loading_indicator.dart';
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
    final color = (category.defaultFontColor != null &&
            category.defaultFontColor!.isNotEmpty)
        ? Color(int.parse(category.defaultFontColor!.replaceFirst('#', '0xff')))
        : AppColors.white;

    return GestureDetector(
      onTap: () => context.push(Routes.occasionCards, extra: category),
      child: Container(
        // width: 200,
        // height: 200,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: AppColors.primary, width: 2),
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
            Spacer(
              flex: 1,
            ),
            Expanded(
              flex: 4,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 50),
                width: double.infinity,
                decoration: BoxDecoration(
                  // color: AppColors.cardBackground,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                ),
                child: (category.categoryIcon?.contains('svg') ?? false)
                    ? SvgPicture.network(baseUrl + category.categoryIcon!,
                        width: 30, height: 30)
                    : CachedNetworkImage(
                        placeholder: (context, url) =>
                            Center(child: FadeCircleLoadingIndicator()),
                        imageUrl: baseUrl + (category.categoryIcon ?? ''),
                        width: 50,
                        height: 50,
                      ),
              ),
            ),

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
            Expanded(
              flex: 1,
              child: FittedBox(
                child: Text(
                  category.categoryName ?? 'name',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.rubikRegular12
                      .copyWith(color: AppColors.primary),
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
