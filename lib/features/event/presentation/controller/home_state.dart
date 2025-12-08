// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kroot_app/features/event/data/models/event_response/create_event_response.dart';
import 'package:kroot_app/features/event/data/models/get_user_events/get_user_events_model.dart';
import 'package:kroot_app/features/event/data/models/utils_response/utils_response.dart';

class HomeState {
  final List<SelectedContact> selectedContactsForUpdate;
  final AsyncValue<GetUserEventsModel>? eventResponse;
  final AsyncValue<EventModel>? occasionModel;
  final EventModel? updatedEvent;
  final List<GuestModel>? gusetsList;
  final AsyncValue<EventModel>? confirmEventResponse;
  // final AsyncValue<ConfirmEventResponse >? confirmEventResponse;
  final AsyncValue<UtilsResponse>? utilsResponse;

  //? This is for delete event :
  final bool? isDeleteEvent;

  //? This for update event :
  final bool? isUpdateEvent;

  HomeState({
    required this.isUpdateEvent,
    required this.confirmEventResponse,
    required this.selectedContactsForUpdate,
    required this.updatedEvent,
    required this.occasionModel,
    required this.isDeleteEvent,
    required this.eventResponse,
    required this.utilsResponse,
    required this.gusetsList,
  });

  factory HomeState.init() => HomeState(
    updatedEvent: null,
    selectedContactsForUpdate: [],
    utilsResponse: null,
    isDeleteEvent: false,
    eventResponse: AsyncLoading(),
    isUpdateEvent: false,
    occasionModel: null,
    confirmEventResponse: null,
    gusetsList: [],
  );

  HomeState copyWith({
    List<Contact>? contacts,
    List<SelectedContact>? selectedContacts,
    List<SelectedContact>? selectedContactsForUpdate,
    AsyncValue<GetUserEventsModel>? eventResponse,
    EventModel? createEventRequest,
    AsyncValue<EventModel>? occasionModel,
    EventModel? updatedEvent,
    CreateEventResponse? createEventResponse,
    bool? isDeleteEvent,
    List<GuestModel>? gusetsList,
    bool? isAddContact,
    bool? isUpdateEvent,
    bool? isCreatingEvent,
    AsyncValue<EventModel>? confirmEventResponse,
    AsyncValue<UtilsResponse>? utilsResponse,
  }) {
    return HomeState(
      utilsResponse : utilsResponse ?? this.utilsResponse,
      selectedContactsForUpdate:
          selectedContactsForUpdate ?? this.selectedContactsForUpdate,
      eventResponse: eventResponse ?? this.eventResponse,
      occasionModel: occasionModel ?? this.occasionModel,
      updatedEvent: updatedEvent ?? this.updatedEvent,
      gusetsList: gusetsList ?? this.gusetsList,
      isDeleteEvent: isDeleteEvent,
      isUpdateEvent: isUpdateEvent,
      confirmEventResponse: confirmEventResponse ?? this.confirmEventResponse,
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
