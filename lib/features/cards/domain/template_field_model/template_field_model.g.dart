// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_field_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TemplateFieldModel _$TemplateFieldModelFromJson(Map<String, dynamic> json) =>
    _TemplateFieldModel(
      fieldName: json['field_name'] as String?,
      fieldType: json['field_type'] as String?,
      fieldLabel: json['field_label'] as String?,
      selectOptions: (json['select_options'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      isRequired: const JsonKeyTransform()
          .fromJson((json['is_required'] as num?)?.toInt()),
      placeholder: json['placeholder'] as String?,
    );

Map<String, dynamic> _$TemplateFieldModelToJson(_TemplateFieldModel instance) =>
    <String, dynamic>{
      'field_name': instance.fieldName,
      'field_type': instance.fieldType,
      'field_label': instance.fieldLabel,
      'select_options': instance.selectOptions,
      'is_required': const JsonKeyTransform().toJson(instance.isRequired),
      'placeholder': instance.placeholder,
    };
