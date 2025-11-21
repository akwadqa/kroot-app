import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:kroot_app/features/event/data/models/confirm_event_response/confirm_event_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:kroot_app/features/event/data/datasources/home_data_source.dart';
import 'package:kroot_app/features/event/data/models/add_guests_response/add_guests_response.dart';
import 'package:kroot_app/features/event/data/models/create_event_request/create_event_request.dart';
import 'package:kroot_app/features/event/data/models/event_response/create_event_response.dart';
import 'package:kroot_app/features/event/data/models/events_response/event_response.dart';
import 'package:kroot_app/features/event/data/models/get_user_events/get_user_events_model.dart';
import 'package:kroot_app/features/event/data/models/occasion_response/occasion_response.dart';
import 'package:kroot_app/src/constants/Api/api_response.dart';
import 'package:kroot_app/src/network/check_net/check_net.dart';
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
    return CheckNet<ApiResponse<GetUserEventsModel>>().checkNetResponse(
      tryRight: () async {
        final respone = await _dataSource.getUserEvents(page, search);
        return respone;
      },
    );
  }

  Future<ApiResponse<void>> deleteEvent(String occasionId) async {
    return CheckNet<ApiResponse<void>>().checkNetResponse(
      tryRight: () async {
        final respone = await _dataSource.deleteEvent(occasionId);
        return respone;
      },
    );
  }

  Future<ApiResponse<AddGuestsResponse>> addGeusts(
    String occasionId,
    List<Map<String, dynamic>> gustsList,
  ) async {
    return CheckNet<ApiResponse<AddGuestsResponse>>().checkNetResponse(
      tryRight: () async {
        final respone = await _dataSource.addGeusts(occasionId, gustsList);
        return respone;
      },
    );
  }

  Future<ApiResponse<ConfirmEventResponse>> confirmEvent(
    String occasionId,
  ) async {
    return CheckNet<ApiResponse<ConfirmEventResponse>>().checkNetResponse(
      tryRight: () async {
        final respone = await _dataSource.confirmEvent(occasionId);
        return respone;
      },
    );
  }

  Future<ApiResponse<CreateEventResponse>> createEvent(
    EventModel event,
  ) async {
    return CheckNet<ApiResponse<CreateEventResponse>>().checkNetResponse(
      tryRight: () async {
        final respone = await _dataSource.createEvent(event);
        return respone;
      },
    );
  }

  Future<ApiResponse<CreateEventResponse>> updateEvent(
    EventModel event,
    String id,
  ) async {
    return CheckNet<ApiResponse<CreateEventResponse>>().checkNetResponse(
      tryRight: () async {
        final respone = await _dataSource.updateEvent(event,id);
        return respone;
      },
    );
  }

  Future<ApiResponse<EventModel>> getEventDetails(String id) async {
    return CheckNet<ApiResponse<EventModel>>().checkNetResponse(
      tryRight: () async {
        final respone = await _dataSource.getEventDetails(id);
        return respone;
      },
    );
  }
}
