
import 'package:flutter/material.dart';
import 'package:kroot_app/features/cards/presentation/widgets/my_occasions_screen_occasion_item.dart';

class MyOccasionsScreenOccasionsGrid extends StatelessWidget {
  const MyOccasionsScreenOccasionsGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: 10,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 1,
        ),
        itemBuilder: (context, index) {
          return MyOccasionsScreenOccasionItem();
        },
      ),
    );
  }
}
