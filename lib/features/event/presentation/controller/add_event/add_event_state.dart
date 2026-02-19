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

  final LatLng latLng;

  final bool? isGetContacts;

  final bool? isAddEvent;
  final AsyncValue<List<AutocompletePrediction>>? predictions;

  final AsyncValue<SelectedPlace>? selectedPlace;

  final LatLng? initialLatLng;

  final List<HandlerModel> operators;
  final List<HandlerModel> handlers;

  AddEventState({
    required this.eventModel,
    required this.operators,
    required this.handlers,
    required this.initialLatLng,
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
    operators: [],
    handlers: [],
    isGetContacts: false,
    contacts: [],

    latLng: LatLng(lat: 25.2854473, lng: 51.53103979999999),
    initialLatLng: null,
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
    List<HandlerModel>? operators,
    List<HandlerModel>? handlers,
    LatLng? initialLatLng,
    CreateEventResponse? createEventResponse,
    AsyncValue<List<AutocompletePrediction>>? predictions,
    AsyncValue<SelectedPlace>? selectedPlace,
  }) {
    return AddEventState(
      initialLatLng: initialLatLng ?? this.initialLatLng,
      operators: operators ?? this.operators,
      handlers: handlers ?? this.handlers,
      selectedPlace: selectedPlace ?? this.selectedPlace,
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
