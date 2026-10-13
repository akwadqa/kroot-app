import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_handler_response.freezed.dart';
part 'delete_handler_response.g.dart';

@freezed
abstract class DeleteHandlerResponse with _$DeleteHandlerResponse {
  const factory DeleteHandlerResponse({
    required List<String> removed,
    @JsonKey(name: 'not_found') required List<String> notFound,
  }) = _DeleteHandlerResponse;

  factory DeleteHandlerResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteHandlerResponseFromJson(json);
}
