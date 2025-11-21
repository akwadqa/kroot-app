// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:kroot_app/features/event/data/models/add_guests_response/add_guests_response.dart';
import 'package:kroot_app/features/event/data/models/get_user_events/get_user_events_model.dart';
import 'package:kroot_app/features/guests/domain/model/update_guest_list_response.dart/update_guest_list_response.dart';
import 'package:kroot_app/features/guests/domain/model/update_guest_response/update_guest_response.dart';

class GuestsState {
  final AsyncValue<AddGuestsResponse>? addGuestsResponse;
  final AsyncValue<UpdateGuestResponse>? updateGuestResponse;
  final AsyncValue<UpdateGuestListRespone>? updateGuestListRespone;
  final AsyncValue<UpdateGuestResponse>? deleteGuestResponse;
  final List<GuestModel>? guestsList;

  GuestsState({
    this.guestsList,
    this.addGuestsResponse,
    this.updateGuestResponse,
    this.updateGuestListRespone,
    this.deleteGuestResponse,
  });

  factory GuestsState.init() => GuestsState(
    addGuestsResponse: null,
    updateGuestResponse: null,
    guestsList: [],
    updateGuestListRespone: null,
    deleteGuestResponse: null,
  );

  GuestsState copyWith({
    AsyncValue<AddGuestsResponse>? addGuestsResponse,
    AsyncValue<UpdateGuestResponse>? updateGuestResponse,
    AsyncValue<UpdateGuestListRespone>? updateGuestListRespone,
    AsyncValue<UpdateGuestResponse>? deleteGuestResponse,
    List<GuestModel>? guestsList,
  }) {
    return GuestsState(
      addGuestsResponse: addGuestsResponse ?? this.addGuestsResponse,
      updateGuestResponse: updateGuestResponse ?? this.updateGuestResponse,
      updateGuestListRespone:
          updateGuestListRespone ?? this.updateGuestListRespone,
      deleteGuestResponse: deleteGuestResponse ?? this.deleteGuestResponse,
      guestsList: guestsList ?? this.guestsList,
    );
  }
}
