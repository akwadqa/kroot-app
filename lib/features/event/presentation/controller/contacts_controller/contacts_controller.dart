import 'dart:io';

import 'package:csv/csv.dart';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:kroot_app/features/event/data/models/get_user_events/get_user_events_model.dart';
import 'package:kroot_app/features/event/presentation/controller/contacts_controller/contacts_state.dart';
import 'package:kroot_app/features/event/presentation/controller/home_controller.dart';
import 'package:kroot_app/features/event/presentation/controller/home_state.dart';

part 'contacts_controller.g.dart';

Duration? _noRetry(int retryCount, Object error) => null;

/// Device contacts, fetched once and cached for the app lifetime.
@Riverpod(keepAlive: true, retry: _noRetry)
Future<List<Contact>> deviceContacts(Ref ref) async {
  final granted = await FlutterContacts.requestPermission();
  if (!granted) throw 'The permission has denied';

  return FlutterContacts.getContacts(withProperties: true);
}

/// Contacts & guests state for one event flow.
/// [eventId] == null -> create flow, otherwise -> update flow of that event.
@riverpod
class ContactsController extends _$ContactsController {
  @override
  FutureOr<ContactsState> build(String? eventId) {
    if (eventId == null) return ContactsState.init();

    final guests = ref
        .watch(
          homeControllerProvider.select(
            (val) => val.value?.occasionModel?.value?.guests,
          ),
        )
        ?.where((guest) => guest.rsvpStatus == 'Not Sent')
        .toList();

    return ContactsState.init().copyWith(
      selectedContacts: _convertGuestModelsToSelectedContacts(guests ?? []),
    );
  }

  bool get _isUpdate => eventId != null;

  void _emitSelected(List<SelectedContact> list, {bool? isAddContact}) {
    state = AsyncData(
      state.value!.copyWith(
        selectedContacts: List.from(list),
        isAddContact: isAddContact,
        isChanged: _isUpdate ? _checkSelectedContactsChanged(list) : null,
      ),
    );
  }

  List<GuestModel> toGuestModels() {
    return state.value!.selectedContacts.map((s) {
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

  Future<void> getContacts(String? search) async {
    if (ref.read(deviceContactsProvider).hasError) {
      ref.invalidate(deviceContactsProvider);
    }

    final isCached = ref.read(deviceContactsProvider).hasValue;
    if (!isCached) state = const AsyncLoading();

    try {
      final contacts = await ref.read(deviceContactsProvider.future);
      state = AsyncData(
        state.value!.copyWith(contacts: _filterContacts(contacts, search)),
      );
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  List<Contact> _filterContacts(List<Contact> contacts, String? search) {
    if (search == null || search.isEmpty) return contacts;

    final query = search.toLowerCase();
    return contacts.where((c) {
      final nameMatch = c.displayName.toLowerCase().contains(query);
      final phoneMatch = c.phones.any((p) => p.number.contains(query));
      return nameMatch || phoneMatch;
    }).toList();
  }

  void selectContact(Contact contact) {
    List<SelectedContact> selectedList = state.value!.selectedContacts;
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

    _emitSelected(selectedList);
  }

  void deleteSelectedContact(Contact contact) {
    _emitSelected(
      state.value!.selectedContacts
          .where((sc) => sc.contact.id != contact.id)
          .toList(),
    );
  }

  void updateContactName(
    Contact contact,
    String firstName,
    String lastName,
    String number,
    int count,
  ) {
    final updatedList = state.value!.selectedContacts.map((sc) {
      if (sc.contact.id == contact.id) {
        final updatedContact = Contact(
          id: sc.contact.id,
          name: Name(first: firstName, last: lastName),
          phones: [Phone(number.substring(3))],
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

    _emitSelected(updatedList);
  }

  void incrementCount(SelectedContact contact) {
    _emitSelected(
      state.value!.selectedContacts.map((sc) {
        if (sc.id == contact.id) return sc.copyWith(count: sc.count + 1);
        return sc;
      }).toList(),
    );
  }

  void decrementCount(SelectedContact contact) {
    _emitSelected(
      state.value!.selectedContacts.map((sc) {
        if (sc.id == contact.id && sc.count > 0) {
          return sc.copyWith(count: sc.count - 1);
        }
        return sc;
      }).toList(),
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

      final newContact = Contact(
        id: const Uuid().v4(),
        name: Name(first: firstName, last: lastName),
        phones: [Phone(phoneNumber)],
        displayName: "$firstName $lastName",
      );

      _emitSelected(
        [
          ...state.value!.selectedContacts,
          SelectedContact(contact: newContact, id: const Uuid().v4(), code: ''),
        ],
        isAddContact: false,
      );
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  /// Replaces the selected contacts with the given guests (update flow).
  void setSelectedContactsFromGuests(List<GuestModel> guests) {
    final newGuests = guests.map((g) {
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

    state = AsyncData(state.value!.copyWith(selectedContacts: newGuests));
  }

  List<SelectedContact> _convertGuestModelsToSelectedContacts(
    List<GuestModel> guests,
  ) {
    return guests.map((g) {
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
              RegExp(r'[﻿\s]'),
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
          id: const Uuid().v4(),
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

      _emitSelected([...state.value!.selectedContacts, ...imported]);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
