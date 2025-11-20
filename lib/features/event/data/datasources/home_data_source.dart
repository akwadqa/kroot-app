import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:wedding_app/features/event/data/models/add_guests_response/add_guests_response.dart';
import 'package:wedding_app/features/event/data/models/confirm_event_response/confirm_event_response.dart';
import 'package:wedding_app/features/event/data/models/create_event_request/create_event_request.dart';
import 'package:wedding_app/features/event/data/models/event_response/create_event_response.dart';
import 'package:wedding_app/features/event/data/models/events_response/event_response.dart';
import 'package:wedding_app/features/event/data/models/get_user_events/get_user_events_model.dart';
import 'package:wedding_app/features/event/data/models/occasion_response/occasion_response.dart';
import 'package:wedding_app/src/constants/Api/api_response.dart';
import 'package:wedding_app/src/constants/Api/end_points.dart';
import 'package:wedding_app/src/network/services/network_service.dart';

class HomeDataSource {
  final NetworkService _networkService;

  HomeDataSource(this._networkService);

  Future<ApiResponse<CreateEventResponse>> createEvent(EventModel event) async {
    try {
      final data = FormData.fromMap({
        ...event.toJson(),
        ...{
          if (event.guests != null && (event.guests?.isNotEmpty ?? false))
            'guest_list': jsonEncode(
              event.guests!.map((e) => e.toJson()).toList(),
            ),
        },
        ...{
          if (event.image != null)
            'image': await MultipartFile.fromFile(event.image!.path),
        },
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

  Future<ApiResponse<CreateEventResponse>> updateEvent(
    EventModel event,
    String id,
  ) async {
    try {
      final data = FormData.fromMap({
        'occasion_id': id,
        // 'image': (await MultipartFile.fromFile(event.image?.path) ?? null),
        'image': event.image != null
            ? await MultipartFile.fromFile(event.image!.path)
            : null,
        ...event.toJson(),
        ...{
          if (event.guests != null && (event.guests?.isNotEmpty ?? false))
            'guest_list': jsonEncode(
              event.guests!.map((e) => e.toJson()).toList(),
            ),
        },

        // ...{
        //   if (event.image != null)
        //     'image': await MultipartFile.fromFile(event.image!.path),
        // },
      });
      final response = await _networkService.post(
        EndPoints.updateEvent,
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

  Future<ApiResponse<void>> deleteEvent(String occasionId) async {
    try {
      final data = FormData.fromMap({'occasion_id': occasionId});
      final response = await _networkService.post(
        EndPoints.deleteEvent,
        data: data,
      );
      return ApiResponse.fromJson(response.data, (json) {});
    } catch (e) {
      return ApiResponse.error(message: e.toString());
    }
  }

  Future<ApiResponse<ConfirmEventResponse>> confirmEvent(
    String occasionId,
  ) async {
    try {
      final data = FormData.fromMap({'occasion_id': occasionId});
      final response = await _networkService.post(
        EndPoints.confirmEvent,
        data: data,
      );
      return ApiResponse.fromJson(
        response.data,
        (json) => ConfirmEventResponse.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      return ApiResponse.error(message: e.toString());
    }
  }

  Future<ApiResponse<EventModel>> getEventDetails(String id) async {
    try {
      final data = FormData.fromMap({'occasion_id': id});
      final response = await _networkService.get(
        EndPoints.getEventDetails,
        data: data,
      );
      return ApiResponse.fromJson(
        response.data,
        (json) => EventModel.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      return ApiResponse.error(message: e.toString());
    }
  }

  Future<ApiResponse<AddGuestsResponse>> addGeusts(
    String id,
    List<Map<String, dynamic>> gustsList,
  ) async {
    try {
      final data = FormData.fromMap({
        'occasion_id': id,
        // "guest_list": gustsList,
        //  if (event.guests != null && (event.guests?.isNotEmpty ?? false))
        'guest_list': jsonEncode(gustsList.map((e) => e).toList()),
      });
      final response = await _networkService.post(
        EndPoints.addGuestToEvent,
        data: data,
      );
      return ApiResponse.fromJson(
        response.data,
        (json) => AddGuestsResponse.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      return ApiResponse.error(message: e.toString());
    }
  }

  Future<ApiResponse<GetUserEventsModel>> getUserEvents(
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
        (json) => GetUserEventsModel.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      return ApiResponse.error(message: e.toString());
    }
  }
}
