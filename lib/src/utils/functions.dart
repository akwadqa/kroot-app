import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DashedLineVerticalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashHeight = 5, dashSpace = 3, startY = 0;
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = size.width;
    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

String processEtaValue(String? etaResponse, int mode) {
  if (etaResponse == null || etaResponse.isEmpty) return '';

  String normalized = etaResponse;

  if (etaResponse.contains('-')) {
    final parts = etaResponse.split('-');
    if (parts.length == 2) {
      String distanceText = parts[0].trim();
      String timeText = parts[1].trim();

      final distanceNum = double.tryParse(
        RegExp(r'([\d.]+)').firstMatch(distanceText)?.group(1) ?? '',
      );
      final timeNum = double.tryParse(
        RegExp(r'([\d.]+)').firstMatch(timeText)?.group(1) ?? '',
      );

      if (distanceNum != null && timeNum != null) {
        if (distanceText.contains('km')) {
          normalized = '${(distanceNum * 1000).toInt()},${timeNum.toInt()}';
        } else {
          normalized = '${distanceNum.toInt()},${timeNum.toInt()}';
        }
      }
    }
  }

  if (RegExp(r'^\d+,\d+$').hasMatch(normalized)) {
    final parts = normalized.split(',');
    if (parts.length != 2) return '';

    final distanceMeters = int.tryParse(parts[0].trim());
    final timeMinutes = int.tryParse(parts[1].trim());

    if (mode == 1 && distanceMeters != null) {
      if (distanceMeters < 1000) {
        return '$distanceMeters ${'unit_m'.tr()}';
      } else {
        final km = (distanceMeters / 1000).toStringAsFixed(1);
        return '$km ${'unit_km'.tr()}';
      }
    } else if (mode == 2 && timeMinutes != null) {
      return '$timeMinutes ${'unit_min'.tr()}';
    }
  }

  return '';
}

Future<void> openWhatsApp (String phoneNumber) async {
  final cleanNumber = phoneNumber.replaceAll(RegExp(r'[^\d]'), '');
  
  final Uri whatsappUrl = Uri.parse("https://wa.me/$cleanNumber");

  try {
    if (await canLaunchUrl(whatsappUrl)) {
      await launchUrl(
        whatsappUrl,
        mode: LaunchMode.externalApplication, 
      );
    } else {
      throw 'Could not launch $whatsappUrl';
    }
  } catch (e) {
    print("Error opening WhatsApp: $e");
  }
}