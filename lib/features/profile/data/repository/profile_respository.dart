import 'package:dio/dio.dart';
import 'package:kroot_app/features/profile/data/data_source/profile_remote_data_source.dart';
import 'package:kroot_app/src/constants/Api/api_response.dart';
import 'package:kroot_app/src/network/services/dio_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_respository.g.dart';

@Riverpod(keepAlive: true)
ProfileRespository profileRespository(Ref ref) {
  final networkService = ref.watch(networkServiceProvider());
  return ProfileRespository(ProfileRemoteDataSource(networkService));
}

class ProfileRespository {
  final ProfileRemoteDataSource _remoteDataSource;

  ProfileRespository(this._remoteDataSource);

  Future<ApiResponse<String>> getPaymentUrl(
    String subscription_type,
    String local,
  ) async {
    try {
      final response = await _remoteDataSource.getPaymentLink(
        subscription_type,
        local,
      );
      return response;
    } on DioException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
