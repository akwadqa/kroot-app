import 'dart:io';

import 'package:csv/csv.dart';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:kroot_app/features/event/data/models/event_response/create_event_response.dart';
import 'package:kroot_app/features/event/data/models/get_user_events/get_user_events_model.dart';
import 'package:kroot_app/features/event/data/repositories/home_repositories.dart';
import 'package:kroot_app/features/event/presentation/controller/home_controller.dart';
import 'package:kroot_app/features/event/presentation/controller/home_state.dart';
import 'package:kroot_app/features/event/presentation/controller/update_event/update_event_state.dart';
part 'update_event_controller.g.dart';

@riverpod
class UpdateEventController extends _$UpdateEventController {
  @override
  FutureOr<UpdateEventState> build() {
    state = AsyncData(UpdateEventState.init());
    final list = ref.watch(homeControllerProvider).value!.occasionModel!.guests;

    final selected = convertGuestModelsToSelectedContacts(list!);

    return UpdateEventState.init().copyWith(selectedContacts: selected);
  }

  List<SelectedContact> convertGuestModelsToSelectedContacts(
    List<GuestModel> guests,
  ) {
    final newList = guests.map((g) {
      // استخراج الاسم
      String? first = g.firstName;
      String? last = g.lastName;

      // في حال fullName موجود ولا يوجد first/last
      if ((first == null || first.isEmpty) &&
          (last == null || last.isEmpty) &&
          g.fullName != null) {
        final parts = g.fullName!.trim().split(" ");
        first = parts.isNotEmpty ? parts.first : "";
        last = parts.length > 1 ? parts.sublist(1).join(" ") : "";
      }

      final number = g.whatsappNumber ?? "";

      // إنشاء Contact بالطريقة الصحيحة
      final contact = Contact(
        name: Name(first: first ?? "", last: last ?? ""),
        phones: number.trim().isNotEmpty ? [Phone(number.trim())] : [],
        displayName: "${first ?? ''} ${last ?? ''}".trim(),
      );

      // تحويله إلى SelectedContact
      return SelectedContact(
        contact: contact,
        count: g.partySize ?? 0,
        id: const Uuid().v4(),
      );
    }).toList();

    state = AsyncData(state.value!.copyWith(selectedContacts: newList));

    return newList;
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

  void deleteImage(String id) {
    final current = state.value?.updatedEvent;
    final currentEvent = ref.read(homeControllerProvider).value?.occasionModel;

    state = AsyncData(
      state.value!.copyWith(
        // updatedEvent: current?.copyWith(
        updatedEvent: EventModel(
          occasionId: id,
          type: current?.type ?? currentEvent?.type,
          title: current?.title ?? currentEvent?.title,
          date: current?.date ?? currentEvent?.date,
          language: current?.language ?? currentEvent?.language,
          mapLink: current?.mapLink ?? currentEvent?.mapLink,
          locationName: current?.locationName ?? currentEvent?.locationName,
          // image: newData.image ?? current?.image  ?? currentEvent?.image,
          image: null,
          imageUrl: null,
          inviteTemplate:
              current?.inviteTemplate ?? currentEvent?.inviteTemplate,
          confirmedTemplate:
              current?.confirmedTemplate ?? currentEvent?.confirmedTemplate,
          declinedTemplate:
              current?.declinedTemplate ?? currentEvent?.declinedTemplate,
          guests: setGuestListFromContacts() ?? current?.guests,
        ),
      ),
    );
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
      state = AsyncData(state.value!.copyWith(isAddContact: true));

      final newContact = Contact(
        name: Name(first: firstName, last: lastName),
        phones: [Phone(phoneNumber)],
        displayName: "$firstName $lastName",
      );

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

  Future<void> importGuestsFromFile() async {
    try {
      //? Pick a file :
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['csv', 'xlsx'],
      );

      if (result == null) {
        // state = AsyncError("لم يتم اختيار أي ملف", StackTrace.current);
        return;
      }

      final file = result.files.single;
      final path = file.path;
      if (path == null) {
        state = AsyncError("This file can't be readed", StackTrace.current);
        return;
      }

      final extension = path.split('.').last.toLowerCase();
      List<List<dynamic>> rows = [];
      Map<String, int> colIndex = {};

      //? Read Excel :
      if (extension == 'xlsx') {
        final bytes = File(path).readAsBytesSync();

        Excel excel;
        try {
          excel = Excel.decodeBytes(bytes);
        } catch (_) {
          state = AsyncError(
            "This Excel file isn't supported",
            StackTrace.current,
          );
          return;
        }

        final sheet = excel.tables.values.first;
        if (sheet == null || sheet.rows.isEmpty) {
          state = AsyncError("This file is empty", StackTrace.current);
          return;
        }

        for (var row in sheet.rows) {
          rows.add(row.map((c) => c?.value).toList());
        }
      }
      //? Read CSV :
      else if (extension == 'csv') {
        final content = File(path).readAsStringSync();
        rows = const CsvToListConverter().convert(content);
      } else {
        state = AsyncError("The file isn't supported", StackTrace.current);
        return;
      }

      if (rows.isEmpty) {
        state = AsyncError('This file is empty', StackTrace.current);
        return;
      }
      //? Cleaning the header and check :
      final cleanHeader = rows.first.map((e) {
        return e.toString().trim().toLowerCase().replaceAll(
          RegExp(r'[\ufeff\s]'),
          '',
        );
      }).toList();

      const requiredCols = [
        "first_name",
        "last_name",
        "whatsapp_number",
        "party_size",
      ];

      for (var col in requiredCols) {
        if (!cleanHeader.contains(col)) {
          state = AsyncError(
            // "العمود '$col' غير موجود في الملف",
            "The column $col isn't exist in the file",
            StackTrace.current,
          );
          return;
        }
        colIndex[col] = cleanHeader.indexOf(col);
      }

      //? Convert data to Selected Contact :
      List<SelectedContact> imported = [];

      for (int i = 1; i < rows.length; i++) {
        final row = rows[i];

        final firstName = row[colIndex["first_name"]!]?.toString() ?? "";
        final lastName = row[colIndex["last_name"]!]?.toString() ?? "";
        final number = row[colIndex["whatsapp_number"]!]?.toString() ?? "";
        final partySizeRaw = row[colIndex["party_size"]!];

        final partySize = int.tryParse(partySizeRaw.toString()) ?? 0;

        final contact = Contact(
          name: Name(first: firstName, last: lastName),
          phones: [Phone(number)],
          displayName: "$firstName $lastName",
        );

        imported.add(
          SelectedContact(
            contact: contact,
            count: partySize,
            id: const Uuid().v4(),
          ),
        );
      }

      //? Merge new with old :
      final existing = state.value!.selectedContacts ?? [];
      final updated = [...existing, ...imported];

      state = AsyncData(state.value!.copyWith(selectedContacts: updated));

      //? Update the event data :
      updateDataForEvent(
        state.value!.updatedEvent!,
        state.value!.updatedEvent!.occasionId!,
      );
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
