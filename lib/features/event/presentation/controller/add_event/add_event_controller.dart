import 'dart:io';
import 'package:csv/csv.dart';
import 'package:dio/dio.dart';
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_google_places_sdk/flutter_google_places_sdk.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
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

  void clearEventScreen() {
    state = AsyncData(
      state.value!.copyWith(eventModel: EventModel(), selectedContacts: []),
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
          phones: [Phone(number.substring(4))],
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
          code: number.substring(1, 4),
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
          title: current.title,
          date: current.date,
          language: current.language ?? 'Arabic',
          showQr: current.showQr,
          image: null,
          inviteTemplate: 'Kroot Invite-',
          confirmedTemplate: current.confirmedTemplate,
          declinedTemplate: current.declinedTemplate,
          guests: setGuestListFromContacts() ?? current.guests,
        ),
      ),
    );
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

  void updateEventDate(DateTime newDate) {
    final current = DateTime.parse(
      state.value?.eventModel?.date ?? DateTime.now().toString(),
    );

    final updated = DateTime(
      newDate.year,
      newDate.month,
      newDate.day,
      current.hour,
      current.minute,
    );

    updateEvent(EventModel(date: updated.toString()));
  }

  void updateEventTime(TimeOfDay newTime) {
    final current = DateTime.parse(
      state.value?.eventModel?.date ?? DateTime.now().toString(),
    );

    final updated = DateTime(
      current.year,
      current.month,
      current.day,
      newTime.hour,
      newTime.minute,
    );

    updateEvent(EventModel(date: updated.toString()));
  }

  void updateEvent(EventModel newData) {
    final current = state.value?.eventModel ?? EventModel();

    final firstType = ref
        .read(homeControllerProvider)
        .value
        ?.utilsResponse
        ?.value
        ?.eventTypes
        ?.first;

    final lang = state.value?.eventModel?.language ?? 'Arabic';

    final firsTemplate = ref
        .read(homeControllerProvider)
        .value
        ?.utilsResponse
        ?.value
        ?.templates
        ?.firstWhere((e) => lang.toLowerCase().contains(e.language ?? 'ar'));

    state = AsyncData(
      state.value!.copyWith(
        eventModel: current.copyWith(
          type: newData.type ?? firstType,
          title: newData.title ?? current.title,
          date: newData.date ?? current.date,
          language: newData.language ?? current.language ?? 'Arabic',
          locationName: newData.locationName ?? current.locationName,
          showQr: newData.showQr ?? current.showQr,
          image: newData.image ?? current.image,
          mapLatitude: newData.mapLatitude ?? current.mapLatitude,
          mapLongitude: newData.mapLongitude ?? current.mapLongitude,
          operators: newData.operators ?? state.value!.operators,
          handlers: newData.handlers ?? state.value!.handlers,

          inviteTemplate:
              newData.inviteTemplate ??
              current.inviteTemplate ??
              firsTemplate?.name,
          guests: setGuestListFromContacts() ?? current.guests,
        ),
      ),
    );
  }

  List<GuestModel>? setGuestListFromContacts() {
    final selectedContacts = state.value!.selectedContacts;
    return selectedContacts?.map((s) {
      final nameParts = (s.contact.displayName).split(' ');
      final firstName = nameParts.isNotEmpty ? nameParts.first : null;
      final lastName = nameParts.length > 1
          ? nameParts.sublist(1).join(' ')
          : null;

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

  void deleteSelectedContact(Contact contact) {
    final currentState = state.value!;

    final updatedList = currentState.selectedContacts!
        .where((sc) => sc.contact.id != contact.id)
        .toList();

    state = AsyncData(currentState.copyWith(selectedContacts: updatedList));
  }

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

  void selectContact(Contact contact) {
    final currentState = state.value!;
    List<SelectedContact> selectedList = currentState.selectedContacts!;
    final exists = selectedList.any((c) => c.contact.id == contact.id);

    if (exists) {
      selectedList = selectedList
          .where((c) => c.contact.id != contact.id)
          .toList();
    } else {
      final code =
          contact.phones.first.number.startsWith('+') ||
              contact.phones.first.number.replaceAll(' ', '').length > 11
          ? contact.phones.first.number.replaceAll(' ', '').substring(1, 4)
          : '974';

      final number =
          contact.phones.first.number.startsWith('+') ||
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

    state = AsyncData(currentState.copyWith(selectedContacts: selectedList));
  }

  void incrementCount(SelectedContact contact) {
    final currentState = state.value!;
    final updatedList = currentState.selectedContacts?.map((sc) {
      if (sc.id == contact.id) {
        return sc.copyWith(count: sc.count + 1);
      }
      return sc;
    }).toList();

    state = AsyncData(currentState.copyWith(selectedContacts: updatedList));
    updateEvent(EventModel());
  }

  void decrementCount(SelectedContact contact) {
    final currentState = state.value!;
    final updatedList = currentState.selectedContacts?.map((sc) {
      if (sc.id == contact.id && sc.count > 0) {
        return sc.copyWith(count: sc.count - 1);
      }
      return sc;
    }).toList();

    state = AsyncData(currentState.copyWith(selectedContacts: updatedList));
    updateEvent(EventModel());
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
        SelectedContact(contact: newContact, id: const Uuid().v4(), code: ''),
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
      }

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

      updateEvent(state.value!.eventModel!);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> searchForLocation(String query) async {
    final sdk = ref.read(placesSdkProvider);
    if (query.isEmpty) {
      state = AsyncData(state.value!.copyWith(predictions: AsyncData([])));
      return;
    }

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
    final lat = state.value!.latLng.lat;
    final lng = state.value!.latLng.lng;
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
      state = AsyncData(
        state.value!.copyWith(selectedPlace: AsyncError(e, st)),
      );
    }
  }

  String cleanName(String address) {
    if (address.isEmpty) return "Location";

    final trimmed = address.trim();

    List<String> commaParts = trimmed.split(',').map((e) => e.trim()).toList();

    String first = commaParts[0];

    final fullPlusCode = RegExp(r"^[A-Z0-9]{4,}\+[A-Z0-9]+");
    first = first.replaceFirst(fullPlusCode, '').trim();

    final shortPlusCode = RegExp(r"^\+[A-Z0-9]{2,4}");
    first = first.replaceFirst(shortPlusCode, '').trim();

    List<String> parts = [];
    if (first.isNotEmpty) {
      parts.add(first);
    }

    if (commaParts.length > 1) {
      parts.addAll(commaParts.sublist(1));
    }

    final result = parts.join(', ').trim();

    if (RegExp(r"^[0-9+\- ]+$").hasMatch(result)) {
      return "Location";
    }

    return result.isEmpty ? "Location" : result;
  }

  Future<void> initLocation() async {
    state = AsyncData(state.value!.copyWith(selectedPlace: AsyncLoading()));

    try {
      final permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        _setDefaultLocationWithAsync();
        return;
      }

      final pos = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      final lat = pos.latitude.toString();
      final lng = pos.longitude.toString();

      final response = await Dio().get(
        "https://maps.googleapis.com/maps/api/geocode/json"
        "?latlng=$lat,$lng&key=${dotenv.env['MAPS_API_KEY']}",
      );

      String locationName = "Current Location";
      if (response.statusCode == 200 && response.data["status"] == "OK") {
        locationName = response.data["results"][0]["formatted_address"];
      }

      updateEvent(
        EventModel(
          mapLatitude: lat,
          mapLongitude: lng,
          locationName: locationName,
        ),
      );

      state = AsyncData(
        state.value!.copyWith(
          latLng: LatLng(lat: double.parse(lat), lng: double.parse(lng)),
          initialLatLng:
              state.value!.initialLatLng ??
              LatLng(lat: double.parse(lat), lng: double.parse(lng)),
          selectedPlace: AsyncData(
            SelectedPlace(
              placeId: "",
              mapLink:
                  "https://www.google.com/maps/search/?api=1&query=$lat,$lng",
              locationName: locationName,
            ),
          ),
        ),
      );
    } catch (e, st) {
      _setDefaultLocationWithAsync(error: e, stack: st);
    }
  }

  void _setDefaultLocationWithAsync({dynamic error, StackTrace? stack}) {
    const lat = "25.2854473";
    const lng = "51.53103979999999";
    const locationName = "Doha, Qatar";

    updateEvent(
      EventModel(
        mapLatitude: lat,
        mapLongitude: lng,
        locationName: locationName,
      ),
    );

    if (error != null) {
      state = AsyncData(
        state.value!.copyWith(
          selectedPlace: AsyncError(error, stack ?? StackTrace.current),
        ),
      );
    } else {
      state = AsyncData(
        state.value!.copyWith(
          latLng: LatLng(lat: double.parse(lat), lng: double.parse(lng)),
          selectedPlace: AsyncData(
            SelectedPlace(
              placeId: "",
              mapLink:
                  "https://www.google.com/maps/search/?api=1&query=$lat,$lng",
              locationName: locationName,
            ),
          ),
        ),
      );
    }
  }
}
