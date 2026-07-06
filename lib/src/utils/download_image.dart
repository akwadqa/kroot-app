import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gal/gal.dart';
import 'package:kroot_app/src/network/services/dio_client.dart';
import 'package:kroot_app/src/utils/app_toast.dart';
import 'package:permission_handler/permission_handler.dart';

class FileDownloadService {
  static Future<void> downloadImageToDownloads(
      String imageUrl, String fileName, WidgetRef ref) async {
    try {
      final dio = ref.read(dioProvider);

      if (Platform.isAndroid) {
        Map<Permission, PermissionStatus> statuses = await [
          Permission.storage,
          Permission.photos, 
        ].request();

        if (statuses[Permission.storage]!.isDenied &&
            statuses[Permission.photos]!.isDenied) {
          AppToast.errorToast("permission_denied".tr());
          throw Exception("permission_denied".tr());
        }
        final String savePath = "/storage/emulated/0/Download/$fileName";
        AppToast.doneToast('loading'.tr());

        await dio.download(
          imageUrl,
          savePath,
          onReceiveProgress: (received, total) {
            if (total != -1) {
              double progress = (received / total) * 100;

              print("نسبة التحميل (أندرويد): ${progress.toStringAsFixed(0)}%");
            }
          },
        );
        AppToast.doneToast("successfullyCompleted".tr());
        print("تم حفظ الصورة في مجلد Downloads بالأندرويد بنجاح: $savePath");
      }

      else if (Platform.isIOS) {
        if (!await Gal.hasAccess()) {
          await Gal.requestAccess();
        }

        final response = await dio.get<List<int>>(
          imageUrl,
          options: Options(
            responseType: ResponseType.bytes,
          ),
        );

        if (response.data != null) {
          await Gal.putImageBytes(Uint8List.fromList(response.data!));
          AppToast.doneToast("successfullyCompleted".tr());
        } else {
          AppToast.errorToast("permission_denied".tr());
          throw Exception("فشل في جلب بيانات الصورة من الرابط");
        }
      }
    } catch (e) {
      AppToast.errorToast("permission_denied".tr());
      print("خطأ أثناء تحميل أو حفظ الصورة: $e");
      rethrow;
    }
  }
}
