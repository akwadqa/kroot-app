// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_contacts/contact.dart';

import 'package:kroot_app/features/event/data/models/event_response/create_event_response.dart';
import 'package:kroot_app/features/event/data/models/get_user_events/get_user_events_model.dart';
import 'package:kroot_app/features/event/presentation/controller/home_state.dart';

class AddEventState {
  final EventModel? eventModel;
  final List<SelectedContact>? selectedContacts;
  final bool? isAddContact;
  final List<Contact> contacts;

  final CreateEventResponse? createEventResponse;

  //? This for load contacts :
  final bool? isGetContacts;

  //? This for add event : 
  final bool? isAddEvent;

  AddEventState({
    required this.eventModel,
    required this.contacts,
    required this.selectedContacts,
    required this.isGetContacts,
    required this.isAddEvent,
    required this.createEventResponse,
    required this.isAddContact,
  });

  factory AddEventState.init() => AddEventState(
    eventModel: null,
    selectedContacts: [],
    isAddContact: null,
    isGetContacts: false,
    contacts: [],
    createEventResponse: null,
    isAddEvent: null
  );

  AddEventState copyWith({
    EventModel? eventModel,
    List<SelectedContact>? selectedContacts,
    bool? isAddContact,
    bool? isGetContacts,
    bool? isAddEvent,
    List<Contact>? contacts,
    CreateEventResponse? createEventResponse,
  }) {
    return AddEventState(
      eventModel: eventModel ?? this.eventModel,
      selectedContacts: selectedContacts ?? this.selectedContacts,
      isAddContact: isAddContact,
      isAddEvent: isAddEvent,
      contacts: contacts ?? this.contacts,
      isGetContacts:isGetContacts ,
      createEventResponse: createEventResponse ?? this.createEventResponse,
    );
  }
}
