import 'package:dio/dio.dart';

abstract class NetworkService<T> {
  Future<T> get(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    CancelToken? cancelToken,
  });

  Future<T> post(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  });

  Future<T> put(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  });

  Future<T> delete(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  });
}

class DioNetworkService implements NetworkService<Response> {
  final Dio _dio;

  DioNetworkService(this._dio);

  Options _createOptions(Map<String, String>? headers) {
    final defaultHeaders = Map<String, dynamic>.from(_dio.options.headers);
    return Options(
      headers: {...defaultHeaders, if (headers != null) ...headers},
    );
  }

  @override
  Future<Response> get(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    CancelToken? cancelToken,
  }) {
    return _dio.get(
      url,
      data: data,
      queryParameters: queryParameters,
      cancelToken: cancelToken,
      options: _createOptions(headers),
    );
  }

  @override
  Future<Response> post(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) {
    return _dio.post(
      url,
      data: data,
      queryParameters: queryParameters,
      options: _createOptions(headers),
    );
  }

  @override
  Future<Response> put(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) {
    return _dio.put(
      url,
      data: data,
      queryParameters: queryParameters,
      options: _createOptions(headers),
    );
  }

  @override
  Future<Response> delete(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
  }) {
    return _dio.delete(
      url,
      data: data,
      queryParameters: queryParameters,
      options: _createOptions(headers),
    );
  }
}
