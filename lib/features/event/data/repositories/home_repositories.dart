import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wedding_app/features/event/data/datasources/home_data_source.dart';
import 'package:wedding_app/features/event/data/models/create_event_request/create_event_request.dart';
import 'package:wedding_app/features/event/data/models/event_response/create_event_response.dart';
import 'package:wedding_app/features/event/data/models/events_response/event_response.dart';
import 'package:wedding_app/features/event/data/models/occasion_response/occasion_response.dart';
import 'package:wedding_app/src/constants/Api/api_response.dart';
import 'package:wedding_app/src/network/check_net/check_net.dart';
import 'package:wedding_app/src/network/services/dio_client.dart';

part 'home_repositories.g.dart';

@Riverpod(keepAlive: true)
HomeRepositories homeRepository(Ref ref) {
  final networkService = ref.watch(networkServiceProvider());
  return HomeRepositories(HomeDataSource(networkService));
}

class HomeRepositories {
  final HomeDataSource _dataSource;

  HomeRepositories(this._dataSource);

  Future<ApiResponse<EventsResponse>> getEvents(int page , String? search) async {
    return CheckNet<ApiResponse<EventsResponse>>().checkNetResponse(
      tryRight: () async {
        final respone = await _dataSource.getUserEvents(page,search);
        return respone;
      },
    );
  }

  Future<ApiResponse<CreateEventResponse>> createEvent(CreateEventRequest event) async {
    return CheckNet<ApiResponse<CreateEventResponse>>().checkNetResponse(
      tryRight: () async {
        final respone = await _dataSource.createEvent(event);
        return respone;
      },
    );
  }

  Future<ApiResponse<OccasionModel>> getEventDetails(String id) async {
    return CheckNet<ApiResponse<OccasionModel>>().checkNetResponse(
      tryRight: () async {
        final respone = await _dataSource.getEventDetails(id);
        return respone;
      },
    );
  }
}
