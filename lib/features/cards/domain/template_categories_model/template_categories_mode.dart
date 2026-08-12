import 'package:freezed_annotation/freezed_annotation.dart';

part 'template_categories_mode.freezed.dart';
part 'template_categories_mode.g.dart';

@freezed
abstract class TemplateCategoriesModel with _$TemplateCategoriesModel {
  const factory TemplateCategoriesModel({
    required String name,
    @JsonKey(name: 'category_name')  String? categoryName,
    @JsonKey(name: 'category_icon')  String? categoryIcon,
    @JsonKey(name: 'display_order')  int? displayOrder,
    @JsonKey(name: 'default_font_color')  String? defaultFontColor,
    @Default([]) List<Filter> filters,
  }) = _TemplateCategoriesModel;

  factory TemplateCategoriesModel.fromJson(Map<String, dynamic> json) =>

      _$TemplateCategoriesModelFromJson(json);

}

@freezed
abstract class Filter with _$Filter {
  const factory Filter({
    @JsonKey(name: 'filter_label') required String filterLabel,
    @Default([]) List<Option> options,
  }) = _Filter;

  factory Filter.fromJson(Map<String, dynamic> json) =>
      _$FilterFromJson(json);

}

@freezed
abstract class Option with _$Option {
  const factory Option({
    @JsonKey(name: 'option_value') required String optionValue,
    @JsonKey(name: 'option_label') String? optionLabel,
  }) = _Option;

  factory Option.fromJson(Map<String, dynamic> json) =>
      _$OptionFromJson(json);

}


