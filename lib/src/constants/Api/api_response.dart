import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kroot_app/src/constants/Api/pagination.dart';

@JsonSerializable(genericArgumentFactories: true)
class ApiResponse<T> {
  ApiResponse(this.status, this.message, this.data, this.pagination);

  ApiResponse.success({this.message, this.data, this.pagination})
    : status = 200;

  ApiResponse.error({this.message, this.error})
    : status = null,
      data = null,
      pagination = null;

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    try {
      final statusCode = json['status_code'] ?? json['status'];
      final hasError =
          json['error'] == 1 || (statusCode != null && statusCode > 201);

      if (hasError) {
        return ApiResponse<T>.error(
          message: json['message']?.toString() ?? 'Unknown error',
          error: json['error'],
        );
      }

      if (T.toString() == 'void') {
        return ApiResponse<T>.success(message: json['message'], data: null);
      }

      T data = fromJsonT(json['data']);
      return ApiResponse<T>.success(
        message: json['message'],
        pagination: json['pagination'] != null
            ? Pagination.fromJson(json['pagination'])
            : null,
        data: data,
      );
    } catch (error) {
      return ApiResponse<T>.error(message: error.toString(), error: error);
    }
  }

  final int? status;
  final String? message;
  final Pagination? pagination;
  final T? data;
  dynamic error;

  Map<String, dynamic> toJson() => {
    'status_code': status,
    'message': message,
    'data': data,
    'error': error,
  };

  bool get hasSucceeded => status == 200;
  bool get hasFailed => error != null && error == 1;
}
