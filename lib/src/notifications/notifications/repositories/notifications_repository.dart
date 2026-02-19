import 'package:dio/dio.dart';
import 'package:kroot_app/src/constants/Api/api_response.dart';
import 'package:kroot_app/src/constants/Api/end_points.dart';
import 'package:kroot_app/src/constants/Api/services_urls.dart';
import 'package:kroot_app/src/network/exception/dio_exceptions.dart';
import 'package:kroot_app/src/network/services/dio_client.dart';
import 'package:kroot_app/src/network/services/network_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'notifications_repository.g.dart';

@riverpod
NotificationsRepository notificationsRepository(Ref ref) {
  final dio = ref.watch(dioProvider);
  final newDio = Dio(dio.options.copyWith(baseUrl: ServicesUrls.baseUrl));
  newDio.interceptors.addAll(dio.interceptors);

  final NetworkService networkService = ref.watch(
    networkServiceProvider(newDio),
  );

  return NotificationsRepository(networkService);
}

class NotificationsRepository {
  final NetworkService _networkService;

  NotificationsRepository(this._networkService);

  Future<void> sendFCMToken(String token, String userId) async {
    final response = await _networkService.post(
      EndPoints.sendFcmToken,
      data: {'device_token': token, 'user_id': userId},
    );

    final ApiResponse appResponse = ApiResponse.fromJson(
      response.data,
      (json) => null,
    );

    if (appResponse.error == 1) {
      throw AppException(appResponse.message);
    }
  }
}
