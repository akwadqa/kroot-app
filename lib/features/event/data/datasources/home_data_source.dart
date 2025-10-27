import 'package:dio/dio.dart';
import 'package:wedding_app/features/event/data/models/create_event_request/create_event_request.dart';
import 'package:wedding_app/features/event/data/models/event_response/create_event_response.dart';
import 'package:wedding_app/features/event/data/models/events_response/event_response.dart';
import 'package:wedding_app/features/event/data/models/occasion_response/occasion_response.dart';
import 'package:wedding_app/src/constants/Api/api_response.dart';
import 'package:wedding_app/src/constants/Api/end_points.dart';
import 'package:wedding_app/src/network/services/network_service.dart';

class HomeDataSource {
  final NetworkService _networkService;

  HomeDataSource(this._networkService);

  Future<ApiResponse<CreateEventResponse>> createEvent(
    CreateEventRequest event,
  ) async {
    try {
      final data = FormData.fromMap({
        ...event.toJson(),
        ...{'image': await MultipartFile.fromFile(event.image!.path)},
      });
      final response = await _networkService.post(
        EndPoints.createEvent,
        data: data,
      );
      return ApiResponse.fromJson(
        response.data,
        (json) => CreateEventResponse.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      return ApiResponse.error(message: e.toString());
    }
  }

  Future<ApiResponse<OccasionModel>> getEventDetails(String id) async {
    try {
      final data = FormData.fromMap({'occasion_id': id});
      final response = await _networkService.get(
        EndPoints.getEventDetails,
        data: data,
      );
      return ApiResponse.fromJson(
        response.data,
        (json) => OccasionModel.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      return ApiResponse.error(message: e.toString());
    }
  }

  Future<ApiResponse<EventsResponse>> getUserEvents(
    int page,
    String? search,
  ) async {
    try {
      final data = FormData.fromMap({
        'page_no': page.toString(),
        'search': search,
        'limit': 10,
      });
      final response = await _networkService.get(
        EndPoints.getEvents,
        data: data,
      );
      return ApiResponse.fromJson(
        response.data,
        (json) => EventsResponse.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      return ApiResponse.error(message: e.toString());
    }
  }
}
