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
      // state = AsyncLoading();
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

        // state = AsyncError(
        //   response.message ?? '',
        //   StackTrace.fromString(response.message ?? ''),
        // );
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
      // state = AsyncError(e, st);
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
      // state = AsyncLoading();
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
      final nameParts = (s.contact.displayName ?? '').split(' ');
      final firstName = nameParts.isNotEmpty ? nameParts.first : null;
      final lastName = nameParts.length > 1
          ? nameParts.sublist(1).join(' ')
          : null;

      final number = (s.contact.phones.isNotEmpty)
          // ? '${s.code}${s.contact.phones.first.number}'
          ? s.contact.phones.first.number.replaceAll(' ', '').length > 11
                ? '${s.contact.phones.first.number.replaceAll(' ', '')}'
                // ? '${s.contact.phones.first.number.replaceAll(' ', '').substring(1)}'
                // : '${s.code}${s.contact.phones.first.number.replaceAll(' ', '').substring(4)}'
                : '${s.code}${s.contact.phones.first.number.replaceAll(' ', '')}'
          : null;
      // return {};

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
    // required List<GuestModel> guests,
  }) async {
    try {
      // state = AsyncLoading();
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
      // state = AsyncLoading();
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

// @riverpod
// class GuestsController extends _$GuestsController {
//   List<GuestModel> _guests = [];
//   int _currentPage = 1;
//   int _totalPages = 1;
//   String? _query;
//   RsvpStatus? _filter;
//   Timer? _debounce;
//   @override
//   FutureOr<List<GuestModel>> build() async {
//     return await fetchGuestsData(page: 1);
//   }

//   Future<List<GuestModel>> fetchGuestsData({
//     required int page,
//     bool showLoading = true,
//     String? search,
//     RsvpStatus? statusFilter,
//   }) async {
//     try {
//       if (showLoading) state = const AsyncLoading();

//       final repo = ref.read(guestsRepositoryProvider);
//       final response = await repo.getAllGuests(
//         page: page,
//         status: _filter ?? statusFilter,
//         searchKey: _query ?? search,
//       );

//       // افترض أن الدالة ترجع كائن يحتوي على:
//       // data: List<GuestModel>
//       // pagination: {...}
//       _currentPage = response.pagination?.currentPage ?? 0;
//       _totalPages = response.pagination?.totalPages ?? 1;

//       if (page == 1) {
//         _guests = List.from(response.data!);
//       } else {
//         _guests = [..._guests, ...response.data!]; // 👈 new list
//       }

//       state = AsyncData(List.from(_guests));
//       return _guests;
//     } catch (e, st) {
//       state = AsyncError(e, st);
//       return [];
//     }
//   }

//   Future<bool> loadNextPage() async {
//     if (_currentPage >= _totalPages) return false;
//     final nextPage = _currentPage + 1;
//     final result = await fetchGuestsData(page: nextPage, showLoading: false);
//     return result.isNotEmpty;
//   }

//   void setQuery(String q) {
//     _debounce?.cancel();
//     _debounce = Timer(const Duration(milliseconds: 350), () {
//       _query = q.trim();
//       _restart();
//     });
//   }

//   void setStatus(RsvpStatus? status) {
//     _filter = status;
//     _restart();
//   }

//   void _restart() {
//     _currentPage = 1;
//     _totalPages = 1;
//     _guests.clear();
//     fetchGuestsData(page: 1, showLoading: true);
//   }

//   Future<bool> refreshGuests() async {
//     _guests.clear();
//     _currentPage = 1;
//     _totalPages = 1;
//     await fetchGuestsData(page: 1);
//     return true;
//   }

//   List<GuestModel> getFilteredOrders(RsvpStatus? status) {
//     if (status == RsvpStatus.all) {
//       return state.value!;
//     }
//     return state.value
//             ?.where((order) => order.rsvpStatus.name == status?.name)
//             .toList() ??
//         [];
//   }
// }
// 
// features/guests/presentation/controller/guests_controller.dart
// import 'dart:async';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
// import '../../../domain/guest_model.dart';
// import '../../../domain/rsvp_status.dart';
// import '../../../data/guests_repository.dart';

// part 'guests_controller.g.dart';

// @riverpod
// class GuestsController extends _$GuestsController {
//   static const _limit = 20;
//   int _page = 1;
//   int _totalPages = 1;
//   final List<GuestModel> _items = [];

  // String _query = '';
  // RsvpStatus? _filter;
  // Timer? _debounce;

//   @override
//   FutureOr<List<GuestModel>> build() async {
//     return await _fetch(page: 1, showLoading: true);
//   }

//   Future<List<GuestModel>> _fetch({required int page, bool showLoading = false}) async {
//     try {
//       if (showLoading) state = const AsyncLoading();

//       final res = await ref.read(guestsRepositoryProvider).list(
//             page: page,
//             limit: _limit,
//             query: _query.isEmpty ? null : _query,
//             status: _filter,
//           );

//       if (!res.hasSucceeded) {
//         throw res.message ?? 'Failed to load guests';
//       }

//       _page = res.pagination?.page ?? page;
//       _totalPages = res.pagination?.totalPages ?? _totalPages;

//       if (page == 1) {
//         _items
//           ..clear()
//           ..addAll(res.data ?? const []);
//       } else {
//         _items.addAll(res.data ?? const []);
//       }

//       state = AsyncData(List.unmodifiable(_items));
//       return _items;
//     } catch (e, st) {
//       state = AsyncError(e, st);
//       return [];
//     }
//   }

//   Future<void> refresh() async {
//     _page = 1;
//     _totalPages = 1;
//     _items.clear();
//     await _fetch(page: 1, showLoading: true);
//   }

//   Future<bool> loadMore() async {
//     if (_page >= _totalPages) return false;
//     final next = _page + 1;
//     final r = await _fetch(page: next);
//     return r.isNotEmpty;
//   }

//   void setQuery(String q) {
//     _debounce?.cancel();
//     _debounce = Timer(const Duration(milliseconds: 350), () {
//       _query = q.trim();
//       _restart();
//     });
//   }

  // void setStatus(RsvpStatus? s) {
  //   _filter = s;
  //   _restart();
  // }

  // void _restart() {
  //   _page = 1;
  //   _totalPages = 1;
  //   _items.clear();
  //   _fetch(page: 1, showLoading: true);
  // }
// }
