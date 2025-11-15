import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:wedding_app/features/event/data/models/event_response/create_event_response.dart';
import 'package:wedding_app/features/event/data/models/get_user_events/get_user_events_model.dart';
import 'package:wedding_app/features/event/data/repositories/home_repositories.dart';
import 'package:wedding_app/features/event/presentation/controller/add_event/add_event_state.dart';
import 'package:wedding_app/features/event/presentation/controller/home_controller.dart';
import 'package:wedding_app/features/event/presentation/controller/home_state.dart';

part 'add_event_controller.g.dart';

@riverpod
class AddEventController extends _$AddEventController {
  @override
  FutureOr<AddEventState> build() {
    return AddEventState.init();
  }

  //? This for clear all data when create event :
  void clearEventScreen() {
    state = AsyncData(state.value!.copyWith(eventModel: EventModel()));
  }

  //? This for update contact name :
  void updateContactName(Contact contact, String firstName, String lastName) {
    final currentState = state.value!;
    final updatedList = currentState.selectedContacts?.map((sc) {
      if (sc.contact.name.first == contact.name.first &&
          sc.contact.name.last == contact.name.last&&
          sc.contact.phones.first == contact.phones.first
          ) {
        final updatedContact = Contact(
          id: sc.contact.id,
          name: Name(first: firstName, last: lastName),
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

  void updateEvent(EventModel newData) {
    // final current = EventModel();
    final current = state.value?.eventModel ?? EventModel();

    final firstType = ref
        .read(homeControllerProvider)
        .value
        ?.eventResponse
        ?.eventTypes
        ?.first;

    state = AsyncData(
      state.value!.copyWith(
        eventModel: current.copyWith(
          type: newData.type ?? current.type ?? firstType,
          title: newData.title ?? current.title,
          date: newData.date ?? current.date,
          language: newData.language ?? current.language ?? 'Arabic',
          mapLink: newData.mapLink ?? current.mapLink,
          locationName: newData.locationName ?? current.locationName,
          showQr: newData.showQr ?? current.showQr,
          image: newData.image ?? current.image,
          // inviteTemplate: newData.inviteTemplate ?? current.inviteTemplate,
          inviteTemplate: 'Kroot Invite-',
          confirmedTemplate:
              newData.confirmedTemplate ?? current.confirmedTemplate,
          declinedTemplate:
              newData.declinedTemplate ?? current.declinedTemplate,
          guests: setGuestListFromContacts() ?? current.guests,
        ),
      ),
    );
  }

  //? This for change the contact to gust model :
  List<GuestModel>? setGuestListFromContacts() {
    final selectedContacts = state.value!.selectedContacts;
    return selectedContacts?.map((s) {
      final nameParts = (s.contact.displayName ?? '').split(' ');
      final firstName = nameParts.isNotEmpty ? nameParts.first : null;
      final lastName = nameParts.length > 1
          ? nameParts.sublist(1).join(' ')
          : null;

      final number = (s.contact.phones.isNotEmpty)
          ? s.contact.phones.first.number
          : null;
      // return {};

      return GuestModel(
        firstName: firstName,
        lastName: lastName,
        whatsappNumber: number,
        partySize: s.count,
      );
    }).toList();
  }

  //? This for unchecked contact :
  void deleteSelectedContact(Contact contact) {
    final currentState = state.value!;

    final updatedList = currentState.selectedContacts!
        .where((sc) => sc.contact.id != contact.id)
        .toList();

    state = AsyncData(currentState.copyWith(selectedContacts: updatedList));
  }

  //? This is or get contact from user phone :
  Future<void> getContacts(String? search) async {
    state = AsyncLoading();

    final granted = await FlutterContacts.requestPermission();
    if (!granted) {
      state = AsyncError('The permission has denied', StackTrace.current);
      return;
    }

    final contacts = await FlutterContacts.getContacts(withProperties: true);
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

  //? This for select contact and make it check :
  void selectContact(Contact contact) {
    final currentState = state.value!;
    List<SelectedContact> selectedList = currentState.selectedContacts!;

    final exists = selectedList.any((c) => c.contact.id == contact.id);

    if (exists) {
      selectedList = selectedList
          .where((c) => c.contact.id != contact.id)
          .toList();
    } else {
      selectedList = [
        ...selectedList,
        SelectedContact(contact: contact, count: 0, id: const Uuid().v4()),
      ];
    }

    state = AsyncData(currentState.copyWith(selectedContacts: selectedList));
  }

  //? This for add guest for party :
  void incrementCount(SelectedContact contact) {
    final currentState = state.value!;
    final updatedList = currentState.selectedContacts?.map((sc) {
      if (sc.id == contact.id) {
        return sc.copyWith(count: sc.count + 1);
      }
      return sc;
    }).toList();

    state = AsyncData(currentState.copyWith(selectedContacts: updatedList));
  }

  //? This for minus guest for party :
  void decrementCount(SelectedContact contact) {
    final currentState = state.value!;
    final updatedList = currentState.selectedContacts?.map((sc) {
      if (sc.id == contact.id && sc.count > 0) {
        return sc.copyWith(count: sc.count - 1);
      }
      return sc;
    }).toList();

    state = AsyncData(currentState.copyWith(selectedContacts: updatedList));
  }

  Future<void> addNewContact({
    required String firstName,
    required String lastName,
    required String phoneNumber,
  }) async {
    try {
      // ضع الحالة في وضع التحميل
      state = AsyncData(state.value!.copyWith(isAddContact: true));

      // لا نحتاج AsyncLoading كامل لأننا نحافظ على بياناتنا
      // state = AsyncLoading();

      // إنشاء كائن Contact جديد محلي فقط
      final newContact = Contact()
        ..name.first = firstName
        ..name.last = lastName
        ..phones = [Phone(phoneNumber)];

      // ✨ بدلاً من إضافته لجهات الاتصال في الهاتف، نضيفه للـ selectedContacts
      final currentSelected = state.value!.selectedContacts;

      final updatedSelected = [
        ...?currentSelected,
        SelectedContact(contact: newContact, id: const Uuid().v4()),
      ];

      state = AsyncData(
        state.value!.copyWith(
          selectedContacts: updatedSelected,
          isAddContact: false,
        ),
      );
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  //? This for add event to server :

  Future<CreateEventResponse?> createEvent() async {
    try {
      state = AsyncData(state.value!.copyWith(isAddEvent: true));
      state = AsyncLoading();
      final repo = ref.read(homeRepositoryProvider);
      final response = await repo.createEvent(state.value!.eventModel!);

      if (response.hasFailed) {
        state = AsyncError(
          response.message ?? '',
          StackTrace.fromString(response.message ?? ''),
        );
        state = AsyncData(state.value!.copyWith(isAddEvent: false));

        // throw Exception(response.message);
      }

      // state = AsyncData(state.value!.copyWith(eventResponse: eventResponse));
      state = AsyncData(
        state.value!.copyWith(
          createEventResponse: response.data,
          isAddEvent: false,
        ),
      );
      return response.data;
    } catch (e, st) {
      state = AsyncError(e, st);
      state = AsyncData(state.value!.copyWith(isAddEvent: false));
      return null;
    }
  }
}
