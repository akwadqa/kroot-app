import 'package:flutter_contacts/flutter_contacts.dart' as flutterContact;
// import 'package:flutter_contacts/fluuter_contact.dart' as flutterContact;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wedding_app/features/event/data/models/create_event_request/create_event_request.dart';
import 'package:wedding_app/features/event/data/models/event_response/create_event_response.dart';
import 'package:wedding_app/features/event/data/models/events_response/event_response.dart';
import 'package:wedding_app/features/event/data/models/occasion_response/occasion_response.dart'
    hide GuestModel;
import 'package:wedding_app/features/event/data/repositories/home_repositories.dart';
import 'package:wedding_app/features/event/presentation/controller/home_state.dart';
import 'package:wedding_app/src/utils/image_picker.dart';
part 'home_controller.g.dart';

@riverpod
class HomeController extends _$HomeController {
  @override
  FutureOr<HomeState> build() {
    return HomeState.init();
  }

  int _currentPage = 1;
  int _totalPages = 1;
  List<Event> _eventsList = [];

  void clearEventScreen() {
    state = AsyncData(
      state.value!.copyWith(createEventRequest: CreateEventRequest()),
    );
  }

  void updateEvent(CreateEventRequest newData) {
    final current =
        state.value?.createEventRequest ?? const CreateEventRequest();

    state = AsyncData(
      state.value!.copyWith(
        createEventRequest: current.copyWith(
          type:
              newData.type ??
              current.type ??
              state.value?.eventResponse?.eventTypes.first,
          title: newData.title ?? current.title,
          date: newData.date ?? current.date,
          language: newData.language ?? current.language ?? 'arabic',
          map_link: newData.map_link ?? current.map_link,
          location_name: newData.location_name ?? current.location_name,
          show_qr: newData.show_qr ?? current.show_qr,
          image: newData.image ?? current.image,
          invite_template: newData.invite_template ?? current.invite_template,
          confirmed_template:
              newData.confirmed_template ?? current.confirmed_template,
          declined_template:
              newData.declined_template ?? current.declined_template,
          guest_list: setGuestListFromContacts() ?? current.guest_list,
        ),
      ),
    );
  }

  List<Map<String, dynamic>>? setGuestListFromContacts() {
    // List<Map<String,dynamic>>? setGuestListFromContacts() {
    final selectedContacts = state.value!.selectedContacts;
    return selectedContacts.map((s) {
      final nameParts = (s.contact.displayName ?? '').split(' ');
      final firstName = nameParts.isNotEmpty ? nameParts.first : null;
      final lastName = nameParts.length > 1
          ? nameParts.sublist(1).join(' ')
          : null;

      final number = (s.contact.phones.isNotEmpty)
          ? s.contact.phones.first.number
          : null;

      return GuestModel(
        first_name: firstName,
        last_name: lastName,
        whatsapp_number: number,
        party_size: s.count,
        // );
      ).toJson();
    }).toList();
  }

  void deleteSelectedContact(flutterContact.Contact contact) {
    final currentState = state.value!;

    final updatedList = currentState.selectedContacts
        .where((sc) => sc.contact.id != contact.id)
        .toList();

    state = AsyncData(currentState.copyWith(selectedContacts: updatedList));
  }

  void updateContactName(
    flutterContact.Contact contact,
    String firstName,
    String lastName,
  ) {
    final currentState = state.value!;
    final updatedList = currentState.selectedContacts.map((sc) {
      if (sc.contact.id == contact.id) {
        final updatedContact = flutterContact.Contact(
          id: sc.contact.id,
          name: flutterContact.Name(first: firstName, last: lastName),
          phones: sc.contact.phones,
          emails: sc.contact.emails,
          displayName: "$firstName $lastName",
        );

        return sc.copyWith(contact: updatedContact);
      }
      return sc;
    }).toList();

    state = AsyncData(currentState.copyWith(selectedContacts: updatedList));
  }

  void selectContact(flutterContact.Contact contact) {
    final currentState = state.value!;
    List<SelectedContact> selectedList = currentState.selectedContacts;

    final exists = selectedList.any((c) => c.contact.id == contact.id);

    if (exists) {
      selectedList = selectedList
          .where((c) => c.contact.id != contact.id)
          .toList();
    } else {
      selectedList = [
        ...selectedList,
        SelectedContact(contact: contact, count: 0),
      ];
    }

    state = AsyncData(currentState.copyWith(selectedContacts: selectedList));
  }

  void incrementCount(flutterContact.Contact contact) {
    final currentState = state.value!;
    final updatedList = currentState.selectedContacts.map((sc) {
      if (sc.contact.id == contact.id) {
        return sc.copyWith(count: sc.count + 1);
      }
      return sc;
    }).toList();

    state = AsyncData(currentState.copyWith(selectedContacts: updatedList));
  }

  void decrementCount(flutterContact.Contact contact) {
    final currentState = state.value!;
    final updatedList = currentState.selectedContacts.map((sc) {
      if (sc.contact.id == contact.id && sc.count > 0) {
        return sc.copyWith(count: sc.count - 1);
      }
      return sc;
    }).toList();

    state = AsyncData(currentState.copyWith(selectedContacts: updatedList));
  }

  Future<void> addNewContact({
    required String name,
    required String phoneNumber,
  }) async {
    try {
      state = AsyncData(state.value!.copyWith(isAddContact: true));

      state = AsyncLoading();

      final granted = await flutterContact.FlutterContacts.requestPermission();
      if (!granted) {
        state = AsyncError('The permission has denied', StackTrace.current);
        return;
      }

      final newContact = flutterContact.Contact()
        ..name.first = name
        ..phones = [flutterContact.Phone(phoneNumber)];

      await flutterContact.FlutterContacts.insertContact(newContact);

      final currentContacts = state.value!.contacts;
      final updatedList = [...currentContacts, newContact];

      state = AsyncData(
        state.value!.copyWith(contacts: updatedList, isAddContact: false),
      );
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> getContacts(String? search) async {
    state = !state.value!.isAddContact!
        ? const AsyncLoading()
        : AsyncData(state.value!);

    final granted = await flutterContact.FlutterContacts.requestPermission();
    if (!granted) {
      state = AsyncError('The permission has denied', StackTrace.current);
      return;
    }

    final contacts = await flutterContact.FlutterContacts.getContacts(
      withProperties: true,
    );
    state = AsyncData(
      state.value!.copyWith(
        contacts: search == null
            ? contacts
            : contacts
                  .where(
                    (c) =>
                        c.displayName.toLowerCase().contains(
                          search.toLowerCase(),
                        ) ||
                        c.phones.any((p) => p.number.contains(search)),
                  )
                  .toList(),
      ),
    );
  }

  Future<OccasionModel?> getEventDetails(String id) async {
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

  Future<EventsResponse?> getUserEvents({
    required int page,
    String? search,
    bool showLoading = true,
  }) async {
    try {
      if (showLoading) state = AsyncLoading();
      final repo = ref.read(homeRepositoryProvider);
      final response = await repo.getEvents(page, search);
      _currentPage = response.pagination?.currentPage ?? _currentPage;
      _totalPages = response.pagination?.totalPages ?? _totalPages;

      if (page == 1) {
        _eventsList = List.from(response.data?.events ?? []);
      } else {
        _eventsList.addAll((response.data?.events ?? []) as Iterable<Event>);
      }

      if (response.hasFailed) {
        state = AsyncError(
          response.message ?? '',
          StackTrace.fromString(response.message ?? ''),
        );
        throw Exception(response.message);
      }
      final eventResponse = EventsResponse(
        events: _eventsList,
        eventTypes: response.data!.eventTypes,
      );

      state = AsyncData(state.value!.copyWith(eventResponse: eventResponse));
      return response.data;
    } catch (e, st) {
      state = AsyncError(e, st);
      return null;
    }
  }

  Future<CreateEventResponse?> createEvent() async {
    try {
      state = AsyncData(state.value!.copyWith(isCreatingEvent: true));
      state = AsyncLoading();
      final repo = ref.read(homeRepositoryProvider);
      final response = await repo.createEvent(state.value!.createEventRequest!);

      if (response.hasFailed) {
        state = AsyncError(
          response.message ?? '',
          StackTrace.fromString(response.message ?? ''),
        );

        state = AsyncData(state.value!.copyWith(isCreatingEvent: true));
        // throw Exception(response.message);
      }

      // state = AsyncData(state.value!.copyWith(eventResponse: eventResponse));
      state = AsyncData(
        state.value!.copyWith(
          isCreatingEvent: false,
          createEventResponse: response.data,
        ),
      );
      return response.data;
    } catch (e, st) {
      state = AsyncError(e, st);
      state = AsyncData(state.value!.copyWith(isCreatingEvent: false));
      return null;
    }
  }

  Future<bool> onLoadMoreEvents() async {
    if (_currentPage >= _totalPages) return false;
    final nextPage = _currentPage + 1;
    final result = await getUserEvents(showLoading: false, page: nextPage);
    return result?.events.isNotEmpty ?? false;
  }
}
