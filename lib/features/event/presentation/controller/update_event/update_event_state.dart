// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_google_places_sdk/flutter_google_places_sdk.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:kroot_app/features/event/data/models/event_response/create_event_response.dart';
import 'package:kroot_app/features/event/data/models/get_user_events/get_user_events_model.dart';
import 'package:kroot_app/features/event/presentation/controller/add_event/add_event_state.dart';
import 'package:kroot_app/features/event/presentation/controller/home_state.dart';

class UpdateEventState {
  final EventModel? updatedEvent;
  final List<SelectedContact>? selectedContacts;
  final bool? isAddContact;
  final bool? isUpdateEvent;
  final List<Contact> contacts;

  //? This for search result :
  final AsyncValue<List<AutocompletePrediction>>? predictions;
  // final LatLng latLng;
  final AsyncValue<SelectedPlace>? selectedPlace;

  final CreateEventResponse? createEventResponse;

  UpdateEventState({
    required this.updatedEvent,
    // required this.latLng,
    required this.selectedPlace,

    required this.predictions,
    required this.selectedContacts,
    required this.isUpdateEvent,
    required this.isAddContact,
    required this.contacts,
    required this.createEventResponse,
  });

  factory UpdateEventState.init() => UpdateEventState(
    updatedEvent: EventModel(),
    selectedPlace: null,
    selectedContacts: [],
    // latLng: LatLng(lat: 25.2854473, lng: 51.53103979999999),
    predictions: null,
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
    // LatLng? latLng,
    AsyncValue<List<AutocompletePrediction>>? predictions,
    AsyncValue<SelectedPlace>? selectedPlace,
  }) {
    return UpdateEventState(
      // latLng: latLng ?? this.latLng,
      predictions: predictions ?? this.predictions,
      selectedPlace: selectedPlace ?? this.selectedPlace,
      isUpdateEvent: isUpdateEvent,
      updatedEvent: updatedEvent ?? this.updatedEvent,
      selectedContacts: selectedContacts ?? this.selectedContacts,
      isAddContact: isAddContact,
      contacts: contacts ?? this.contacts,
      createEventResponse: createEventResponse ?? this.createEventResponse,
    );
  }
}
