
// part 'guest_details_controller.g.dart';
// @riverpod
// class GuestDetailsController extends _$GuestDetailsController {
//   @override
//   FutureOr<GuestModel> build(String id) async {
//     return fetchGuestDetailsData(id);
//   }

//   Future<GuestModel> fetchGuestDetailsData(String inviteeId) async {
//     try {
//       // use AsyncValue.guard to handle loading + error automatically
//       final repo = ref.read(guestsRepositoryProvider);
//       final response = await repo.getGuestDetails(inviteeId);

//       if (response.hasSucceeded && response.data != null) {
//         final guest = response.data!;
//         state = AsyncData(guest);
//         return guest;
//       } else {
//         throw AppException(response.message ?? "Unexpected error");
//       }
//     } catch (e, st) {
//       state = AsyncError(e, st);
//       rethrow;
//     }
//   }
// }
