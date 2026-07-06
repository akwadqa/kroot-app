import 'package:freezed_annotation/freezed_annotation.dart';

part 'confirm_preview_card_response.freezed.dart';
part 'confirm_preview_card_response.g.dart';

@freezed
abstract class ConfirmPreviewCardResponse with _$ConfirmPreviewCardResponse {
  const factory ConfirmPreviewCardResponse({
    required String name,
    @JsonKey(name: 'final_image') required String finalImage,
    required num amount, // تم استخدام num لتشمل int أو double حسب مرونة الـ API
  }) = _ConfirmPreviewCardResponse;

  factory ConfirmPreviewCardResponse.fromJson(Map<String, dynamic> json) =>
      _$ConfirmPreviewCardResponseFromJson(json);
}