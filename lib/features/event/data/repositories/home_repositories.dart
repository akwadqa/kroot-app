import 'package:dio/dio.dart';
import 'package:kroot_app/features/event/data/models/delete_handler_response/delete_handler_response.dart';
import 'package:kroot_app/features/event/data/models/update_handlers_response/update_handlers_response.dart';
import 'package:kroot_app/features/event/data/models/utils_response/utils_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:kroot_app/features/event/data/datasources/home_data_source.dart';
import 'package:kroot_app/features/event/data/models/add_guests_response/add_guests_response.dart';
import 'package:kroot_app/features/event/data/models/event_response/create_event_response.dart';
import 'package:kroot_app/features/event/data/models/get_user_events/get_user_events_model.dart';
import 'package:kroot_app/src/constants/Api/api_response.dart';
import 'package:kroot_app/src/network/services/dio_client.dart';

part 'home_repositories.g.dart';

@Riverpod(keepAlive: true)
HomeRepositories homeRepository(Ref ref) {
  final networkService = ref.watch(networkServiceProvider());
  return HomeRepositories(HomeDataSource(networkService));
}

class HomeRepositories {
  final HomeDataSource _dataSource;

  HomeRepositories(this._dataSource);

  Future<ApiResponse<GetUserEventsModel>> getEvents(
    int page,
    String? search,
  ) async {
    try {
      final respone = await _dataSource.getUserEvents(page, search);
      return respone;
    } on DioException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<ApiResponse<void>> deleteEvent(String occasionId) async {
    try {
      final respone = await _dataSource.deleteEvent(occasionId);
      return respone;
    } on DioException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<ApiResponse<AddGuestsResponse>> addGeusts(
    String occasionId,
    List<Map<String, dynamic>> gustsList,
  ) async {
    try {
      final respone = await _dataSource.addGeusts(occasionId, gustsList);
      return respone;
    } on DioException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
  Future<ApiResponse<UpdateHandlersResponse>> updateHandlers(
    String occasionId,
    List<HandlerModel> handlers,
  ) async {
    try {
      final respone = await _dataSource.updateHandlers(occasionId, handlers);
      return respone;
    } on DioException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
  Future<ApiResponse<DeleteHandlerResponse>> deleteHandlers(
    String occasionId,
    List<HandlerModel> handlers,
  ) async {
    try {
      final respone = await _dataSource.deleteHandlers(occasionId, handlers);
      return respone;
    } on DioException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<ApiResponse<EventModel>> confirmEvent(String occasionId) async {
    try {
      final respone = await _dataSource.confirmEvent(occasionId);
      return respone;
    } on DioException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<ApiResponse<UtilsResponse>> getUtils() async {
    try {
      final respone = await _dataSource.getUtils();
      return respone;
    } on DioException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<ApiResponse<CreateEventResponse>> createEvent(EventModel event) async {
    try {
      final respone = await _dataSource.createEvent(event);
      return respone;
    } on DioException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<ApiResponse<CreateEventResponse>> updateEvent(
    EventModel event,
    String id,
  ) async {
    try {
      final respone = await _dataSource.updateEvent(event, id);
      return respone;
    } on DioException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<ApiResponse<EventModel>> getEventDetails(String id) async {
    try {
      final respone = await _dataSource.getEventDetails(id);
      return respone;
    } on DioException {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
