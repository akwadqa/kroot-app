import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:kroot_app/features/app/domain/version_update.dart';
import 'package:kroot_app/src/routing/go_router_app.dart';
import 'package:kroot_app/src/shared_widgets/app_dialogs.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_service.g.dart';

@riverpod
class AppService extends _$AppService {
  @override
  void build() {}
  Future<void> checkAppVersion(
    // BuildContext context,
    VersionUpdate versionUpdate,
  ) async {
    // final appRouter = ref.watch(goRouterProvider);
    final currentContext = navigatorKey.currentContext!;
    debugPrint("VERSION NUMBER${versionUpdate.appAndroidVersion}");
    debugPrint("NEED UPDATE VERSION NUMBER ${versionUpdate.appUpdateRequired}");
    final info = await PackageInfo.fromPlatform();
    final currentVersion = info.version; // e.g. "1.0.0"
    debugPrint("CURRENT VERSION NUMBER $currentVersion");

    final latestVersion = Platform.isAndroid
        ? versionUpdate.appAndroidVersion
        : versionUpdate.appIosVersion;

    final updateRequired = versionUpdate.appUpdateRequired ?? false;

    // 🔍 Compare versions (simple semantic version comparison)
    if (_isVersionLower(currentVersion, latestVersion)) {
      final title = updateRequired
          ? "update_title_required"
          : "update_title_optional";
      //  versionUpdate.appNewUpdateTitle ?? "Update Available";
      final message = updateRequired
          ?versionUpdate.appUpdateMessage?? "update_message_required"
          :versionUpdate.appUpdateMessage?? "update_message_optional";
      // ? (versionUpdate.appUpdateRequiredMessage ??
      //       "A new version is required to continue using the app.")
      // : (versionUpdate.appUpdateMessage ??
      //       "A new version of the app is available.");

      final url = Platform.isAndroid
          ? versionUpdate.appAndroidUrl
          : versionUpdate.appIosUrl;

      if (url == null && updateRequired) {
        debugPrint("Update required but URL is null, cannot show dialog.");
        return;
      }

      AppDialogs.showUpdateDialog(
        currentContext,
        title,
        message,
        url ?? '',
        updateRequired,
      );
    }
  }

  
  bool _isVersionLower(String current, String latest) {
    final currParts = current.split('.').map(int.parse).toList();
    final latestParts = latest.split('.').map(int.parse).toList();
    for (var i = 0; i < currParts.length; i++) {
      if (i >= latestParts.length) return false;
      if (currParts[i] < latestParts[i]) return true;
      if (currParts[i] > latestParts[i]) return false;
    }
    return currParts.length < latestParts.length;
  }
}
