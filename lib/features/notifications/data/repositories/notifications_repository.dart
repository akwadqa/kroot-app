
import 'package:kroot_app/features/notifications/data/datasources/notifications_dataSource.dart';
import 'package:kroot_app/features/notifications/domain/model/app_notifications_model.dart';
import 'package:kroot_app/src/network/services/dio_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../src/constants/Api/api_response.dart';

part 'notifications_repository.g.dart';

@Riverpod(keepAlive: true)
NotificationsRepository notificationsRepository(Ref ref) {
  final networkService = ref.watch(networkServiceProvider());
  return NotificationsRepository(NotificationsDatasource(networkService));
}

class NotificationsRepository {
  final NotificationsDatasource _remoteDataSource;

  NotificationsRepository(this._remoteDataSource);

  Future<ApiResponse<List<AppNotificationsModel>>> getAllOrdersNotifications(
      {required int page,String? quickOrderOfferId,}) async {
    try {
      final result = await _remoteDataSource.getAllNotification(page,quickOrderOfferId);
      if (result.hasFailed) {
        throw Exception(
          result.message ?? 'Failed to fetch NOtifications',
        );
      }
      // if (result.status == 200) {
      return result;
      // }
    } catch (e) {
      throw Exception('Failed to Get NOtifications: $e');
    }
  }

  // }
}
