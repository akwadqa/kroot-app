// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_categories_mode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TemplateCategoriesModel _$TemplateCategoriesModelFromJson(
        Map<String, dynamic> json) =>
    _TemplateCategoriesModel(
      name: json['name'] as String,
      categoryName: json['category_name'] as String?,
      categoryIcon: json['category_icon'] as String?,
      displayOrder: (json['display_order'] as num?)?.toInt(),
      filters: (json['filters'] as List<dynamic>?)
              ?.map((e) => Filter.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$TemplateCategoriesModelToJson(
        _TemplateCategoriesModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'category_name': instance.categoryName,
      'category_icon': instance.categoryIcon,
      'display_order': instance.displayOrder,
      'filters': instance.filters,
    };

_Filter _$FilterFromJson(Map<String, dynamic> json) => _Filter(
      filterLabel: json['filter_label'] as String,
      options: (json['options'] as List<dynamic>?)
              ?.map((e) => Option.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$FilterToJson(_Filter instance) => <String, dynamic>{
      'filter_label': instance.filterLabel,
      'options': instance.options,
    };

_Option _$OptionFromJson(Map<String, dynamic> json) => _Option(
      optionValue: json['option_value'] as String,
      optionLabel: json['option_label'] as String?,
    );

Map<String, dynamic> _$OptionToJson(_Option instance) => <String, dynamic>{
      'option_value': instance.optionValue,
      'option_label': instance.optionLabel,
    };
