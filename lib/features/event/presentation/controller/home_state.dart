import 'package:equatable/equatable.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:kroot_app/features/event/data/models/event_response/create_event_response.dart';
import 'package:kroot_app/features/event/data/models/get_user_events/get_user_events_model.dart';
import 'package:kroot_app/features/event/data/models/retry_bulk_response/retry_bulk_response.dart';
import 'package:kroot_app/features/event/data/models/utils_response/utils_response.dart';

class HomeState {
  final List<SelectedContact> selectedContactsForUpdate;
  final AsyncValue<GetUserEventsModel>? eventResponse;
  final AsyncValue<EventModel>? occasionModel;
  final EventModel? updatedEvent;
  final List<GuestModel>? gusetsList;
  final AsyncValue<EventModel>? confirmEventResponse;
  final AsyncValue<UtilsResponse>? utilsResponse;
  final AsyncValue<RetryBulkResponse>? retryFailue;

  final bool? isDeleteEvent;

  final bool? isUpdateEvent;

  HomeState({
    required this.isUpdateEvent,
    required this.retryFailue,
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
    occasionModel: AsyncLoading(),
    confirmEventResponse: null,
    retryFailue : null,
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
    AsyncValue<RetryBulkResponse>? retryFailue,
  }) {
    return HomeState(
      utilsResponse: utilsResponse ?? this.utilsResponse,
      retryFailue: retryFailue ?? this.retryFailue,
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

class SelectedContact extends Equatable {
  final Contact contact;
  final int count;
  final String id;
  final String? code;

  SelectedContact({
    required this.contact,

    this.count = 0,
    this.code,

    required this.id,
  });

  SelectedContact copyWith({
    Contact? contact,
    int? count,
    String? id,
    String? code,
  }) {
    return SelectedContact(
      contact: contact ?? this.contact,
      count: count ?? this.count,
      id: id ?? this.id,
      code: code ?? this.code,
    );
  }

  @override
  List<Object?> get props => [id, contact, code, count];
}
