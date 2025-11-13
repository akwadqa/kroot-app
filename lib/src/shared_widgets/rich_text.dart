import 'package:flutter/material.dart';
import 'package:kroot_app/src/theme/app_colors.dart';

class StarredText extends StatelessWidget {
  final String text;
  final bool withStar;
  const StarredText(this.text, {super.key, this.withStar = true});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: text,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          TextSpan(
            text: withStar ? ' *' : '',
            style: Theme.of(
              context,
            ).textTheme.displayMedium!.copyWith(color: AppColors.newRed),
          ),
        ],
      ),
    );
  }
}
