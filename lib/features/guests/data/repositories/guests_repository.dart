import 'package:dio/dio.dart';
import 'package:kroot_app/features/event/data/models/get_user_events/get_user_events_model.dart';
import 'package:kroot_app/features/guests/data/datasources/guests_datasource.dart';
import 'package:kroot_app/features/guests/domain/model/update_guest_list_response.dart/update_guest_list_response.dart';
import 'package:kroot_app/features/guests/domain/model/update_guest_response/update_guest_response.dart';
import 'package:kroot_app/src/network/check_net/check_net.dart';
import 'package:kroot_app/src/network/services/dio_client.dart';
import 'package:kroot_app/features/guests/data/datasources/guests_datasource.dart';
import 'package:kroot_app/features/guests/domain/model/guest_model.dart';
import 'package:kroot_app/src/constants/Api/api_response.dart';

import 'package:kroot_app/src/network/services/dio_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

  // Future<ApiResponse<List<GuestModel>>> getAllGuests({
  //   required int page,
  //   String? searchKey,
  //   RsvpStatus? status,
  // }) async {
  //   try {
  //     final result = await _remoteDataSource.getAllGuests(
  //       page,
  //       searchKey,
  //       status,
  //     );
  //     if (result.hasFailed) {
  //       throw Exception(result.message ?? 'Failed to fetch getAllGuests');
  //     }
  //     // if (result.status == 200) {
  //     return result;
  //     // }
  //   } catch (e) {
  //     throw Exception('Failed to Get getAllGuests: $e');
  //   }
  // }

  // Future<ApiResponse<GuestModel>> getGuestDetails(String? inviteeId) async {
  //   try {
  //     final result = await _remoteDataSource.getGuestDetails(inviteeId);
  //     if (result.hasFailed) {
  //       throw Exception(result.message ?? 'Failed to fetch getGuestDetails');
  //     }
  //     // if (result.status == 200) {
  //     return result;
  //     // }
  //   } catch (e) {
  //     throw Exception('Failed to Get getGuestDetails: $e');
  //   }
  // }

  Future<ApiResponse<UpdateGuestResponse>> updateGuest({
    required String inviteeId,
    required String whatsappNumber,
  }) async {
    return CheckNet<ApiResponse<UpdateGuestResponse>>().checkNetResponse(
      tryRight: () async {
        final respone = await _remoteDataSource.updateGuest(
          inviteeId: inviteeId,
          whatsappNumber: whatsappNumber,
        );
        return respone;
      },
    );
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

  Future<ApiResponse<UpdateGuestResponse>> deleteGuest({
    required String occasionId,
    required List<GuestModel> guests,
  }) async {
    return CheckNet<ApiResponse<UpdateGuestResponse>>().checkNetResponse(
      tryRight: () async {
        final respone = await _remoteDataSource.deleteGuest(
          occasionId: occasionId,
          guests: guests,
        );
        return respone;
      },
    );
  }

  // }
}
