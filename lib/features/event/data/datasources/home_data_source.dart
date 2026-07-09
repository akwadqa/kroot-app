import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:kroot_app/features/event/data/models/add_guests_response/add_guests_response.dart';
import 'package:kroot_app/features/event/data/models/delete_handler_response/delete_handler_response.dart';
import 'package:kroot_app/features/event/data/models/event_response/create_event_response.dart';
import 'package:kroot_app/features/event/data/models/get_user_events/get_user_events_model.dart';
import 'package:kroot_app/features/event/data/models/retry_bulk_response/retry_bulk_response.dart';
import 'package:kroot_app/features/event/data/models/update_handlers_response/update_handlers_response.dart';
import 'package:kroot_app/features/event/data/models/utils_response/utils_response.dart';
import 'package:kroot_app/src/constants/Api/api_response.dart';
import 'package:kroot_app/src/constants/Api/end_points.dart';
import 'package:kroot_app/src/network/services/network_service.dart';

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
          if (event.operators != null && (event.operators?.isNotEmpty ?? false))
            'operator_list': jsonEncode(
              event.operators!.map((e) => e.whatsappNumber).toList(),
            ),
        },
        ...{
          if (event.handlers != null && (event.handlers?.isNotEmpty ?? false))
            'handler_list': jsonEncode(
              event.handlers!.map((e) => e.toJson()).toList(),
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
        'image': event.image != null
            ? await MultipartFile.fromFile(event.image!.path)
            : null,
        ...(event.toJson()
          ..remove('image_url')
          ..remove('handlers')
          ..remove('operators')),
        ...{
          if (event.guests != null && (event.guests?.isNotEmpty ?? false))
            'guest_list': jsonEncode(
              event.guests!.map((e) => e.toJson()).toList(),
            ),
        },
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

  Future<ApiResponse<RetryBulkResponse>> resendFailue(String occasionId) async {
    try {
      final data = FormData.fromMap({'occasion_id': occasionId});
      final response = await _networkService.post(
        EndPoints.resendFailed,
        data: data,
      );
      return ApiResponse.fromJson(
        response.data,
        (json) => RetryBulkResponse.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      return ApiResponse.error(message: e.toString());
    }
  }

  Future<ApiResponse<EventModel>> confirmEvent(String occasionId) async {
    try {
      final data = FormData.fromMap({'occasion_id': occasionId});
      final response = await _networkService.post(
        EndPoints.confirmEvent,
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

  Future<ApiResponse<UtilsResponse>> getUtils() async {
    try {
      final response = await _networkService.post(EndPoints.getUtils);
      return ApiResponse.fromJson(
        response.data,
        (json) => UtilsResponse.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      return ApiResponse.error(message: e.toString());
    }
  }

  Future<ApiResponse<UpdateHandlersResponse>> updateHandlers(
    String id,
    List<HandlerModel> handlers,
  ) async {
    try {
      final data = FormData.fromMap({
        'occasion_id': id,
        'handlers': jsonEncode(handlers.map((e) => e.toJson()).toList()),
      });
      final response = await _networkService.post(
        EndPoints.updateHandlers,
        data: data,
      );
      return ApiResponse.fromJson(
        response.data,
        (json) => UpdateHandlersResponse.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      return ApiResponse.error(message: e.toString());
    }
  }

  Future<ApiResponse<DeleteHandlerResponse>> deleteHandlers(
    String id,
    List<HandlerModel> handlers,
  ) async {
    try {
      final data = FormData.fromMap({
        'occasion_id': id,
        'handlers': jsonEncode(handlers.map((e) => e.toJson()).toList()),
      });
      final response = await _networkService.post(
        EndPoints.deleteHandlers,
        data: data,
      );
      return ApiResponse.fromJson(
        response.data,
        (json) => DeleteHandlerResponse.fromJson(json as Map<String, dynamic>),
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
      int page, String? search, String type, String filter) async {
    try {
      final data = FormData.fromMap({
        'page_no': page.toString(),
        'search': search,
        'limit': 10,
        'list_type': type,
        if (filter.isNotEmpty && filter != 'All')
          type == 'kroot' ? 'category' : 'status': filter,
      });

      print(data.fields);
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
