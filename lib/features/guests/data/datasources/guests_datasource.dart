import 'dart:convert';

import 'package:kroot_app/features/event/data/models/get_user_events/get_user_events_model.dart';
import 'package:kroot_app/features/guests/domain/model/update_guest_list_response.dart/update_guest_list_response.dart';
import 'package:kroot_app/features/guests/domain/model/update_guest_response/update_guest_response.dart';
import 'package:kroot_app/src/constants/Api/api_response.dart';
import 'package:kroot_app/src/constants/Api/end_points.dart';

import 'package:kroot_app/src/network/services/network_service.dart';

class GuestsDatasource {
  final NetworkService _networkService;

  GuestsDatasource(this._networkService);

  // Future<ApiResponse<List<GuestModel>>> getAllGuests(
  //   int page,
  //   String? searchKey,
  //   RsvpStatus? status,
  //   // String? searchKey
  // ) async {
  //   try {
  //     final response = await _networkService.get(
  //       EndPoints.getGuests,
  //       queryParameters: {
  //         'page': page,
  //         'occasion': "OCC-2025-001",
  //         'rsvp_status': rsvpToApi(status ?? RsvpStatus.all),
  //         'search': searchKey,

  //         //  if(quickOrderOfferId!=null) "quick_order_offer_id": quickOrderOfferId
  //       },
  //     );
  //     return ApiResponse.fromJson(
  //       response.data,
  //       (json) => (json as List)
  //           .map((item) => GuestModel.fromJson(item as Map<String, dynamic>))
  //           .toList(),
  //     );
  //   } catch (e) {
  //     return ApiResponse.error(message: e.toString());
  //   }
  // }

  Future<ApiResponse<GuestModel>> getGuestDetails(String? inviteeId) async {
    try {
      final response = await _networkService.get(
        EndPoints.getGuestDetails,
        queryParameters: {'invitee_id': inviteeId},
      );
      return ApiResponse.fromJson(
        response.data,
        (json) => GuestModel.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      return ApiResponse.error(message: e.toString());
    }
  }

  Future<ApiResponse<UpdateGuestResponse>> updateGuest({
    required String inviteeId,
    required String whatsappNumber,
  }) async {
    try {
      final response = await _networkService.post(
        EndPoints.updateGuest,
        queryParameters: {
          'invitee_id': inviteeId,
          'whatsapp_number': whatsappNumber,
        },
      );
      return ApiResponse.fromJson(
        response.data,
        (json) => UpdateGuestResponse.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      return ApiResponse.error(message: e.toString());
    }
  }

  Future<ApiResponse<void>> deleteGuest({
    required String occasionId,
    required List<GuestModel> guests,
  }) async {
    try {
      final response = await _networkService.post(
        EndPoints.deleteGuest,
        // queryParameters: {'invitee_id': inviteeId},
        queryParameters: {
          // 'occasion_id': occasionId,
          // 'invitees_list': jsonEncode(guests.map((e) => e.toJson()).toList()),
          'invitees_list': jsonEncode(guests.map((e) => e.inviteeId).toList()),
        },
      );
      return ApiResponse.fromJson(
        response.data,
        (json) {},
      );
    } catch (e) {
      return ApiResponse.error(message: e.toString());
    }
  }

  Future<ApiResponse<UpdateGuestListRespone>> updateGuestList({
    required String occasionId,
    required List<GuestModel> guests,
  }) async {
    try {
      final response = await _networkService.post(
        EndPoints.updateGustsList,
        queryParameters: {
          'occasion_id': occasionId,
          'guest_list': jsonEncode(guests.map((e) => e.toJson()).toList()),
        },
      );
      return ApiResponse.fromJson(
        response.data,
        // (json) {},
        (json) => UpdateGuestListRespone.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      return ApiResponse.error(message: e.toString());
    }
  }
}
