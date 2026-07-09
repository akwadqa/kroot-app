import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kroot_app/features/auth/application/auth_service.dart';
import 'package:kroot_app/src/routing/go_router_app.dart';
import 'package:kroot_app/src/routing/routes.dart';

import '../../constants/Api/api_response.dart';
import '../../localization/current_language.dart';

class RemoteInterceptor extends Interceptor {
  final Ref ref;
  RemoteInterceptor(this.ref);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = ref.read(userDataProvider)?.token;
    final language = ref.read(currentLanguageProvider);

    if (token != null) {
      options.headers['Authorization'] = 'token $token';
    }
    // options.headers['Authorization'] = 'token 81f75de95191a13:12841166da7d5f5';

    options.headers['Accept-Language'] = language;

    debugPrint("🔵 [DIO REQUEST]");
    debugPrint("➡️ ${options.method} ${options.uri}");
    debugPrint("📦 Headers: ${options.headers}");
    debugPrint("📝 Body: ${options.data}");

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint("🟢 [DIO RESPONSE]");
    debugPrint("✅ ${response.statusCode} ${response.requestOptions.uri}");
    debugPrint("📦 Response data: ${_prettyJson(response)}");

    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final request = err.requestOptions;

    debugPrint("🔴 [DIO ERROR]");
    debugPrint("⛔️ ${err.type} for ${request.method} ${request.uri}");
    debugPrint("📥 Response data: ${_prettyJson(err.response)}");
    debugPrint("📥 Response data: ${err.response}");

    final statusCode = err.response?.statusCode;
    final responseData = err.response?.data;

    final isUnauthorized = (statusCode == 401 &&
            (responseData['message']?.toString().toLowerCase().contains(
                      "otp",
                    )) ==
                false) ||
        (responseData['exc_type']?.toString().contains(
                  'AuthenticationError',
                )) ==
            true;

    if (isUnauthorized) {
      debugPrint("🚪 Session expired → redirect to Login");

      ref.read(userDataProvider.notifier).removeData();

      ref.read(goRouterProvider).go(Routes.login);
    }

    final apiResponse = _handleErrorResponse(err);
    handler.resolve(
      Response(
        requestOptions: err.requestOptions,
        data: err.response?.data,
        statusCode: err.response?.statusCode ?? 500,
      ),
    );
  }

  ApiResponse _handleErrorResponse(DioException err) {
    final data = err.response?.data;
    final statusCode = err.response?.statusCode;
    final path = err.requestOptions.path;

    String message;

    if (data is Map && data['message'] != null) {
      message = data['message'].toString();
    } else {
      message = _getDefaultMessageForStatusCode(statusCode) ??
          err.message ??
          'Unexpected error occurred';
    }

    return ApiResponse.error(
      message: "$message\n[$statusCode] [$path]",
      error: data,
    );
  }

  String? _getDefaultMessageForStatusCode(int? status) {
    switch (status) {
      case 400:
        return 'Bad Request';
      case 401:
        return 'Unauthorized';
      case 403:
        return 'Forbidden';
      case 404:
        return 'Not Found';
      case 409:
        return 'Conflict';
      case 422:
        return 'Unprocessable Entity';
      case 500:
        return 'Internal Server Error';
      default:
        return null;
    }
  }

  String _prettyJson(dynamic data) {
    try {
      if (data is Map || data is List) {
        return const JsonEncoder.withIndent('  ').convert(data);
      }
      return data.toString();
    } catch (_) {
      return 'Invalid JSON';
    }
  }
}
