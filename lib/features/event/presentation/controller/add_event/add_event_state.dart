import 'package:kroot_app/features/event/data/models/event_response/create_event_response.dart';
import 'package:kroot_app/features/event/data/models/get_user_events/get_user_events_model.dart';

class AddEventState {
  final EventModel? eventModel;

  final CreateEventResponse? createEventResponse;

  final bool? isAddEvent;

  final List<HandlerModel> operators;
  final List<HandlerModel> handlers;

  final bool isQr;
  final bool isLocation;
  final bool isConfirmation;
  final String templateMessage;

  AddEventState({
    required this.eventModel,
    required this.operators,
    required this.handlers,
    required this.isAddEvent,
    required this.createEventResponse,
    required this.isQr,
    required this.isLocation,
    required this.isConfirmation,
    required this.templateMessage,
  });

  factory AddEventState.init() => AddEventState(
        eventModel: null,
        operators: [],
        handlers: [],
        isConfirmation: false,
        isLocation: false,
        templateMessage: '',
        isQr: false,
        createEventResponse: null,
        isAddEvent: null,
      );

  AddEventState copyWith({
    EventModel? eventModel,
    bool? isAddEvent,
    String? templateMessage,
    List<HandlerModel>? operators,
    List<HandlerModel>? handlers,
    bool? isQr,
    bool? isLocation,
    bool? isConfirmation,
    CreateEventResponse? createEventResponse,
  }) {
    return AddEventState(
      isQr: isQr ?? this.isQr,
      templateMessage: templateMessage ?? this.templateMessage,
      isLocation: isLocation ?? this.isLocation,
      isConfirmation: isConfirmation ?? this.isConfirmation,
      operators: operators ?? this.operators,
      handlers: handlers ?? this.handlers,
      eventModel: eventModel ?? this.eventModel,
      isAddEvent: isAddEvent,
      createEventResponse: createEventResponse ?? this.createEventResponse,
    );
  }
}
