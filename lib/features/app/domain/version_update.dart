import 'package:freezed_annotation/freezed_annotation.dart';

part 'version_update.freezed.dart';
part 'version_update.g.dart';

@freezed
abstract class VersionUpdate with _$VersionUpdate {
  factory VersionUpdate({
    @JsonKey(name: 'android_version') required String appAndroidVersion,
    @JsonKey(name: 'ios_version') required String appIosVersion,
    @JsonKey(name: 'app_update_required') required bool? appUpdateRequired,
    // @JsonKey(name: 'app_update_required_message')
    //     String? appUpdateRequiredMessage,
    @JsonKey(name: 'app_update_message') String? appUpdateMessage,
    // @JsonKey(name: 'app_new_update_title') String? appNewUpdateTitle,
    @JsonKey(name: 'app_ios_url') String? appIosUrl,
    @JsonKey(name: 'app_android_url') String? appAndroidUrl,
  }) = _VersionUpdate;

  factory VersionUpdate.fromJson(Map<String, dynamic> json) =>
      _$VersionUpdateFromJson(json);
}