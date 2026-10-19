import 'package:flutter/material.dart';

extension SizedBoxExtensions on int {
  Widget get verticalSpace => SizedBox(height: toDouble());
  Widget get horizontalSpace => SizedBox(width: toDouble());
}
