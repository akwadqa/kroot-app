import 'package:kroot_app/features/event/data/models/utils_response/utils_response.dart';
// import 'package:flutter_contacts/fluuter_contact.dart' as flutterContact;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:kroot_app/features/event/data/models/get_user_events/get_user_events_model.dart';
import 'package:kroot_app/features/event/data/repositories/home_repositories.dart';
import 'package:kroot_app/features/event/presentation/controller/home_state.dart';
part 'home_controller.g.dart';

@Riverpod(keepAlive: true)
class HomeController extends _$HomeController {
  @override
  Future<HomeState> build() async {
    state = AsyncData(HomeState.init());
    Future(() async {
      getUserEvents(page: 1);
      getUtils();
    });
    return HomeState.init();
  }

  int _currentPage = 1;
  int _totalPages = 1;
  List<EventModel> _eventsList = [];

  Future<UtilsResponse?> getUtils() async {
    try {
      state = AsyncData(state.value!.copyWith(utilsResponse: AsyncLoading()));
      final repo = ref.read(homeRepositoryProvider);
      final response = await repo.getUtils();

      if (response.hasFailed) {
        state = AsyncData(
          state.value!.copyWith(
            utilsResponse: AsyncError(
              response.message ?? '',
              StackTrace.fromString(response.message ?? ''),
            ),
          ),
        );
        throw Exception(response.message);
      }

      state = AsyncData(
        state.value!.copyWith(utilsResponse: AsyncData(response.data!)),
      );
      return response.data;
    } catch (e, st) {
      state = AsyncData(
        state.value!.copyWith(utilsResponse: AsyncError(e, st)),
      );
      return null;
    }
  }

  Future<EventModel?> getEventDetails(String id) async {
    try {
      state = AsyncData(state.value!.copyWith(occasionModel: AsyncLoading()));
      final repo = ref.read(homeRepositoryProvider);
      final response = await repo.getEventDetails(id);

      if (response.hasFailed) {
        state = AsyncData(
          state.value!.copyWith(
            occasionModel: AsyncError(
              response.message ?? '',
              StackTrace.fromString(response.message ?? ''),
            ),
          ),
        );
        throw Exception(response.message);
      }

      state = AsyncData(
        state.value!.copyWith(occasionModel: AsyncData(response.data!)),
      );
      return response.data;
    } catch (e, st) {
      state = AsyncData(
        state.value!.copyWith(occasionModel: AsyncError(e, st)),
      );
      return null;
    }
  }

  // List<EventModel> _updatedList = [];

  
    Future<bool> refreshEvents() async {
    _eventsList.clear();
    _currentPage = 1;
    _totalPages = 1;
    await getUserEvents(page: 1, showLoading: true);
    return true;
  }

  Future<GetUserEventsModel?> getUserEvents({
    required int page,
    String? search,
    bool showLoading = true,
  }) async {
    print("Fetching page: $page");

    try {
      // if (showLoading) state = AsyncLoading();
      if (showLoading) {
        state = AsyncData(state.value!.copyWith(eventResponse: AsyncLoading()));
      }
      final repo = ref.read(homeRepositoryProvider);
      final response = await repo.getEvents(page, search);

      _currentPage = response.pagination?.currentPage ?? _currentPage;
      _totalPages = response.pagination?.totalPages ?? _totalPages;

      if (page == 1) {
        // _updatedList = [..._eventsList, ...List.from(response.data!.events!)];
        _eventsList = List.from(response.data!.events!);
      } else {
        // _updatedList = [..._eventsList, ...List.from(response.data!.events!)];

        // _eventsList.addAll((response.data?.events) as Iterable<EventModel>);
        _eventsList = [..._eventsList, ...List.from(response.data!.events!)];
      }

      if (response.hasFailed || response.data == null) {
        state = AsyncData(
          state.value!.copyWith(
            eventResponse: AsyncError(
              response.message ?? '',
              StackTrace.fromString(response.message ?? ''),
            ),
          ),
        );
        // throw Exception(response.message);
        return null;
      }
      final eventResponse = GetUserEventsModel(
        events: _eventsList,
        // events: _updatedList,
        // eventTypes: response.data!.eventTypes,
      );

      state = AsyncData(
        state.value!.copyWith(eventResponse: AsyncData(eventResponse)),
      );
      return response.data;
    } catch (e, st) {
      state = AsyncData(
        state.value!.copyWith(eventResponse: AsyncError(e.toString(), st)),
      );
      return null;
    }
  }

  Future<void> deleteEvent(String occasionId) async {
    try {
      state = AsyncData(state.value!.copyWith(isDeleteEvent: true));
      state = AsyncLoading();
      final repo = ref.read(homeRepositoryProvider);
      final response = await repo.deleteEvent(occasionId);

      if (response.hasFailed) {
        state = AsyncError(
          response.message ?? '',
          StackTrace.fromString(response.message ?? ''),
        );

        state = AsyncData(state.value!.copyWith(isDeleteEvent: true));
      }

      // state = AsyncData(state.value!.copyWith(eventResponse: eventResponse));
      state = AsyncData(state.value!.copyWith(isDeleteEvent: true));
    } catch (e, st) {
      state = AsyncError(e, st);
      state = AsyncData(state.value!.copyWith(isDeleteEvent: true));
    }
  }

  Future<EventModel?> confirmEvent(String occasionId) async {
    try {
      state = AsyncData(
        state.value!.copyWith(confirmEventResponse: AsyncLoading()),
      );
      final repo = ref.read(homeRepositoryProvider);
      final response = await repo.confirmEvent(occasionId);

      if (response.hasFailed) {
        state = AsyncData(
          state.value!.copyWith(
            confirmEventResponse: AsyncError(
              response.message ?? '',
              StackTrace.fromString(response.message ?? ''),
            ),
          ),
        );
        return null;
      }

      // state = AsyncData(state.value!.copyWith(eventResponse: eventResponse));
      state = AsyncData(
        state.value!.copyWith(confirmEventResponse: AsyncData(response.data!)),
      );
      return response.data;
    } catch (e, st) {
      state = AsyncData(
        state.value!.copyWith(confirmEventResponse: AsyncError(e, st)),
      );
      return null;
    }
  }

  Future<bool> onLoadMoreEvents() async {
    print("Load More Called: $_currentPage / $_totalPages");
    if (_currentPage >= _totalPages) return false;
    final nextPage = _currentPage + 1;
    final result = await getUserEvents(showLoading: false, page: nextPage);
    return result?.events?.isNotEmpty ?? false;
  }

  void updateOccasionModel(EventModel eventModel) {
    state = AsyncData(
      state.value!.copyWith(occasionModel: AsyncData(eventModel)),
    );
  }
}
