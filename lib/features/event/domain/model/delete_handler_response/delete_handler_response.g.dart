// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_handler_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DeleteHandlerResponse _$DeleteHandlerResponseFromJson(
        Map<String, dynamic> json) =>
    _DeleteHandlerResponse(
      removed:
          (json['removed'] as List<dynamic>).map((e) => e as String).toList(),
      notFound:
          (json['not_found'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$DeleteHandlerResponseToJson(
        _DeleteHandlerResponse instance) =>
    <String, dynamic>{
      'removed': instance.removed,
      'not_found': instance.notFound,
    };
