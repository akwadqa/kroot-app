import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:csv/csv.dart';
import 'package:dio/dio.dart';
import 'package:excel/excel.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_google_places_sdk/flutter_google_places_sdk.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:kroot_app/features/event/data/models/event_response/create_event_response.dart';
import 'package:kroot_app/features/event/data/models/get_user_events/get_user_events_model.dart';
import 'package:kroot_app/features/event/data/repositories/home_repositories.dart';
import 'package:kroot_app/features/event/presentation/controller/add_event/add_event_state.dart';
import 'package:kroot_app/features/event/presentation/controller/home_controller.dart';
import 'package:kroot_app/features/event/presentation/controller/home_state.dart';

part 'add_event_controller.g.dart';

final placesSdkProvider = Provider<FlutterGooglePlacesSdk>((ref) {
  return FlutterGooglePlacesSdk(dotenv.env['MAPS_API_KEY']!);
});

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
          sc.contact.name.last == contact.name.last &&
          sc.contact.phones.first == contact.phones.first) {
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

  //? This for delete image in add event screen :
  void deleteImage() {
    final current = state.value?.eventModel ?? EventModel();

    final firstType = ref
        .read(homeControllerProvider)
        .value
        ?.utilsResponse
        ?.value
        ?.eventTypes
        ?.first;
    state = AsyncData(
      state.value!.copyWith(
        eventModel: current.copyWith(
          type: current.type ?? firstType,
          // type: current.type ?? firstType,
          title: current.title,
          date: current.date,
          language: current.language ?? 'Arabic',
          // mapLink: current.mapLink,
          // locationName: current.locationName,
          showQr: current.showQr,
          image: null,
          // inviteTemplate: newData.inviteTemplate ?? current.inviteTemplate,
          inviteTemplate: 'Kroot Invite-',
          confirmedTemplate: current.confirmedTemplate,
          declinedTemplate: current.declinedTemplate,
          guests: setGuestListFromContacts() ?? current.guests,
        ),
      ),
    );
  }

  void updateEvent(EventModel newData) {
    // final current = EventModel();
    final current = state.value?.eventModel ?? EventModel();

    final firstType = ref
        .read(homeControllerProvider)
        .value
        ?.utilsResponse
        ?.value
        ?.eventTypes
        ?.first;

    state = AsyncData(
      state.value!.copyWith(
        eventModel: current.copyWith(
          //TODO
          // type: newData.type ?? current.type ?? firstType,
          type: newData.type ?? firstType,
          title: newData.title ?? current.title,
          date: newData.date ?? current.date,
          language: newData.language ?? current.language ?? 'Arabic',
          // mapLink: newData.mapLink ?? current.mapLink,
          locationName: newData.locationName ?? current.locationName,
          showQr: newData.showQr ?? current.showQr,
          image: newData.image ?? current.image,
          mapLatitude: newData.mapLatitude ?? current.mapLatitude,
          mapLongitude: newData.mapLongitude ?? current.mapLongitude,
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
      updateEvent(state.value!.eventModel!);
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
      updateEvent(state.value!.eventModel!);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  //***************** For lcation ******* */
  Future<void> searchForLocation(String query) async {
    final sdk = ref.read(placesSdkProvider);
    if (query.isEmpty) {
      // state = state.copyWith(predictions: []);
      state = AsyncData(state.value!.copyWith(predictions: AsyncData([])));
      return;
    }

    // state = state.copyWith(loading: true);
    state = AsyncData(state.value!.copyWith(predictions: AsyncLoading()));

    final result = await sdk.findAutocompletePredictions(query);

    state = AsyncData(
      state.value!.copyWith(predictions: AsyncData(result.predictions)),
    );
  }

  void clearSearchSuggestions() {
    state = AsyncData(state.value!.copyWith(predictions: AsyncData([])));
  }

  Future<LatLng?> getPlaceLocation(String placeId) async {
    final sdk = ref.read(placesSdkProvider);
    final result = await sdk.fetchPlace(placeId, fields: [PlaceField.Location]);

    final loc = result.place?.latLng;
    if (loc == null) return null;

    return LatLng(lat: loc.lat, lng: loc.lng);
  }

  void changeLatlng(double lat, double lng) {
    state = AsyncData(
      state.value!.copyWith(
        latLng: LatLng(lat: lat, lng: lng),
      ),
    );
  }

  Future<void> getPlaceInfoFromLatLng() async {
    final lat =
        state.value!.eventModel?.mapLatitude ??
        state.value!.latLng.lat ??
        25.2854473;
    final lng =
        state.value!.eventModel?.mapLatitude ??
        state.value!.latLng.lng ??
        51.53103979999999;
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

      updateEvent(
        EventModel(
          locationName: locationName,
          mapLatitude: lat.toString(),
          mapLongitude: lng.toString(),
        ),
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
      print("Reverse Geocoding Error: $e");
      state = AsyncData(
        state.value!.copyWith(selectedPlace: AsyncError(e, st)),
      );
    }
  }

  //? This for get only the location name with out the address before :
  String cleanName(String address) {
    final parts = address.split(',');
    if (parts.length > 1) {
      return parts.sublist(1).join(',').trim();
    }
    return address;
  }
}
