import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:kroot_app/features/event/data/models/event_response/create_event_response.dart';
import 'package:kroot_app/features/event/data/models/get_user_events/get_user_events_model.dart';
import 'package:kroot_app/features/event/data/repositories/home_repositories.dart';
import 'package:kroot_app/features/event/presentation/controller/add_event/add_event_state.dart';
import 'package:kroot_app/features/event/presentation/controller/contacts_controller/contacts_controller.dart';
import 'package:kroot_app/features/event/presentation/controller/home_controller.dart';
import 'package:kroot_app/features/event/presentation/controller/map_controller/map_controller.dart';
import 'package:kroot_app/features/event/presentation/controller/map_controller/map_state.dart';

part 'add_event_controller.g.dart';

@riverpod
class AddEventController extends _$AddEventController {
  @override
  FutureOr<AddEventState> build() {
    // Keeps the create-flow contacts & map alive and syncs them into the event.
    ref.listen(contactsControllerProvider(null), (_, __) {
      if (state.hasValue) updateEvent(EventModel());
    });
    ref.listen(
      mapControllerProvider(null).select((val) => val.value?.selectedPlace),
      (_, next) {
        if (next is AsyncData<SelectedPlace> && state.hasValue) {
          updateEvent(_locationFromPlace(next.value));
        }
      },
    );
    return AddEventState.init();
  }

  EventModel _locationFromPlace(SelectedPlace? place) {
    if (place == null) return EventModel();
    return EventModel(
      locationName: place.locationName,
      mapLatitude: place.lat.toString(),
      mapLongitude: place.lng.toString(),
    );
  }

  List<GuestModel> _guests() =>
      ref.read(contactsControllerProvider(null).notifier).toGuestModels();

  void clearEventScreen() {
    ref.invalidate(contactsControllerProvider(null));
    ref.invalidate(mapControllerProvider(null));
    state = AsyncData(state.value!.copyWith(eventModel: EventModel()));
  }

  void deleteImage() {
    final current = state.value?.eventModel ?? EventModel();

    final firstType = ref
        .read(homeControllerProvider)
        .value
        ?.utilsResponse
        ?.value
        ?.eventTypes
        ?.first;
    state = AsyncData(
      state.value!.copyWith(
        eventModel: current.copyWith(
          type: current.type ?? firstType,
          title: current.title,
          date: current.date,
          language: current.language ?? 'Arabic',
          showQr: current.showQr,
          image: null,
          guests: _guests(),
        ),
      ),
    );
  }

  void addOperator(HandlerModel operator) {
    if (!state.value!.operators.contains(operator)) {
      state = AsyncData(
        state.value!.copyWith(
          operators: List.from([...state.value!.operators, operator]),
        ),
      );
    }
  }

  void removeOperator(HandlerModel operator) {
    state = AsyncData(
      state.value!.copyWith(
        operators: state.value!.operators
            .where((e) => e.whatsappNumber != operator.whatsappNumber)
            .toList(),
      ),
    );
  }

  void removeHandler(HandlerModel handler) {
    state = AsyncData(
      state.value!.copyWith(
        handlers: state.value!.handlers
            .where((e) => e.whatsappNumber != handler.whatsappNumber)
            .toList(),
      ),
    );
  }

  void addHandler(HandlerModel handler) {
    if (!state.value!.handlers.contains(handler)) {
      state = AsyncData(
        state.value!.copyWith(
          handlers: List.from([...state.value!.handlers, handler]),
        ),
      );
    }
  }

  void makeHandlerScanableOrNot(HandlerModel editedHandler) {
    final newHandlers = state.value!.handlers.map((handler) {
      if (handler.whatsappNumber == editedHandler.whatsappNumber) {
        return handler.copyWith(scanAccess: handler.scanAccess == 1 ? 0 : 1);
      }
      return handler;
    }).toList();
    state = AsyncData(state.value!.copyWith(handlers: newHandlers));
  }

  void makeHandlerEditableOrNot(HandlerModel editedHandler) {
    final newHandlers = state.value!.handlers.map((handler) {
      if (handler.whatsappNumber == editedHandler.whatsappNumber) {
        return handler.copyWith(
          editEventAccess: handler.editEventAccess == 1 ? 0 : 1,
        );
      }
      return handler;
    }).toList();
    state = AsyncData(state.value!.copyWith(handlers: newHandlers));
  }

  void updateEventDate(DateTime newDate) {
    final current = DateTime.parse(
      state.value?.eventModel?.date ?? DateTime.now().toString(),
    );

    final updated = DateTime(
      newDate.year,
      newDate.month,
      newDate.day,
      current.hour,
      current.minute,
    );

    updateEvent(EventModel(date: updated.toString()));
  }

  void updateEventTime(TimeOfDay newTime) {
    final current = DateTime.parse(
      state.value?.eventModel?.date ?? DateTime.now().toString(),
    );

    final updated = DateTime(
      current.year,
      current.month,
      current.day,
      newTime.hour,
      newTime.minute,
    );

    updateEvent(EventModel(date: updated.toString()));
  }

  void updateEvent(EventModel newData) {
    final current = state.value?.eventModel ?? EventModel();

    final firstType = ref
        .read(homeControllerProvider)
        .value
        ?.utilsResponse
        ?.value
        ?.eventTypes
        ?.first;

    state = AsyncData(
      state.value!.copyWith(
        eventModel: current.copyWith(
          type: newData.type ?? current.type ?? firstType,
          title: newData.title ?? current.title,
          date: newData.date ?? current.date,
          language: newData.language ?? current.language ?? 'Arabic',
          locationName: newData.locationName ?? current.locationName,
          showQr: newData.showQr ?? current.showQr,
          image: newData.image ?? current.image,
          mapLatitude: newData.mapLatitude ?? current.mapLatitude,
          mapLongitude: newData.mapLongitude ?? current.mapLongitude,
          operators: newData.operators ?? state.value!.operators,
          handlers: newData.handlers ?? state.value!.handlers,
          qrDelivery: newData.qrDelivery ?? current.qrDelivery ?? 'Disabled',
          guests: _guests(),
          inviteMessage: state.value!.templateMessage,
          hasConfirmationButton: state.value!.isConfirmation,
          hasLocationButton: state.value!.isLocation,
        ),
      ),
    );
  }

  Future<CreateEventResponse?> createEvent() async {
    try {
      updateEvent(
        _locationFromPlace(
          ref.read(mapControllerProvider(null)).value?.selectedPlace?.value,
        ),
      );
      state = AsyncData(state.value!.copyWith(isAddEvent: true));
      state = AsyncLoading();
      final repo = ref.read(homeRepositoryProvider);
      final response = await repo.createEvent(state.value!.eventModel!);

      if (response.hasFailed) {
        state = AsyncError(
          response.message ?? '',
          StackTrace.fromString(response.message ?? ''),
        );
        state = AsyncData(state.value!.copyWith(isAddEvent: false));
      }

      state = AsyncData(
        state.value!.copyWith(
          createEventResponse: response.data,
          isAddEvent: false,
        ),
      );
      return response.data;
    } catch (e, st) {
      state = AsyncError(e, st);
      state = AsyncData(state.value!.copyWith(isAddEvent: false));
      return null;
    }
  }

  void changeQrState(bool isEnabled) {
    state = AsyncData(
      state.value!.copyWith(
        isQr: isEnabled,
      ),
    );
  }

  void changeTemplateMessage(String message) {
    state = AsyncData(
      state.value!.copyWith(
        templateMessage: message,
      ),
    );
  }

  void changeLocationState(bool isEnables) {
    state = AsyncData(
      state.value!.copyWith(
        isLocation: isEnables,
      ),
    );
  }

  void changeConfirmationState(bool isEnables) {
    state = AsyncData(
      state.value!.copyWith(
        isConfirmation: isEnables,
      ),
    );
  }
}
