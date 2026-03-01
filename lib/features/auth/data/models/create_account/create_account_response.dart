import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_account_response.freezed.dart';
part 'create_account_response.g.dart';

@freezed
abstract class CreateAccountResponse with _$CreateAccountResponse {
  const factory CreateAccountResponse({
    String? user_id,
    String? first_name,
    String? last_name,
    String? email,
    String? mobile_no,
  }) = _CreateAccountResponse;

  factory CreateAccountResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateAccountResponseFromJson(json);
}
