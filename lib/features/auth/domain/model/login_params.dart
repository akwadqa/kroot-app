import 'dart:convert';

import 'package:equatable/equatable.dart';

class LoginParams extends Equatable {
  final String email;
  final String pass;

  const LoginParams({
    required this.email,
    required this.pass,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': pass,
    };
  }
  @override
  List<Object?> get props => [email, pass];
  String toJson() => json.encode(toMap());

}
