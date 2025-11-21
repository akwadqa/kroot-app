// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_contacts/flutter_contacts.dart';

import 'package:kroot_app/features/event/data/models/event_response/create_event_response.dart';
import 'package:kroot_app/features/event/data/models/get_user_events/get_user_events_model.dart';
import 'package:kroot_app/features/event/presentation/controller/home_state.dart';

class UpdateEventState {
  final EventModel? updatedEvent;
  final List<SelectedContact>? selectedContacts;
  final bool? isAddContact;
  final bool? isUpdateEvent;
  final List<Contact> contacts;

  final CreateEventResponse? createEventResponse;

  UpdateEventState({
    required this.updatedEvent,
    required this.selectedContacts,
    required this.isUpdateEvent,
    required this.isAddContact,
    required this.contacts,
    required this.createEventResponse,
  });
  
  factory UpdateEventState.init() => UpdateEventState(
    updatedEvent: null,
    selectedContacts: [],
    isAddContact: false,
    contacts: [],
    isUpdateEvent: false,
    createEventResponse: null,
  );


  UpdateEventState copyWith({
    EventModel? updatedEvent,
    List<SelectedContact>? selectedContacts,
    bool? isAddContact,
    bool? isUpdateEvent,
    List<Contact>? contacts,
    CreateEventResponse? createEventResponse,
  }) {
    return UpdateEventState(
      isUpdateEvent:  isUpdateEvent,
      updatedEvent: updatedEvent ?? this.updatedEvent,
      selectedContacts: selectedContacts ?? this.selectedContacts,
      isAddContact: isAddContact,
      contacts: contacts ?? this.contacts,
      createEventResponse: createEventResponse ?? this.createEventResponse,
    );
  }
}
