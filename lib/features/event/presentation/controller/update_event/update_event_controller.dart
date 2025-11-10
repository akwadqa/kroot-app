import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:wedding_app/features/event/data/models/event_response/create_event_response.dart';
import 'package:wedding_app/features/event/data/models/get_user_events/get_user_events_model.dart';
import 'package:wedding_app/features/event/data/repositories/home_repositories.dart';
import 'package:wedding_app/features/event/presentation/controller/home_controller.dart';
import 'package:wedding_app/features/event/presentation/controller/home_state.dart';
import 'package:wedding_app/features/event/presentation/controller/update_event/update_event_state.dart';
part 'update_event_controller.g.dart';

@riverpod
class UpdateEventController extends _$UpdateEventController {
  @override
  FutureOr<UpdateEventState> build() {
    return UpdateEventState.init();
  }

  String normalize(String s) {
    return s.replaceAll(RegExp(r'\D+'), ''); // يحذف كل شيء غير الأرقام
  }

  //? This for make
  void selectContactForUpdatedEvent(Contact contact) {
    final currentState = state.value!;
    List<SelectedContact> selectedList = currentState.selectedContacts!;

    final exists = selectedList.any((c) {
      final cNum = c.contact.phones.isNotEmpty
          ? c.contact.phones.first.number
          : '';
      final tNum = contact.phones.isNotEmpty ? contact.phones.first.number : '';

      return normalize(cNum) == normalize(tNum);
    });
    // final exists = selectedList.any((c) => c.contact.id == contact.id);

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

  //? This for update event :

  Future<CreateEventResponse?> updateEventToServer(String id) async {
    try {
      state = AsyncData(state.value!.copyWith(isUpdateEvent: true));

      state = AsyncLoading();
      final repo = ref.read(homeRepositoryProvider);
      final response = await repo.updateEvent(state.value!.updatedEvent!, id);

      if (response.hasFailed) {
        state = AsyncError(
          response.message ?? '',
          StackTrace.fromString(response.message ?? ''),
        );
        state = AsyncData(state.value!.copyWith(isUpdateEvent: false));

        // throw Exception(response.message);
      }

      // state = AsyncData(state.value!.copyWith(eventResponse: eventResponse));
      state = AsyncData(
        state.value!.copyWith(
          createEventResponse: response.data,
          isUpdateEvent: false,
        ),
      );
      return response.data;
    } catch (e, st) {
      state = AsyncError(e, st);
      state = AsyncData(state.value!.copyWith(isUpdateEvent: false));
      return null;
    }
  }

  
  //? This for update contact name :
  void updateContactName(Contact contact, String firstName, String lastName) {
    final currentState = state.value!;
    final updatedList = currentState.selectedContacts?.map((sc) {
      if (sc.contact.id == contact.id) {
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
  
  //? This for unchecked contact :
  void deleteSelectedContact(Contact contact) {
    final currentState = state.value!;

    final updatedList = currentState.selectedContacts!
        .where((sc) => sc.contact.id != contact.id)
        .toList();

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

  //? This for update event

  void updateDataForEvent(EventModel newData, String id) {
    final current = state.value?.updatedEvent;
    final currentEvent = ref.read(homeControllerProvider).value?.occasionModel;

    state = AsyncData(
      state.value!.copyWith(
        // updatedEvent: current?.copyWith(
        updatedEvent: EventModel(
          occasionId: id,
          type: newData.type ?? current?.type ?? currentEvent?.type,
          title: newData.title ?? current?.title ?? currentEvent?.title,
          date: newData.date ?? current?.date ?? currentEvent?.date,
          language:
              newData.language ?? current?.language ?? currentEvent?.language,
          mapLink: newData.mapLink ?? current?.mapLink ?? currentEvent?.mapLink,
          locationName:
              newData.locationName ??
              current?.locationName ??
              currentEvent?.locationName,
          // image: newData.image ?? current?.image  ?? currentEvent?.image,
          image: newData.image ?? current?.image,
          imageUrl: newData.imageUrl ?? current?.imageUrl,
          inviteTemplate:
              newData.inviteTemplate ??
              current?.inviteTemplate ??
              currentEvent?.inviteTemplate,
          confirmedTemplate:
              newData.confirmedTemplate ??
              current?.confirmedTemplate ??
              currentEvent?.confirmedTemplate,
          declinedTemplate:
              newData.declinedTemplate ??
              current?.declinedTemplate ??
              currentEvent?.declinedTemplate,
          guests: setGuestListFromContacts() ?? current?.guests,
        ),
      ),
    );
  }

  //? This for make contacts selected from guest model :
  void setSelectedContactsFromGuests(List<GuestModel> guests) {
    final newGusts = guests.map((g) {
      // تحليل الاسم
      final fullName = g.fullName ?? '';
      final parts = fullName.split(' ');
      final first = parts.isNotEmpty ? parts.first : '';
      final last = parts.length > 1 ? parts.sublist(1).join(' ') : '';

      // بناء Contact
      final contact = Contact()
        ..displayName = fullName
        ..name = Name(first: first, last: last)
        ..phones = [if (g.whatsappNumber != null) Phone(g.whatsappNumber!)];

      // بناء SelectedContact
      return SelectedContact(
        id: const Uuid().v4(),
        contact: contact,
        count: g.partySize ?? 0,
      );
    }).toList();

    state = AsyncData(state.value!.copyWith(selectedContacts: newGusts));
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
        // first_name: firstName,
        // last_name: lastName,
        whatsappNumber: number,
        partySize: s.count,
      );
    }).toList();
  }
}
