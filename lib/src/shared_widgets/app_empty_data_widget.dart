import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kroot_app/src/extenssions/int_extenssion.dart';

import '../../assets.gen.dart';

class AppEmptyDataWidget extends StatelessWidget {
  final String text;
  const AppEmptyDataWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(Assets.images.emptyData),
          20.verticalSpace,
          Text(
            context.tr(text),
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ],
      ),
    );
  }
}
