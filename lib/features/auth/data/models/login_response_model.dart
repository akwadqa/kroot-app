// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response_model.freezed.dart';
part 'login_response_model.g.dart';

@freezed
abstract class LoginResponseModel with _$LoginResponseModel {
  const factory LoginResponseModel({
    @JsonKey(name: "token") required String token,
    @JsonKey(name: "full_name") required String? fullName,
    @JsonKey(name: "user") required String email,
  }) = _LoginResponseModel;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);
}

// @Freezed()
// class LoginResponseModel {
//   @JsonKey(name: "api_key")
//  final String token;
//   @JsonKey(name: "full_name")
//  final String fullName;
//   @JsonKey(name: "email")
//  final String email;

//   LoginResponseModel({
//     required this.token,
//     required this.fullName,
//     required this.email,
//   });

//   factory LoginResponseModel.fromJson(Map<String, dynamic> json) => _$LoginResponseModelFromJson(json);

//   Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);
// }
