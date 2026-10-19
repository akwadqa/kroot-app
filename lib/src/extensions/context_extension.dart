import 'package:flutter/material.dart';

extension ContextExtesion on BuildContext{
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;
}