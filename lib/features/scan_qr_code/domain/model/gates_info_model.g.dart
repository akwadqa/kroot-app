// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gates_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GatesInfoModel _$GatesInfoModelFromJson(Map<String, dynamic> json) =>
    _GatesInfoModel(
      nameId: json['name'] as String?,
      gateName: json['gate_name'] as String?,
      active: (json['active'] as num).toInt(),
      rating: (json['rating'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$GatesInfoModelToJson(_GatesInfoModel instance) =>
    <String, dynamic>{
      'name': instance.nameId,
      'gate_name': instance.gateName,
      'active': instance.active,
      'rating': instance.rating,
    };
