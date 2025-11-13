// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:kroot_app/features/event/data/models/event_response/create_event_response.dart';
import 'package:kroot_app/features/event/data/models/events_response/event_response.dart';
import 'package:kroot_app/features/event/data/models/get_user_events/get_user_events_model.dart';
import 'package:kroot_app/features/event/data/models/occasion_response/occasion_response.dart';

class HomeState {
  final List<SelectedContact> selectedContactsForUpdate;
  final GetUserEventsModel? eventResponse;
  final EventModel? occasionModel;
  final EventModel? updatedEvent;
  final List<GuestModel>? gusetsList;


  //? This is for delete event :
  final bool? isDeleteEvent;

  //? This for update event :
  final bool? isUpdateEvent;

  HomeState({
    required this.isUpdateEvent,
    required this.selectedContactsForUpdate,
    required this.updatedEvent,
    required this.occasionModel,
    required this.isDeleteEvent,
    required this.eventResponse,
    required this.gusetsList,
  });

  factory HomeState.init() => HomeState(
    updatedEvent: null,
    selectedContactsForUpdate: [],
    isDeleteEvent: false,
    eventResponse: null,
    isUpdateEvent: false,
    occasionModel: null,
    gusetsList: [],
  );

  HomeState copyWith({
    List<Contact>? contacts,
    List<SelectedContact>? selectedContacts,
    List<SelectedContact>? selectedContactsForUpdate,
    GetUserEventsModel? eventResponse,
    EventModel? createEventRequest,
    EventModel? occasionModel,
    EventModel? updatedEvent,
    CreateEventResponse? createEventResponse,
    bool? isDeleteEvent,
    List<GuestModel>? gusetsList,
    bool? isAddContact,
    bool? isUpdateEvent,
    bool? isCreatingEvent,
  }) {
    return HomeState(
      selectedContactsForUpdate:
          selectedContactsForUpdate ?? this.selectedContactsForUpdate,
      eventResponse: eventResponse ?? this.eventResponse,
      occasionModel: occasionModel ?? this.occasionModel,
      updatedEvent: updatedEvent ?? this.updatedEvent,
      gusetsList: gusetsList ?? this.gusetsList,
      isDeleteEvent: isDeleteEvent,
      isUpdateEvent: isUpdateEvent,
    );
  }
}

class SelectedContact {
  final Contact contact;
  final int count;
  final String id; // معرف فريد

  SelectedContact({required this.contact, this.count = 0, required this.id});

  SelectedContact copyWith({Contact? contact, int? count, String? id}) {
    return SelectedContact(
      contact: contact ?? this.contact,
      count: count ?? this.count,
      id: id ?? this.id,
    );
  }
}
