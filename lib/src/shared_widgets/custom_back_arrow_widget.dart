import 'package:flutter/material.dart';
import 'package:kroot_app/src/extenssions/widget_extensions.dart';

class CustomBackArrowWidget extends StatelessWidget {
  const CustomBackArrowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Icon(Icons.arrow_back_ios, color: Colors.black)
          .onlyPadding(start: 20),
    );
  }
}
