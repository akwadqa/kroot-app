import 'package:freezed_annotation/freezed_annotation.dart';

part 'template_model.freezed.dart';
part 'template_model.g.dart';

@freezed
abstract class InvitationTemplateModel with _$InvitationTemplateModel {
  const factory InvitationTemplateModel({
    required String name,
    required num price,
    @JsonKey(name: 'template_name') required String templateName,
    @JsonKey(name: 'sample_image') required String sampleImage,
  }) = _InvitationTemplateModel;

  factory InvitationTemplateModel.fromJson(Map<String, dynamic> json) =>
      _$InvitationTemplateModelFromJson(json);
}
