// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_notifications_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppNotificationsModel _$AppNotificationsModelFromJson(
  Map<String, dynamic> json,
) => _AppNotificationsModel(
  appMessageId: json['app_message_id'] as String,
  appMessageTitle: json['app_message_title'] as String?,
  appMessageIcon: json['app_message_icon'] as String?,
  type: json['type'] as String,
  item: json['item'] as String?,
  publishedOn: json['published_on'] as String?,
  content: json['content'] as String?,
);

Map<String, dynamic> _$AppNotificationsModelToJson(
  _AppNotificationsModel instance,
) => <String, dynamic>{
  'app_message_id': instance.appMessageId,
  'app_message_title': instance.appMessageTitle,
  'app_message_icon': instance.appMessageIcon,
  'type': instance.type,
  'item': instance.item,
  'published_on': instance.publishedOn,
  'content': instance.content,
};
