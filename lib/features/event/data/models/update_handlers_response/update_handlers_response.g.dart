// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_handlers_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdateHandlersResponse _$UpdateHandlersResponseFromJson(
  Map<String, dynamic> json,
) => _UpdateHandlersResponse(
  added: (json['added'] as List<dynamic>?)
      ?.map((e) => HandlerModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  duplicates: (json['duplicates'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  handlers: (json['handlers'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$UpdateHandlersResponseToJson(
  _UpdateHandlersResponse instance,
) => <String, dynamic>{
  'added': instance.added,
  'duplicates': instance.duplicates,
  'handlers': instance.handlers,
};
