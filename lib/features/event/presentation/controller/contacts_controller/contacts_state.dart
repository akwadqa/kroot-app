import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:kroot_app/features/event/presentation/controller/home_state.dart';

class ContactsState {
  final List<Contact> contacts;
  final List<SelectedContact> selectedContacts;
  final bool? isAddContact;
  final bool isChanged;

  ContactsState({
    required this.contacts,
    required this.selectedContacts,
    required this.isAddContact,
    required this.isChanged,
  });

  factory ContactsState.init() => ContactsState(
        contacts: [],
        selectedContacts: [],
        isAddContact: null,
        isChanged: false,
      );

  ContactsState copyWith({
    List<Contact>? contacts,
    List<SelectedContact>? selectedContacts,
    bool? isAddContact,
    bool? isChanged,
  }) {
    return ContactsState(
      contacts: contacts ?? this.contacts,
      selectedContacts: selectedContacts ?? this.selectedContacts,
      isAddContact: isAddContact,
      isChanged: isChanged ?? this.isChanged,
    );
  }
}
