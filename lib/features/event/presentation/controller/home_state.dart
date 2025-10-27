// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_contacts/flutter_contacts.dart';

import 'package:wedding_app/features/event/data/models/create_event_request/create_event_request.dart';
import 'package:wedding_app/features/event/data/models/event_response/create_event_response.dart';
import 'package:wedding_app/features/event/data/models/events_response/event_response.dart';
import 'package:wedding_app/features/event/data/models/occasion_response/occasion_response.dart';

class HomeState {
  final List<Contact> contacts;
  final List<SelectedContact> selectedContacts;
  final EventsResponse? eventResponse;
  final CreateEventRequest? createEventRequest;
  final OccasionModel? occasionModel;
  final CreateEventResponse? createEventResponse;

  //? This for not loading contact:
  final bool? isAddContact;

  //? This is for create event or be draft :
  final bool? isCreatingEvent;

  HomeState({
    required this.createEventRequest,
    required this.createEventResponse,
    required this.occasionModel,
    required this.isAddContact,
    required this.contacts,
    required this.isCreatingEvent,
    required this.selectedContacts,
    required this.eventResponse,
  });

  factory HomeState.init() => HomeState(
    contacts: [],
    selectedContacts: [],
    eventResponse: null,
    occasionModel: null,
    createEventRequest: null,
    createEventResponse: null,
    isCreatingEvent: null,
    isAddContact: false,
  );

  HomeState copyWith({
    List<Contact>? contacts,
    List<SelectedContact>? selectedContacts,
    EventsResponse? eventResponse,
    CreateEventRequest? createEventRequest,
    OccasionModel? occasionModel,
    CreateEventResponse? createEventResponse,
    bool? isAddContact,
    bool? isCreatingEvent,
  }) {
    return HomeState(
      contacts: contacts ?? this.contacts,
      selectedContacts: selectedContacts ?? this.selectedContacts,
      eventResponse: eventResponse ?? this.eventResponse,
      createEventRequest: createEventRequest ?? this.createEventRequest,
      occasionModel: occasionModel ?? this.occasionModel,
      createEventResponse: createEventResponse ?? this.createEventResponse,
      isAddContact: isAddContact ?? this.isAddContact,
      isCreatingEvent: isCreatingEvent,
    );
  }
}

class SelectedContact {
  final Contact contact;
  final int count;

  SelectedContact({required this.contact, this.count = 0});

  SelectedContact copyWith({Contact? contact, int? count}) {
    return SelectedContact(
      contact: contact ?? this.contact,
      count: count ?? this.count,
    );
  }
}
