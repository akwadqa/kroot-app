// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_google_places_sdk/flutter_google_places_sdk.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:kroot_app/features/event/data/models/event_response/create_event_response.dart';
import 'package:kroot_app/features/event/data/models/get_user_events/get_user_events_model.dart';
import 'package:kroot_app/features/event/presentation/controller/home_state.dart';

class AddEventState {
  final EventModel? eventModel;
  final List<SelectedContact>? selectedContacts;
  final bool? isAddContact;
  final List<Contact> contacts;

  final CreateEventResponse? createEventResponse;

  //? This for search result :
  final AsyncValue<List<AutocompletePrediction>>? predictions;
  final LatLng latLng;

  //? This for load contacts :
  final bool? isGetContacts;

  //? This for add event :
  final bool? isAddEvent;

  //? This for get location name :
  final AsyncValue<SelectedPlace>? selectedPlace;

  AddEventState({
    required this.eventModel,
    required this.selectedPlace,
    required this.contacts,
    required this.selectedContacts,
    required this.isGetContacts,
    required this.isAddEvent,
    required this.createEventResponse,
    required this.latLng,
    required this.predictions,
    required this.isAddContact,
  });

  factory AddEventState.init() => AddEventState(
    eventModel: null,
    selectedContacts: [],
    isAddContact: null,
    isGetContacts: false,
    contacts: [],
    latLng: LatLng(lat: 25.2854473, lng: 51.53103979999999),
    predictions: null,
    createEventResponse: null,
    selectedPlace: null,
    isAddEvent: null,
  );

  AddEventState copyWith({
    EventModel? eventModel,
    List<SelectedContact>? selectedContacts,
    bool? isAddContact,
    bool? isGetContacts,
    bool? isAddEvent,
    List<Contact>? contacts,
    LatLng? latLng,
    CreateEventResponse? createEventResponse,
    AsyncValue<List<AutocompletePrediction>>? predictions,
    AsyncValue<SelectedPlace>? selectedPlace,
  }) {
    return AddEventState(
      selectedPlace :selectedPlace ?? this.selectedPlace,
      eventModel: eventModel ?? this.eventModel,
      selectedContacts: selectedContacts ?? this.selectedContacts,
      isAddContact: isAddContact,
      latLng: latLng ?? this.latLng,
      predictions: predictions ?? this.predictions,
      isAddEvent: isAddEvent,
      contacts: contacts ?? this.contacts,
      isGetContacts: isGetContacts,
      createEventResponse: createEventResponse ?? this.createEventResponse,
    );
  }
}

class SelectedPlace {
  final String placeId;
  final String mapLink;
  final String locationName;

  SelectedPlace({
    required this.placeId,
    required this.mapLink,
    required this.locationName,
  });
}
