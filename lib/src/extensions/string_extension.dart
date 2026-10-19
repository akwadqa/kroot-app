import 'package:flutter/material.dart';

extension CardNumberFormatter on String {
  String toCardNumberFormat() {
    final buffer = StringBuffer();
    final cleaned = replaceAll(RegExp(r'\D'), '');

    for (int i = 0; i < cleaned.length; i++) {
      buffer.write(cleaned[i]);
      if ((i + 1) % 4 == 0 && i + 1 != cleaned.length) {
        buffer.write(' - ');
      }
    }

    return buffer.toString();
  }
}

extension TextAlignmentExtension on String {
  TextAlign get textAlignment {
    if (isArabic) return TextAlign.right;
    return TextAlign.left;
  }

  TextDirection get textDirection {
    if (isArabic) return TextDirection.rtl;
    return TextDirection.ltr;
  }

  bool get isArabic {
    final trimmedText = trim();
    if (trimmedText.isEmpty) return false;
    return RegExp(r'^[\u0600-\u06FF]').hasMatch(trimmedText);
  }
}
