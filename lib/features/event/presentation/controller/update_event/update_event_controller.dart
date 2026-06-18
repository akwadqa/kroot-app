import 'dart:io';

import 'package:csv/csv.dart';
import 'package:dio/dio.dart';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_google_places_sdk/flutter_google_places_sdk.dart';
import 'package:kroot_app/features/event/data/models/delete_handler_response/delete_handler_response.dart';
import 'package:kroot_app/features/event/data/models/update_handlers_response/update_handlers_response.dart';
import 'package:kroot_app/features/event/presentation/controller/add_event/add_event_controller.dart';
import 'package:kroot_app/features/event/presentation/controller/add_event/add_event_state.dart';
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
    final list = ref
        .watch(homeControllerProvider)
        .value
        ?.occasionModel
        ?.value
        ?.guests
        ?.where((guest) => guest.rsvpStatus == 'Not Sent')
        .toList();

    final operators = ref
        .watch(homeControllerProvider)
        .value
        ?.occasionModel
        ?.value
        ?.operators;
    final handlers =
        ref.watch(homeControllerProvider).value?.occasionModel?.value?.handlers;
    if (list != null) {
      final selected = convertGuestModelsToSelectedContacts(list);

      return UpdateEventState.init().copyWith(
        selectedContacts: selected,
        operators: operators,
        handlers: handlers,
      );
    } else {
      return UpdateEventState.init();
    }
  }

  bool _checkSelectedContactsChanged(List<SelectedContact> currentSelected) {
    final originalGuests =
        ref.read(homeControllerProvider).value?.occasionModel?.value?.guests;

    if (originalGuests == null) return false;

    final originalSelected = originalGuests.map((g) {
      final first = g.firstName ?? '';
      final last = g.lastName ?? '';
      final fullNumber = g.whatsappNumber ?? '';

      final code = fullNumber.length > 3 ? fullNumber.substring(0, 3) : '';
      final number = fullNumber.length > 3 ? fullNumber.substring(3) : '';

      return SelectedContact(
        id: 'original',
        code: code,
        count: g.partySize ?? 0,
        contact: Contact(
          id: 'original',
          name: Name(first: first, last: last),
          displayName: '$first $last'.trim(),
          phones: [Phone(number)],
        ),
      );
    }).toList();

    bool same(SelectedContact a, SelectedContact b) {
      final aNum = '${a.code}${a.contact.phones.first.number}'.replaceAll(
        ' ',
        '',
      );
      final bNum = '${b.code}${b.contact.phones.first.number}'.replaceAll(
        ' ',
        '',
      );

      return aNum == bNum &&
          a.count == b.count &&
          a.contact.name.first == b.contact.name.first &&
          a.contact.name.last == b.contact.name.last;
    }

    if (originalSelected.length != currentSelected.length) return true;

    for (final o in originalSelected) {
      if (!currentSelected.any((c) => same(o, c))) {
        return true;
      }
    }

    return false;
  }

  void updateEventDate(DateTime newDate, String id) {
    final current = DateTime.parse(
      state.value?.updatedEvent?.date ?? DateTime.now().toString(),
    );

    final updated = DateTime(
      newDate.year,
      newDate.month,
      newDate.day,
      current.hour,
      current.minute,
    );

    updateDataForEvent(EventModel(date: updated.toString()), id);
  }

  void updateEventTime(TimeOfDay newTime, String id) {
    final current = DateTime.parse(
      state.value?.updatedEvent?.date ?? DateTime.now().toString(),
    );

    final updated = DateTime(
      current.year,
      current.month,
      current.day,
      newTime.hour,
      newTime.minute,
    );

    updateDataForEvent(EventModel(date: updated.toString()), id);
  }

  Future<UpdateHandlersResponse?> updateHandlers() async {
    try {
      state = AsyncData(
        state.value!.copyWith(updateHandlersResponse: AsyncLoading()),
      );
      final repo = ref.read(homeRepositoryProvider);

      final response = await repo.updateHandlers(
        state.value!.updatedEvent!.occasionId!,
        List.from([...state.value!.handlers, ...state.value!.operators]),
      );

      if (response.hasFailed) {
        state = AsyncData(
          state.value!.copyWith(
            updateHandlersResponse: AsyncError(
              response.message ?? '',
              StackTrace.fromString(response.message ?? ''),
            ),
          ),
        );
        return null;
      }

      state = AsyncData(
        state.value!.copyWith(
          updateHandlersResponse: AsyncData(response.data!),
        ),
      );
      return response.data;
    } catch (e, st) {
      state = AsyncData(
        state.value!.copyWith(updateHandlersResponse: AsyncError(e, st)),
      );
      return null;
    }
  }

  Future<DeleteHandlerResponse?> deleteHandler(String id) async {
    try {
      state = AsyncData(
        state.value!.copyWith(deleteHandlersResponse: AsyncLoading()),
      );
      final repo = ref.read(homeRepositoryProvider);
      final response = await repo.deleteHandlers(id, state.value!.handlers);

      if (response.hasFailed) {
        state = AsyncData(
          state.value!.copyWith(
            deleteHandlersResponse: AsyncError(
              response.message ?? '',
              StackTrace.fromString(response.message ?? ''),
            ),
          ),
        );
        return null;
      }

      state = AsyncData(
        state.value!.copyWith(
          deleteHandlersResponse: AsyncData(response.data!),
        ),
      );
      return response.data;
    } catch (e, st) {
      state = AsyncData(
        state.value!.copyWith(deleteHandlersResponse: AsyncError(e, st)),
      );
      return null;
    }
  }

  void addOperator(HandlerModel operator) {
    if (!state.value!.operators.contains(operator)) {
      state = AsyncData(
        state.value!.copyWith(
          operators: List.from([...state.value!.operators, operator]),
        ),
      );
    }
  }

  void removeOperator(HandlerModel operator) {
    state = AsyncData(
      state.value!.copyWith(
        operators: state.value!.operators
            .where((e) => e.whatsappNumber != operator.whatsappNumber)
            .toList(),
      ),
    );
  }

  void removeHandler(HandlerModel handler) {
    state = AsyncData(
      state.value!.copyWith(
        handlers: state.value!.handlers
            .where((e) => e.whatsappNumber != handler.whatsappNumber)
            .toList(),
      ),
    );
  }

  void addHandler(HandlerModel handler) {
    if (!state.value!.handlers.contains(handler)) {
      state = AsyncData(
        state.value!.copyWith(
          handlers: List.from([...state.value!.handlers, handler]),
        ),
      );
    }
  }

  void makeHandlerScanableOrNot(HandlerModel editedHandler) {
    final newHandlers = state.value!.handlers.map((handler) {
      if (handler.whatsappNumber == editedHandler.whatsappNumber) {
        return handler.copyWith(scanAccess: handler.scanAccess == 1 ? 0 : 1);
      }
      return handler;
    }).toList();
    state = AsyncData(state.value!.copyWith(handlers: newHandlers));
  }

  void makeHandlerEditableOrNot(HandlerModel editedHandler) {
    final newHandlers = state.value!.handlers.map((handler) {
      if (handler.whatsappNumber == editedHandler.whatsappNumber) {
        return handler.copyWith(
          editEventAccess: handler.editEventAccess == 1 ? 0 : 1,
        );
      }
      return handler;
    }).toList();
    state = AsyncData(state.value!.copyWith(handlers: newHandlers));
  }

  List<SelectedContact> convertGuestModelsToSelectedContacts(
    List<GuestModel> guests,
  ) {
    final newList = guests.map((g) {
      String? first = g.firstName;
      String? last = g.lastName;

      if ((first == null || first.isEmpty) &&
          (last == null || last.isEmpty) &&
          g.fullName != null) {
        final parts = g.fullName!.trim().split(" ");
        first = parts.isNotEmpty ? parts.first : "";
        last = parts.length > 1 ? parts.sublist(1).join(" ") : "";
      }

      final number = g.whatsappNumber ?? "";

      final contact = Contact(
        id: const Uuid().v4(),
        name: Name(first: first ?? "", last: last ?? ""),
        phones: [Phone(number.substring(3))],
        displayName: "${first ?? ''} ${last ?? ''}".trim(),
      );

      return SelectedContact(
        contact: contact,
        count: g.partySize ?? 0,
        id: contact.id,
        code: g.whatsappNumber!.substring(0, 3),
      );
    }).toList();

    state = AsyncData(state.value!.copyWith(selectedContacts: newList));

    return newList;
  }

  String normalize(String s) {
    return s.replaceAll(RegExp(r'\D+'), '');
  }

  void selectContactForUpdatedEvent(Contact contact) {
    final currentState = state.value!;
    List<SelectedContact> selectedList = currentState.selectedContacts!;
    final exists = selectedList.any((c) => c.contact.id == contact.id);

    if (exists) {
      selectedList =
          selectedList.where((c) => c.contact.id != contact.id).toList();
    } else {
      final code = contact.phones.first.number.startsWith('+') ||
              contact.phones.first.number.replaceAll(' ', '').length > 11
          ? contact.phones.first.number.replaceAll(' ', '').substring(1, 4)
          : '974';

      final number = contact.phones.first.number.startsWith('+') ||
              contact.phones.first.number.replaceAll(' ', '').length > 11
          ? contact.phones.first.number.replaceAll(' ', '').substring(4)
          : contact.phones.first.number.startsWith('0')
              ? contact.phones.first.number.replaceAll(' ', '').substring(1)
              : contact.phones.first.number;

      final newContact = Contact(
        id: contact.id,
        displayName: contact.displayName,
        name: contact.name,
        phones: [Phone(number)],
        emails: contact.emails
            .map((e) => Email(e.address, label: e.label))
            .toList(),
      );

      selectedList = [
        ...selectedList,
        SelectedContact(
          contact: newContact,
          count: 0,
          id: const Uuid().v4(),
          code: code,
        ),
      ];
    }

    state = AsyncData(
      currentState.copyWith(
        selectedContacts: selectedList,
        isChanged: _checkSelectedContactsChanged(selectedList),
      ),
    );
  }

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
      }

      state = AsyncData(
        state.value!.copyWith(
          createEventResponse: response.data,
          isUpdateEvent: false,
          msg: response.message,
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
    final currentEvent =
        ref.read(homeControllerProvider).value?.occasionModel?.value;

    state = AsyncData(
      state.value!.copyWith(
        updatedEvent: EventModel(
          occasionId: id,
          type: current?.type ?? currentEvent?.type,
          title: current?.title ?? currentEvent?.title,
          date: current?.date ?? currentEvent?.date,
          language: current?.language ?? currentEvent?.language,
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

  void updateContactName(
    Contact contact,
    String firstName,
    String lastName,
    // String code,
    String number,
    int count,
  ) {
    final currentState = state.value!;

    final updatedList = currentState.selectedContacts?.map((sc) {
      if (sc.contact.id == contact.id) {
        final updatedContact = Contact(
          id: sc.contact.id,
          name: Name(first: firstName, last: lastName),
          phones: [Phone(number.substring(3))],
          // phones: sc.contact.phones
          //     .map((p) => Phone(p.number, label: p.label))
          //     .toList(),
          emails: sc.contact.emails
              .map((e) => Email(e.address, label: e.label))
              .toList(),
          displayName: "$firstName $lastName",
        );

        return SelectedContact(
          contact: updatedContact,
          code: number.substring(0, 3),
          id: sc.id,
          count: count,
        );
      }

      return sc;
    }).toList();

    state = AsyncData(
      currentState.copyWith(selectedContacts: List.from(updatedList!)),
    );
  }

  void deleteSelectedContact(Contact contact) {
    final currentState = state.value!;

    final updatedList = currentState.selectedContacts!
        .where((sc) => sc.contact.id != contact.id)
        .toList();

    state = AsyncData(
      currentState.copyWith(
        selectedContacts: updatedList,
        isChanged: _checkSelectedContactsChanged(updatedList),
      ),
    );
  }

  Future<void> addNewContact({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String code,
  }) async {
    try {
      state = AsyncData(state.value!.copyWith(isAddContact: true));
      final id = Uuid().v4();

      final newContact = Contact(
        id: id,
        name: Name(first: firstName, last: lastName),
        phones: [Phone(phoneNumber)],
        displayName: "$firstName $lastName",
      );

      final currentSelected = state.value!.selectedContacts;

      final updatedSelected = [
        ...?currentSelected,
        SelectedContact(
          contact: newContact,
          id: const Uuid().v4(),
          code: '',
          // code: code.substring(1),
        ),
      ];

      state = AsyncData(
        state.value!.copyWith(
          selectedContacts: updatedSelected,
          isAddContact: false,
          isChanged: _checkSelectedContactsChanged(updatedSelected),
        ),
      );
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  void incrementCount(SelectedContact contact) {
    final currentState = state.value!;
    final updatedList = currentState.selectedContacts?.map((sc) {
      if (sc.id == contact.id) {
        return sc.copyWith(count: sc.count + 1);
      }
      return sc;
    }).toList();

    state = AsyncData(
      currentState.copyWith(
        selectedContacts: updatedList,
        isChanged: _checkSelectedContactsChanged(updatedList!),
      ),
    );
  }

  void decrementCount(SelectedContact contact) {
    final currentState = state.value!;
    final updatedList = currentState.selectedContacts?.map((sc) {
      if (sc.id == contact.id && sc.count > 0) {
        return sc.copyWith(count: sc.count - 1);
      }
      return sc;
    }).toList();

    state = AsyncData(
      currentState.copyWith(
        selectedContacts: updatedList,
        isChanged: _checkSelectedContactsChanged(updatedList!),
      ),
    );
  }

  void updateDataForEvent(EventModel newData, String id) {
    final current = state.value?.updatedEvent;

    state = AsyncData(
      state.value!.copyWith(
        updatedEvent: EventModel(
          occasionId: id,
          type: newData.type ?? current?.type,
          operators: newData.operators ?? state.value!.operators,
          handlers: newData.handlers ?? state.value!.handlers,
          title: newData.title ?? current?.title,
          mapLatitude: newData.mapLatitude ?? current!.mapLatitude,
          mapLongitude: newData.mapLongitude ?? current!.mapLongitude,
          locationName: newData.locationName ?? current!.locationName,
          date: newData.date ?? current?.date,
          language: newData.language ?? current?.language,
          image: newData.image ?? current?.image,
          imageUrl: newData.imageUrl ?? current?.imageUrl,
          inviteTemplate: newData.inviteTemplate ?? current?.inviteTemplate,
          confirmedTemplate:
              newData.confirmedTemplate ?? current?.confirmedTemplate,
          declinedTemplate:
              newData.declinedTemplate ?? current?.declinedTemplate,
          guests: setGuestListFromContacts() ?? current?.guests,
        ),
      ),
    );
  }

  void setSelectedContactsFromGuests(List<GuestModel> guests) {
    final newGusts = guests.map((g) {
      final fullName = g.fullName ?? '';
      final parts = fullName.split(' ');
      final first = parts.isNotEmpty ? parts.first : '';
      final last = parts.length > 1 ? parts.sublist(1).join(' ') : '';

      final contact = Contact()
        ..displayName = fullName
        ..name = Name(first: first, last: last)
        ..phones = [Phone(g.whatsappNumber!.substring(4))];

      return SelectedContact(
        id: const Uuid().v4(),
        contact: contact,
        count: g.partySize ?? 0,
        code: '9',
      );
    }).toList();

    state = AsyncData(state.value!.copyWith(selectedContacts: newGusts));
  }

  List<GuestModel>? setGuestListFromContacts() {
    final selectedContacts = state.value!.selectedContacts;
    return selectedContacts?.map((s) {
      final nameParts = (s.contact.displayName).split(' ');
      final firstName = nameParts.isNotEmpty ? nameParts.first : null;
      final lastName =
          nameParts.length > 1 ? nameParts.sublist(1).join(' ') : null;

      final number = (s.contact.phones.isNotEmpty)
          ? s.contact.phones.first.number.replaceAll(' ', '').length > 11
              ? s.contact.phones.first.number.replaceAll(' ', '')
              : '${s.code}${s.contact.phones.first.number.replaceAll(' ', '')}'
          : null;

      return GuestModel(
        firstName: firstName,
        lastName: lastName,
        whatsappNumber: number,
        partySize: s.count,
      );
    }).toList();
  }

  Future<void> importGuestsFromFile() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['csv', 'xlsx'],
      );

      if (result == null) {
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
        if (sheet.rows.isEmpty) {
          state = AsyncError("This file is empty", StackTrace.current);
          return;
        }

        for (var row in sheet.rows) {
          rows.add(row.map((c) => c?.value).toList());
        }
      } else if (extension == 'csv') {
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
            "The column $col isn't exist in the file",
            StackTrace.current,
          );
          return;
        }
        colIndex[col] = cleanHeader.indexOf(col);
      }

      List<SelectedContact> imported = [];

      for (int i = 1; i < rows.length; i++) {
        final row = rows[i];

        final firstName = row[colIndex["first_name"]!]?.toString() ?? "";
        final lastName = row[colIndex["last_name"]!]?.toString() ?? "";
        final number = row[colIndex["whatsapp_number"]!]?.toString() ?? "";
        final partySizeRaw = row[colIndex["party_size"]!];

        final partySize = int.tryParse(partySizeRaw.toString()) ?? 0;

        final contact = Contact(
          id: Uuid().v4(),
          name: Name(first: firstName, last: lastName),
          phones: [Phone(number)],
          displayName: "$firstName $lastName",
        );

        imported.add(
          SelectedContact(
            contact: contact,
            count: partySize,
            id: const Uuid().v4(),
            code: '974',
          ),
        );
      }

      final existing = state.value!.selectedContacts ?? [];
      final updated = [...existing, ...imported];

      state = AsyncData(state.value!.copyWith(selectedContacts: updated));

      updateDataForEvent(
        state.value!.updatedEvent!,
        state.value!.updatedEvent!.occasionId!,
      );
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<LatLng?> getPlaceLocation(String placeId) async {
    final sdk = ref.read(placesSdkProvider);
    final result = await sdk.fetchPlace(placeId, fields: [PlaceField.Location]);

    final loc = result.place?.latLng;
    if (loc == null) return null;

    return LatLng(lat: loc.lat, lng: loc.lng);
  }

  void changeLatlng(double lat, double lng) {
    updateDataForEvent(
      EventModel(mapLatitude: lat.toString(), mapLongitude: lng.toString()),
      state.value!.updatedEvent!.occasionId!,
    );
  }

  Future<void> getPlaceInfoFromLatLng(String id) async {
    final lat = state.value!.updatedEvent?.mapLatitude ?? 25.2854473;
    final lng = state.value!.updatedEvent?.mapLongitude ?? 51.53103979999999;
    try {
      state = AsyncData(state.value!.copyWith(selectedPlace: AsyncLoading()));
      final apiKey = dotenv.env['MAPS_API_KEY'];
      if (apiKey == null) return;

      final url =
          "https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$apiKey";

      final response = await Dio().get(url);

      if (response.statusCode != 200) return;

      final data = response.data;

      if (data["status"] != "OK") return;

      final result = data["results"][0];

      final locationName = cleanName(result["formatted_address"] ?? "");
      final placeId = result["place_id"] ?? "";

      final mapLink =
          "https://www.google.com/maps/search/?api=1&query=$lat,$lng";

      updateDataForEvent(
        EventModel(
          locationName: locationName,
          mapLatitude: lat.toString(),
          mapLongitude: lng.toString(),
        ),
        id,
      );

      state = AsyncData(
        state.value!.copyWith(
          selectedPlace: AsyncData(
            SelectedPlace(
              placeId: placeId,
              mapLink: mapLink,
              locationName: locationName,
            ),
          ),
        ),
      );
    } catch (e, st) {
      state = AsyncData(
        state.value!.copyWith(selectedPlace: AsyncError(e, st)),
      );
    }
  }

  String cleanName(String address) {
    final parts = address.split(',');
    if (parts.length > 1) {
      return parts.sublist(1).join(',').trim();
    }
    return address;
  }
}
