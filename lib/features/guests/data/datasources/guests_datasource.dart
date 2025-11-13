import 'package:kroot_app/features/guests/domain/model/guest_model.dart';
import 'package:kroot_app/src/constants/Api/api_response.dart';
import 'package:kroot_app/src/constants/Api/end_points.dart';

import 'package:kroot_app/src/network/services/network_service.dart';

class GuestsDatasource {
  final NetworkService _networkService;

  GuestsDatasource(this._networkService);

  Future<ApiResponse<List<GuestModel>>> getAllGuests(
    int page,
    String? searchKey,
    RsvpStatus? status,
    // String? searchKey
  ) async {
    try {
      final response = await _networkService.get(
        EndPoints.getGuests,
        queryParameters: {
          'page': page,
          'occasion': "OCC-2025-001",
          'rsvp_status':  rsvpToApi(status??RsvpStatus.all),
          'search': searchKey,
        //  if(quickOrderOfferId!=null) "quick_order_offer_id": quickOrderOfferId

        },
      );
      return ApiResponse.fromJson(
        response.data,
        (json) => (json as List)
            .map((item) =>
                GuestModel.fromJson(item as Map<String, dynamic>))
            .toList(),
      );
    } catch (e) {
      return ApiResponse.error(message: e.toString());
    }
  }

  Future<ApiResponse<GuestModel>> getGuestDetails(

    String? inviteeId,
  ) async {
    try {
      final response = await _networkService.get(
        EndPoints.getGuestDetails,
        queryParameters: {
          'invitee_id':inviteeId ,
        },
      );
      return ApiResponse.fromJson(
        response.data,
        (json) => 
                GuestModel.fromJson(json as Map<String, dynamic>)
      );
    } catch (e) {
      return ApiResponse.error(message: e.toString());
    }
  }

}
