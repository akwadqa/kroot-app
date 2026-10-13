// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InvitationTemplateModel _$InvitationTemplateModelFromJson(
        Map<String, dynamic> json) =>
    _InvitationTemplateModel(
      name: json['name'] as String,
      price: json['price'] as num,
      templateName: json['template_name'] as String,
      sampleImage: json['sample_image'] as String,
    );

Map<String, dynamic> _$InvitationTemplateModelToJson(
        _InvitationTemplateModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'price': instance.price,
      'template_name': instance.templateName,
      'sample_image': instance.sampleImage,
    };
