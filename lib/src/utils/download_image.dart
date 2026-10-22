import 'dart:io';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gal/gal.dart';
import 'package:kroot_app/src/network/services/dio_client.dart';
import 'package:kroot_app/src/utils/app_toast.dart';

class FileDownloadService {
  static Future<void> downloadImageToDownloads(
      String imageUrl, String fileName, WidgetRef ref) async {
    try {
      final dio = ref.read(dioProvider);

      // التحقق من الصلاحيات
      if (!await Gal.hasAccess()) {
        await Gal.requestAccess();
      }

      AppToast.doneToast('loading'.tr());

      // 1. إنشاء مسار مؤقت آمن داخل النظام لحفظ الملف الأصلي
      final String tempPath = '${Directory.systemTemp.path}/$fileName';

      // 2. استخدام dio.download لتحميل الملف مباشرة إلى المسار المؤقت (بدون تحويله لـ Bytes)
      await dio.download(
        imageUrl,
        tempPath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            double progress = (received / total) * 100;
            print("نسبة التحميل: ${progress.toStringAsFixed(0)}%");
          }
        },
      );

      // 3. حفظ الملف مباشرة من المسار المؤقت إلى المعرض
      // هذه الدالة تقوم بنسخ الملف الأصلي كما هو 100% بدون أي ضغط
      await Gal.putImage(tempPath);

      // 4. تنظيف وحذف الملف المؤقت لتوفير مساحة التخزين
      final file = File(tempPath);
      if (await file.exists()) {
        await file.delete();
      }

      AppToast.doneToast("successfullyCompleted".tr());
      print("تم حفظ الصورة بأعلى دقة بنجاح في الجهاز");

    } catch (e) {
      AppToast.errorToast("error".tr()); 
      print("خطأ أثناء تحميل أو حفظ الصورة: $e");
      rethrow;
    }
  }
}