import 'package:dio/dio.dart';
import 'package:kroot_app/features/event/data/models/get_user_events/get_user_events_model.dart';
import 'package:kroot_app/features/guests/data/datasources/guests_datasource.dart';
import 'package:kroot_app/features/guests/domain/model/update_guest_list_response.dart/update_guest_list_response.dart';
import 'package:kroot_app/features/guests/domain/model/update_guest_response/update_guest_response.dart';
import 'package:kroot_app/src/network/services/dio_client.dart';
import 'package:kroot_app/src/constants/Api/api_response.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'guests_repository.g.dart';

@Riverpod(keepAlive: true)
GuestsRepository guestsRepository(Ref ref) {
  final networkService = ref.watch(networkServiceProvider());
  return GuestsRepository(GuestsDatasource(networkService));
}

class GuestsRepository {
  final GuestsDatasource _remoteDataSource;

  GuestsRepository(this._remoteDataSource);
  Future<ApiResponse<UpdateGuestResponse>> updateGuest({
    required String inviteeId,
    required String whatsappNumber,
  }) async {
    try {
      final respone = await _remoteDataSource.updateGuest(
        inviteeId: inviteeId,
        whatsappNumber: whatsappNumber,
      );
      return respone;
    } on DioException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<ApiResponse<UpdateGuestListRespone>> updateGuestList({
    required String occasionId,
    required List<GuestModel> guests,
  }) async {
    try {
      final response = await _remoteDataSource.updateGuestList(
        occasionId: occasionId,
        guests: guests,
      );
      return response;
    } on DioException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<ApiResponse<void>> deleteGuest({
    required String occasionId,
    required List<GuestModel> guests,
  }) async {
    try {
      final respone = await _remoteDataSource.deleteGuest(
        occasionId: occasionId,
        guests: guests,
      );
      return respone;
    } on DioException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
