import 'package:flutter_contacts/flutter_contacts.dart' as flutterContact;
import 'package:kroot_app/features/event/data/models/confirm_event_response/confirm_event_response.dart';
import 'package:uuid/uuid.dart';
// import 'package:flutter_contacts/fluuter_contact.dart' as flutterContact;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:kroot_app/features/event/data/models/create_event_request/create_event_request.dart';
import 'package:kroot_app/features/event/data/models/event_response/create_event_response.dart';
import 'package:kroot_app/features/event/data/models/events_response/event_response.dart';
import 'package:kroot_app/features/event/data/models/get_user_events/get_user_events_model.dart';
import 'package:kroot_app/features/event/data/repositories/home_repositories.dart';
import 'package:kroot_app/features/event/presentation/controller/home_state.dart';
import 'package:kroot_app/src/utils/image_picker.dart';
part 'home_controller.g.dart';

@Riverpod(keepAlive: true)
class HomeController extends _$HomeController {
  @override
  Future<HomeState> build() async {
    state = AsyncData(HomeState.init());
    Future(() => getUserEvents(page: 1));
    return HomeState.init();
  }

  int _currentPage = 1;
  int _totalPages = 1;
  List<EventModel> _eventsList = [];

  Future<EventModel?> getEventDetails(String id) async {
    try {
      state = AsyncLoading();
      final repo = ref.read(homeRepositoryProvider);
      final response = await repo.getEventDetails(id);

      if (response.hasFailed) {
        state = AsyncError(
          response.message ?? '',
          StackTrace.fromString(response.message ?? ''),
        );
        throw Exception(response.message);
      }

      state = AsyncData(state.value!.copyWith(occasionModel: response.data));
      return response.data;
    } catch (e, st) {
      state = AsyncError(e, st);
      return null;
    }
  }

  Future<GetUserEventsModel?> getUserEvents({
    required int page,
    String? search,
    bool showLoading = true,
  }) async {
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
        _eventsList = List.from(response.data?.events ?? []);
      } else {
        _eventsList.addAll(
          (response.data?.events ?? []) as Iterable<EventModel>,
        );
      }

      if (response.hasFailed) {
        state = AsyncData(
          state.value!.copyWith(
            eventResponse: AsyncError(
              response.message ?? '',
              StackTrace.fromString(response.message ?? ''),
            ),
          ),
        );
        throw Exception(response.message);
      }
      final eventResponse = GetUserEventsModel(
        events: _eventsList,
        eventTypes: response.data!.eventTypes,
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

  Future<ConfirmEventResponse?> confirmEvent(String occasionId) async {
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
    if (_currentPage >= _totalPages) return false;
    final nextPage = _currentPage + 1;
    final result = await getUserEvents(showLoading: false, page: nextPage);
    return result?.events?.isNotEmpty ?? false;
  }
}
