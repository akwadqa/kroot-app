import 'dart:async';

import 'package:kroot_app/features/event/data/models/add_guests_response/add_guests_response.dart';
import 'package:kroot_app/features/event/data/models/get_user_events/get_user_events_model.dart';
import 'package:kroot_app/features/event/data/repositories/home_repositories.dart';
import 'package:kroot_app/features/event/presentation/controller/home_controller.dart';
import 'package:kroot_app/features/event/presentation/controller/update_event/update_event_controller.dart';
import 'package:kroot_app/features/guests/domain/model/update_guest_list_response.dart/update_guest_list_response.dart';
import 'package:kroot_app/features/guests/domain/model/update_guest_response/update_guest_response.dart';
import 'package:kroot_app/features/guests/presentation/controller/guests_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:kroot_app/features/guests/data/repositories/guests_repository.dart';

part 'guests_controller.g.dart';

@riverpod
class GuestsController extends _$GuestsController {
  @override
  FutureOr<GuestsState> build() {
    state = AsyncData(GuestsState.init());
    Future(() {
      state = AsyncData(
        state.value!.copyWith(
          guestsList: state.value?.guestsList?.isEmpty ?? false
              ? ref
                    .read(homeControllerProvider)
                    .value
                    ?.occasionModel
                    ?.value
                    ?.guests
              : state.value!.guestsList,
        ),
      );
    });
    return GuestsState.init();
  }

  Future<AddGuestsResponse?> addGuest({
    required GuestModel guest,
    required String occasionId,
  }) async {
    try {
      state = AsyncData(
        state.value!.copyWith(addGuestsResponse: AsyncLoading()),
      );
      final repo = ref.read(homeRepositoryProvider);
      final response = await repo.addGeusts(occasionId, [guest.toJson()]);

      if (response.hasFailed) {
        state = AsyncData(
          state.value!.copyWith(
            addGuestsResponse: AsyncError(
              response.message ?? '',
              StackTrace.fromString(response.message ?? ''),
            ),
          ),
        );
        return null;
      }

      final newGust = GuestModel(
        inviteeId: response.data!.createdInvitees.first.inviteeId,
        fullName: response.data!.createdInvitees.first.fullName,
        rsvpStatus: 'Not Sent',
      );

      state = AsyncData(
        state.value!.copyWith(
          addGuestsResponse: AsyncData(response.data!),
          guestsList: List.from([...state.value!.guestsList!, newGust]),
        ),
      );
      return response.data;
    } catch (e, st) {
      state = AsyncData(
        state.value!.copyWith(addGuestsResponse: AsyncError(e.toString(), st)),
      );
      return null;
    }
  }

  Future<UpdateGuestResponse?> updateGuest({
    required String inviteeId,
    required String whatsappNumber,
  }) async {
    try {
      state = AsyncData(
        state.value!.copyWith(updateGuestResponse: AsyncLoading()),
      );
      final repo = ref.read(guestsRepositoryProvider);
      final response = await repo.updateGuest(
        inviteeId: inviteeId,
        whatsappNumber: whatsappNumber,
      );

      if (response.hasFailed) {
        state = AsyncData(
          state.value!.copyWith(
            updateGuestResponse: AsyncError(
              response.message ?? '',
              StackTrace.fromString(response.message ?? ''),
            ),
          ),
        );

        return null;
      }

      state = AsyncData(
        state.value!.copyWith(updateGuestResponse: AsyncData(response.data!)),
      );
      return response.data;
    } catch (e, st) {
      state = AsyncData(
        state.value!.copyWith(
          updateGuestResponse: AsyncError(e.toString(), st),
        ),
      );
      return null;
    }
  }

  List<GuestModel>? setGuestListFromContacts() {
    final selectedContacts = ref
        .read(updateEventControllerProvider)
        .value!
        .selectedContacts;
    return selectedContacts?.map((s) {
      final nameParts = (s.contact.displayName).split(' ');
      final firstName = nameParts.isNotEmpty ? nameParts.first : null;
      final lastName = nameParts.length > 1
          ? nameParts.sublist(1).join(' ')
          : null;

      final number = (s.contact.phones.isNotEmpty)
          ? s.contact.phones.first.number.replaceAll(' ', '').length > 11
                ? s.contact.phones.first.number.replaceAll(' ', '')
                : '${s.code}${s.contact.phones.first.number.replaceAll(' ', '')}'
          : null;

      return GuestModel(
        firstName: firstName,
        lastName: lastName,
        whatsappNumber: number,
        partySize: s.count,
      );
    }).toList();
  }

  Future<UpdateGuestListRespone?> updateGuestList({
    required String occasionId,
  }) async {
    try {
      state = AsyncData(
        state.value!.copyWith(updateGuestListRespone: AsyncLoading()),
      );
      final repo = ref.read(guestsRepositoryProvider);
      final response = await repo.updateGuestList(
        occasionId: occasionId,
        guests: setGuestListFromContacts()!,
      );

      if (response.hasFailed) {
        state = AsyncData(
          state.value!.copyWith(
            updateGuestListRespone: AsyncError(
              response.message ?? '',
              StackTrace.fromString(response.message ?? ''),
            ),
          ),
        );

        return null;
      }

      state = AsyncData(
        state.value!.copyWith(
          updateGuestListRespone: AsyncData(response.data!),
        ),
      );
      return response.data;
    } catch (e, st) {
      state = AsyncData(
        state.value!.copyWith(
          updateGuestListRespone: AsyncError(e.toString(), st),
        ),
      );
      return null;
    }
  }

  Future<void> deleteGuest({
    required String occasionId,
    required List<GuestModel> guests,
  }) async {
    try {
      state = AsyncData(
        state.value!.copyWith(deleteGuestResponse: AsyncLoading()),
      );
      final repo = ref.read(guestsRepositoryProvider);
      final response = await repo.deleteGuest(
        occasionId: occasionId,
        guests: guests,
      );

      if (response.hasFailed) {
        state = AsyncData(
          state.value!.copyWith(
            deleteGuestResponse: AsyncError(
              response.message ?? '',
              StackTrace.fromString(response.message ?? ''),
            ),
          ),
        );

        return;
      }

      state = AsyncData(
        state.value!.copyWith(deleteGuestResponse: AsyncData(state.value)),
      );
      return;
    } catch (e, st) {
      state = AsyncData(
        state.value!.copyWith(
          deleteGuestResponse: AsyncError(e.toString(), st),
        ),
      );
      return;
    }
  }
}
