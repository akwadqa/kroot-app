
import 'package:kroot_app/features/notifications/domain/model/app_notifications_model.dart';
import 'package:kroot_app/src/constants/Api/end_points.dart';

import '../../../../src/constants/Api/api_response.dart';
import '../../../../src/network/services/network_service.dart';

class NotificationsDatasource {
  final NetworkService _networkService;

  NotificationsDatasource(this._networkService);

  Future<ApiResponse<List<AppNotificationsModel>>> getAllNotification(
    int page,
    String? quickOrderOfferId
  ) async {
    try {
      final response = await _networkService.get(
        EndPoints.appNotifications,
        queryParameters: {
          'page': page,

        },
      );
      return ApiResponse.fromJson(
        response.data,
        (json) => (json as List)
            .map((item) =>
                AppNotificationsModel.fromJson(item as Map<String, dynamic>))
            .toList(),
      );
    } catch (e) {
      return ApiResponse.error(message: e.toString());
    }
  }
}
