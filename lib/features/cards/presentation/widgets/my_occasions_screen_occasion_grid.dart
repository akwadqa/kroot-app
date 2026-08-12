import 'package:flutter/material.dart';
import 'package:kroot_app/features/cards/domain/template_categories_model/template_categories_mode.dart';
import 'package:kroot_app/features/cards/presentation/widgets/my_occasions_screen_occasion_item.dart';

class MyOccasionsScreenOccasionsGrid extends StatelessWidget {
  const MyOccasionsScreenOccasionsGrid({
    super.key,
    required this.categories,
  });
  final List<TemplateCategoriesModel> categories;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: categories.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 1.3,
      ),
      itemBuilder: (context, index) {
        return MyOccasionsScreenOccasionItem(
          category: categories[index],
        );
      },
    );
  }
}
