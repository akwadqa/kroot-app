import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../constants/Api/services_urls.dart';
import 'dio_remote_interceptor.dart';
import 'network_service.dart';

part 'dio_client.g.dart';


@Riverpod(keepAlive: true)
Dio dio(Ref ref) {
  const timeout = Duration(seconds: 120);

  final dio = Dio(BaseOptions(
    baseUrl: ServicesUrls.baseProductionUrl,
    connectTimeout: timeout,
    receiveTimeout: timeout,
    sendTimeout: timeout,
  ));
  // dio.interceptors.add(RemoteInterceptor(ref));
dio.interceptors.addAll([
  RemoteInterceptor(ref), // Your custom logic for token, language, error mapping
  PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: false,
    error: true,
    compact: true,
    maxWidth: 90,
  ),
]);
  // dio.interceptors.addAll([
  //   InterceptorsWrapper(
  //     onRequest: (options, handler) {
  //       if (token != null) {
  //         options.headers['Authorization'] = "token $token";
  //       }
  //       // options.queryParameters['sl'] = language;
  //       options.headers['Accept-Language'] = language;
  //       handler.next(options);
  //     },
  //     onError: (error, handler) {
  //       handler.reject(DioExceptionHandler.handle(error));
  //     },
  //   ),
  //   LogInterceptor(requestBody: true, responseBody: true),
  // ]);

  return dio;
}

/// NetworkService injection
@Riverpod(keepAlive: true)
NetworkService networkService(Ref ref, [Dio? dio]) =>
    DioNetworkService(dio ?? ref.watch(dioProvider));
