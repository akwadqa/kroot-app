import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

abstract class DioExceptionHandler {
  static DioException handle(DioException e) {
    final message = e.response?.data['message'];

    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw DeadlineExceededException(e.requestOptions, message);
      case DioExceptionType.badResponse:
        switch (e.response?.statusCode) {
          case 400:
            throw BadRequestException(e.requestOptions, message);
          case 401:
            throw UnauthorizedException(e.requestOptions, message);
          case 403:
            throw AccessForbiddenException(e.requestOptions, message);
          case 404:
            throw NotFoundException(e.requestOptions, message);
          case 409:
            throw ConflictException(e.requestOptions, message);
          case 422:
            throw UnprocessableEntityException(e.requestOptions, message);
          case 500:
            throw InternalServerErrorException(e.requestOptions, message);
          default:
            throw BadResponseException(e.requestOptions, message);
        }
      case DioExceptionType.cancel:
        throw AppException('requestCancelled'.tr());
      case DioExceptionType.unknown:
        throw NoInternetConnectionException(e.requestOptions, message);
      case DioExceptionType.connectionError:
        throw ConnectionErrorException(e.requestOptions, message);
      case DioExceptionType.badCertificate:
        throw BadCertificateException(e.requestOptions, message);
    }
  }
}

class AppException implements Exception {
  final String? message;
  AppException([this.message]);

  @override
  String toString() => message ?? 'Something went wrong';
}

class ApiException extends DioException {
  final String? customMessage;

  ApiException(RequestOptions r, [this.customMessage])
    : super(requestOptions: r, error: customMessage);

  String get defaultMessage => 'requestError'.tr();
  @override
  String toString() => customMessage ?? defaultMessage;
}

class BadRequestException extends ApiException {
  BadRequestException(super.r, [super.message]);
  @override
  String get defaultMessage => 'badRequest'.tr();
}

class UnauthorizedException extends ApiException {
  UnauthorizedException(super.r, [super.message]);
  @override
  String get defaultMessage => 'unauthorized'.tr();
}

class AccessForbiddenException extends ApiException {
  AccessForbiddenException(super.r, [super.message]);
  @override
  String get defaultMessage => 'accessForbidden'.tr();
}

class NotFoundException extends ApiException {
  NotFoundException(super.r, [super.message]);
  @override
  String get defaultMessage => 'notFound'.tr();
}

class ConflictException extends ApiException {
  ConflictException(super.r, [super.message]);
  @override
  String get defaultMessage => 'conflictConnection'.tr();
}

class UnprocessableEntityException extends ApiException {
  UnprocessableEntityException(super.r, [super.message]);
  @override
  String get defaultMessage => 'unprocessableEntity'.tr();
}

class InternalServerErrorException extends ApiException {
  InternalServerErrorException(super.r, [super.message]);
  @override
  String get defaultMessage => 'internalServerError'.tr();
}

class NoInternetConnectionException extends ApiException {
  NoInternetConnectionException(super.r, [super.message]);
  @override
  String get defaultMessage => 'noInternetConnection'.tr();
}

class DeadlineExceededException extends ApiException {
  DeadlineExceededException(super.r, [super.message]);
  @override
  String get defaultMessage => 'deadlineExceeded'.tr();
}

class BadCertificateException extends ApiException {
  BadCertificateException(super.r, [super.message]);
  @override
  String get defaultMessage => 'badCertificate'.tr();
}

class ConnectionErrorException extends ApiException {
  ConnectionErrorException(super.r, [super.message]);
  @override
  String get defaultMessage => 'connectionError'.tr();
}

class BadResponseException extends ApiException {
  BadResponseException(super.r, [super.message]);
  @override
  String get defaultMessage => 'freiendlyErrorMessage'.tr();
}
