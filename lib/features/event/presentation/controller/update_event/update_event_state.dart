import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kroot_app/features/event/domain/model/delete_handler_response/delete_handler_response.dart';

import 'package:kroot_app/features/event/domain/model/event_response/create_event_response.dart';
import 'package:kroot_app/features/event/domain/model/get_user_events/get_user_events_model.dart';
import 'package:kroot_app/features/event/domain/model/update_handlers_response/update_handlers_response.dart';

class UpdateEventState {
  final EventModel? updatedEvent;
  final bool? isUpdateEvent;

  final AsyncValue<UpdateHandlersResponse>? updateHandlersResponse;
  final AsyncValue<DeleteHandlerResponse>? deleteHandlersResponse;

  final CreateEventResponse? createEventResponse;

  final List<HandlerModel> operators;
  final List<HandlerModel> handlers;
  final AsyncValue<String>? updateEventResponse;

  final String msg;

  final bool isQr;
  final bool isLocation;
  final bool isConfirmation;
  final String templateMessage;

  UpdateEventState({
    required this.updatedEvent,
    required this.msg,
    required this.updateHandlersResponse,
    required this.deleteHandlersResponse,
    required this.operators,
    required this.handlers,
    required this.isUpdateEvent,
    required this.createEventResponse,
    required this.updateEventResponse,
    required this.isQr,
    required this.isLocation,
    required this.isConfirmation,
    required this.templateMessage,
  });

  factory UpdateEventState.init() => UpdateEventState(
        updatedEvent: EventModel(),
        updateEventResponse: null,
        isConfirmation: false,
        isLocation: false,
        templateMessage: '',
        isQr: false,
        msg: '',
        updateHandlersResponse: null,
        deleteHandlersResponse: null,
        operators: [],
        handlers: [],
        isUpdateEvent: false,
        createEventResponse: null,
      );

  UpdateEventState copyWith({
    EventModel? updatedEvent,
    bool? isUpdateEvent,
    bool? isQr,
    bool? isLocation,
    bool? isConfirmation,
    String? templateMessage,
    CreateEventResponse? createEventResponse,
    AsyncValue<String>? updateEventResponse,
    AsyncValue<UpdateHandlersResponse>? updateHandlersResponse,
    AsyncValue<DeleteHandlerResponse>? deleteHandlersResponse,
    List<HandlerModel>? operators,
    List<HandlerModel>? handlers,
    String? msg,
  }) {
    return UpdateEventState(
      isQr: isQr ?? this.isQr,
      isLocation: isLocation ?? this.isLocation,
      isConfirmation: isConfirmation ?? this.isConfirmation,
      templateMessage: templateMessage ?? this.templateMessage,
      updateEventResponse: updateEventResponse ?? this.updateEventResponse,
      deleteHandlersResponse:
          deleteHandlersResponse ?? this.deleteHandlersResponse,
      updateHandlersResponse:
          updateHandlersResponse ?? this.updateHandlersResponse,
      msg: msg ?? this.msg,
      operators: operators ?? this.operators,
      handlers: handlers ?? this.handlers,
      isUpdateEvent: isUpdateEvent,
      updatedEvent: updatedEvent ?? this.updatedEvent,
      createEventResponse: createEventResponse ?? this.createEventResponse,
    );
  }
}

class ComparableGuest extends Equatable {
  final String number;
  final int partySize;
  final String? firstName;
  final String? lastName;

  ComparableGuest({
    required this.number,
    required this.partySize,
    this.firstName,
    this.lastName,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [number, partySize, firstName, lastName];
}
