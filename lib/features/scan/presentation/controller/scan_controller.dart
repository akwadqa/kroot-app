import 'package:kroot_app/features/event/data/models/get_user_events/get_user_events_model.dart';
import 'package:kroot_app/features/scan/data/model/user_scan_event_response/user_scan_event_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:kroot_app/features/scan/data/model/scan_qr_response/scan_qr_response.dart';
import 'package:kroot_app/features/scan/data/repository/scan_respository.dart';
import 'package:kroot_app/features/scan/presentation/controller/scan_state.dart';

part 'scan_controller.g.dart';

@riverpod
class ScanController extends _$ScanController {
  @override
  FutureOr<ScanState> build() {
    return ScanState.init();
  }

  int _currentPage = 1;
  int _totalPages = 1;
  List<EventModel> _eventsList = [];

  Future<ScanQrResponse?> scanQr({
    required String qrCode,
    required String checkinBy,
    required String inviteeId,
  }) async {
    try {
      state = AsyncLoading();
      final repo = ref.read(scanRepositoryProvider);
      final response = await repo.scanQr(
        qrCode: qrCode,
        checkinBy: checkinBy,
        inviteeId: inviteeId,
      );

      if (response.hasFailed) {
        state = AsyncError(
          response.message ?? '',
          StackTrace.fromString(response.message ?? ''),
        );
        // throw Exception(response.message);
      }

      state = AsyncData(state.value!.copyWith(scanQrResponse: response.data));
      return response.data;
    } catch (e, st) {
      state = AsyncError(e, st);
      return null;
    }
  }

  Future<UserScanEventResponse?> getUserScanEvent({
    required int page,
    bool showLoading = true,
  }) async {
    try {
      if (showLoading) state = AsyncLoading();
      final repo = ref.read(scanRepositoryProvider);
      final response = await repo.getUserScanEvent(page: page);
      _currentPage = response.pagination?.currentPage ?? _currentPage;
      _totalPages = response.pagination?.totalPages ?? _totalPages;

      if (page == 1) {
        _eventsList = List.from(response.data!.ownedEvents ?? []);
      } else {
        _eventsList.addAll(
          (response.data?.ownedEvents ?? []) as Iterable<EventModel>,
        );
      }

      if (response.hasFailed) {
        state = AsyncError(
          response.message ?? '',
          StackTrace.fromString(response.message ?? ''),
        );
        throw Exception(response.message);
      }
      final eventResponse = UserScanEventResponse(
        participantEvents: [],
        ownedEvents: _eventsList,
      );

      state = AsyncData(
        state.value!.copyWith(userScanEventResponse: eventResponse),
      );
      return response.data;
    } catch (e, st) {
      state = AsyncError(e, st);
      return null;
    }
  }

  Future<bool> onLoadMoreEvents() async {
    if (_currentPage >= _totalPages) return false;
    final nextPage = _currentPage + 1;
    final result = await getUserScanEvent(showLoading: false, page: nextPage);
    return result?.ownedEvents.isNotEmpty ?? false;
  }
}
