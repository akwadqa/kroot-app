// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'version_update.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VersionUpdate _$VersionUpdateFromJson(Map<String, dynamic> json) =>
    _VersionUpdate(
      appAndroidVersion: json['android_version'] as String,
      appIosVersion: json['ios_version'] as String,
      appUpdateRequired: json['app_update_required'] as bool?,
      appUpdateMessage: json['app_update_message'] as String?,
      appIosUrl: json['app_ios_url'] as String?,
      appAndroidUrl: json['app_android_url'] as String?,
    );

Map<String, dynamic> _$VersionUpdateToJson(_VersionUpdate instance) =>
    <String, dynamic>{
      'android_version': instance.appAndroidVersion,
      'ios_version': instance.appIosVersion,
      'app_update_required': instance.appUpdateRequired,
      'app_update_message': instance.appUpdateMessage,
      'app_ios_url': instance.appIosUrl,
      'app_android_url': instance.appAndroidUrl,
    };
