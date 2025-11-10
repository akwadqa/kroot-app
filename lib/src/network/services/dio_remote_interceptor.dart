import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wedding_app/features/auth/application/auth_service.dart';

import '../../constants/Api/api_response.dart';
import '../../localization/current_language.dart';

class RemoteInterceptor extends Interceptor {
  final Ref ref;
  RemoteInterceptor(this.ref);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final user = ref.read(userDataProvider);
    final language = ref.read(currentLanguageProvider);

    //? I removed the name and id here :
    // if (user?.$1 != null) {
    //   options.headers['Authorization'] =  user!.$1;
    //   // options.headers['Authorization'] = "token 9999a8c4f69c387:0f3facf56d417ce";
    // }
    if (user != null) {
      options.headers['Authorization'] = 'token $user';
      // options.headers['Authorization'] =  'token 8076a272ef22208:0fc27caa720cc39';
      // options.headers['Authorization'] = "token 9999a8c4f69c387:0f3facf56d417ce";
    }

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
    // debugPrint("🧵 Stack trace: ${err.error}");

    final apiResponse = _handleErrorResponse(err);
    handler.resolve(
      Response(
        requestOptions: err.requestOptions,
        data: err.response?.data,
        //? This :
        // data: apiResponse.toJson(),
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
      message =
          _getDefaultMessageForStatusCode(statusCode) ??
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
