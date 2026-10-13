import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kroot_app/features/event/domain/model/delete_handler_response/delete_handler_response.dart';
import 'package:kroot_app/features/event/domain/model/update_handlers_response/update_handlers_response.dart';
import 'package:kroot_app/features/event/presentation/controller/contacts_controller/contacts_controller.dart';
import 'package:kroot_app/features/event/presentation/controller/map_controller/map_controller.dart';
import 'package:kroot_app/features/event/presentation/controller/map_controller/map_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:kroot_app/features/event/domain/model/event_response/create_event_response.dart';
import 'package:kroot_app/features/event/domain/model/get_user_events/get_user_events_model.dart';
import 'package:kroot_app/features/event/data/repositories/home_repositories.dart';
import 'package:kroot_app/features/event/presentation/controller/home_controller.dart';
import 'package:kroot_app/features/event/presentation/controller/update_event/update_event_state.dart';
part 'update_event_controller.g.dart';

@riverpod
class UpdateEventController extends _$UpdateEventController {
  @override
  FutureOr<UpdateEventState> build() {
    state = AsyncData(UpdateEventState.init());
    final occasion = ref.watch(homeControllerProvider).value?.occasionModel?.value;

    if (occasion == null) return UpdateEventState.init();

    final occasionId = occasion.occasionId;
    if (occasionId != null) {
      // Keeps this event's contacts & map alive and syncs them into the event.
      ref.listen(contactsControllerProvider(occasionId), (_, __) {
        if (state.hasValue) updateDataForEvent(EventModel(), occasionId);
      });
      ref.listen(
        mapControllerProvider(occasionId)
            .select((val) => val.value?.selectedPlace),
        (_, next) {
          if (next is AsyncData<SelectedPlace> && state.hasValue) {
            updateDataForEvent(_locationFromPlace(next.value), occasionId);
          }
        },
      );
    }

    return UpdateEventState.init().copyWith(
      operators: occasion.operators,
      handlers: occasion.handlers,
      isConfirmation: occasion.hasConfirmationButton,
      isLocation: occasion.hasLocationButton,
      isQr: occasion.qrDelivery != 'Disabled',
      templateMessage: occasion.inviteMessage,
    );
  }

  EventModel _locationFromPlace(SelectedPlace? place) {
    if (place == null) return EventModel();
    return EventModel(
      locationName: place.locationName,
      mapLatitude: place.lat.toString(),
      mapLongitude: place.lng.toString(),
    );
  }

  List<GuestModel> _guests(String id) =>
      ref.read(contactsControllerProvider(id).notifier).toGuestModels();

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

  void updateEventDate(DateTime newDate, String id) {
    final current = DateTime.parse(
      state.value?.updatedEvent?.date ?? DateTime.now().toString(),
    );

    final updated = DateTime(
      newDate.year,
      newDate.month,
      newDate.day,
      current.hour,
      current.minute,
    );

    updateDataForEvent(EventModel(date: updated.toString()), id);
  }

  void updateEventTime(TimeOfDay newTime, String id) {
    final current = DateTime.parse(
      state.value?.updatedEvent?.date ?? DateTime.now().toString(),
    );

    final updated = DateTime(
      current.year,
      current.month,
      current.day,
      newTime.hour,
      newTime.minute,
    );

    updateDataForEvent(EventModel(date: updated.toString()), id);
  }

  Future<UpdateHandlersResponse?> updateHandlers() async {
    try {
      state = AsyncData(
        state.value!.copyWith(updateHandlersResponse: AsyncLoading()),
      );
      final repo = ref.read(homeRepositoryProvider);

      final response = await repo.updateHandlers(
        state.value!.updatedEvent!.occasionId!,
        List.from([...state.value!.handlers, ...state.value!.operators]),
      );

      if (response.hasFailed) {
        state = AsyncData(
          state.value!.copyWith(
            updateHandlersResponse: AsyncError(
              response.message ?? '',
              StackTrace.fromString(response.message ?? ''),
            ),
          ),
        );
        return null;
      }

      state = AsyncData(
        state.value!.copyWith(
          updateHandlersResponse: AsyncData(response.data!),
        ),
      );
      return response.data;
    } catch (e, st) {
      state = AsyncData(
        state.value!.copyWith(updateHandlersResponse: AsyncError(e, st)),
      );
      return null;
    }
  }

  Future<DeleteHandlerResponse?> deleteHandler(String id) async {
    try {
      state = AsyncData(
        state.value!.copyWith(deleteHandlersResponse: AsyncLoading()),
      );
      final repo = ref.read(homeRepositoryProvider);
      final response = await repo.deleteHandlers(id, state.value!.handlers);

      if (response.hasFailed) {
        state = AsyncData(
          state.value!.copyWith(
            deleteHandlersResponse: AsyncError(
              response.message ?? '',
              StackTrace.fromString(response.message ?? ''),
            ),
          ),
        );
        return null;
      }

      state = AsyncData(
        state.value!.copyWith(
          deleteHandlersResponse: AsyncData(response.data!),
        ),
      );
      return response.data;
    } catch (e, st) {
      state = AsyncData(
        state.value!.copyWith(deleteHandlersResponse: AsyncError(e, st)),
      );
      return null;
    }
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

  Future<CreateEventResponse?> updateEventToServer(String id) async {
    try {
      updateDataForEvent(
        _locationFromPlace(
          ref.read(mapControllerProvider(id)).value?.selectedPlace?.value,
        ),
        id,
      );
      state =
          AsyncData(state.value!.copyWith(updateEventResponse: AsyncLoading()));

      final repo = ref.read(homeRepositoryProvider);
      final response = await repo.updateEvent(state.value!.updatedEvent!, id);

      if (response.hasFailed) {
        state = AsyncData(state.value!.copyWith(
            updateEventResponse:
                AsyncError(response.message ?? '', StackTrace.current)));
        return null;
      }

      state = AsyncData(
        state.value!.copyWith(
          createEventResponse: response.data,
          updateEventResponse: AsyncData(''),
          msg: response.message,
        ),
      );
      return response.data;
    } catch (e, st) {
      state = AsyncData(
          state.value!.copyWith(updateEventResponse: AsyncError(e, st)));
      return null;
    }
  }

  void deleteImage(String id) {
    final current = state.value?.updatedEvent;
    final currentEvent =
        ref.read(homeControllerProvider).value?.occasionModel?.value;

    state = AsyncData(
      state.value!.copyWith(
        updatedEvent: EventModel(
          mapLatitude: current?.mapLatitude ?? currentEvent?.mapLatitude,
          mapLongitude: current?.mapLongitude ?? currentEvent?.mapLongitude,
          occasionId: id,
          type: current?.type ?? currentEvent?.type,
          title: current?.title ?? currentEvent?.title,
          date: current?.date ?? currentEvent?.date,
          language: current?.language ?? currentEvent?.language,
          image: null,
          imageUrl: null,
          guests: _guests(id),
        ),
      ),
    );
  }

  void updateDataForEvent(EventModel newData, String id) {
    final current = state.value?.updatedEvent;

    state = AsyncData(
      state.value!.copyWith(
        updatedEvent: EventModel(
          occasionId: id,
          type: newData.type ?? current?.type,
          operators: newData.operators ?? state.value!.operators,
          handlers: newData.handlers ?? state.value!.handlers,
          title: newData.title ?? current?.title,
          mapLatitude: newData.mapLatitude ?? current!.mapLatitude,
          mapLongitude: newData.mapLongitude ?? current!.mapLongitude,
          locationName: newData.locationName ?? current!.locationName,
          date: newData.date ?? current?.date,
          language: newData.language ?? current?.language,
          hasConfirmationButton: state.value!.isConfirmation,
          hasLocationButton: state.value!.isLocation,
          inviteMessage: state.value!.templateMessage,
          image: newData.image ?? current?.image,
          imageUrl: newData.imageUrl ?? current?.imageUrl,
          qrDelivery: newData.qrDelivery ?? current?.qrDelivery ?? 'Disabled',
          guests: _guests(id),
        ),
      ),
    );
  }
}
