import 'package:freezed_annotation/freezed_annotation.dart';

part 'template_field_model.freezed.dart';
part 'template_field_model.g.dart';

@freezed
abstract class TemplateFieldModel with _$TemplateFieldModel {
  const factory TemplateFieldModel({
    @JsonKey(name: 'field_name') String? fieldName,
    @JsonKey(name: 'field_type') String? fieldType,
    @JsonKey(name: 'field_label') String? fieldLabel,
    @JsonKey(name: 'is_required') @JsonKeyTransform() bool? isRequired,
    String? placeholder,
  }) = _TemplateFieldModel;

  factory TemplateFieldModel.fromJson(Map<String, dynamic> json) =>
      _$TemplateFieldModelFromJson(json);
}

/// مفسر مخصص لتحويل الـ int القادم من الـ API (0 أو 1) إلى bool تلقائياً
class JsonKeyTransform implements JsonConverter<bool?, int?> {
  const JsonKeyTransform();

  @override
  bool? fromJson(int? json) {
    if (json == null) return null;
    return json == 1;
  }

  @override
  int? toJson(bool? object) {
    if (object == null) return null;
    return object ? 1 : 0;
  }
}