import 'package:kroot_app/features/notifications/data/repositories/notifications_repository.dart';
import 'package:kroot_app/features/notifications/domain/model/app_notifications_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_notifications_controller.g.dart';

@riverpod
class AppNotificationsController extends _$AppNotificationsController {
  List<AppNotificationsModel> _notifications = [];
  int _currentPage = 1;
  int _totalPages = 1;

  @override
  FutureOr<List<AppNotificationsModel>> build() async {
    final result = await fetchOrdersOffersNotifications(page: 1);
    return result!;
  }

  Future<List<AppNotificationsModel>?> fetchOrdersOffersNotifications({
    required int page,
    bool showLoading = true,
  }) async {
    try {
      if (showLoading) state = const AsyncLoading();

      final repo = ref.read(notificationsRepositoryProvider);
      final response = await repo.getAllOrdersNotifications(page: page);

      // فحص شامل: هل الرد ككل نول؟ هل السيرفر أبلغ عن فشل؟ هل الداتا نول؟
      if (response.hasFailed || response.data == null) {
        final errorMessage =
            response.message ?? "حدث خطأ غير متوقع في السيرفر";
        state = AsyncError(errorMessage, StackTrace.current);
        return null;
      }

      // هنا نحن متأكدون أن البيانات موجودة
      _currentPage = response.pagination?.currentPage ?? 1;
      _totalPages = response.pagination?.totalPages ?? 1;

      final List<AppNotificationsModel> newData = List.from(response.data!);

      if (page == 1) {
        _notifications = newData;
      } else {
        _notifications = [..._notifications, ...newData];
      }

      state = AsyncData(_notifications);
      return _notifications;
    } catch (e, st) {
      // في حال حدوث Null Check Operator used on a null value أو Cast error
      state = AsyncError(e, st);
      return null;
    }
  }

  Future<bool> loadNextPage() async {
    if (_currentPage >= _totalPages) return false;
    final nextPage = _currentPage + 1;
    final result = await fetchOrdersOffersNotifications(
      page: nextPage,
      showLoading: false,
    );
    return result?.isNotEmpty ?? false;
  }

  Future<bool> refreshOrders() async {
    _notifications.clear();
    _currentPage = 1;
    _totalPages = 1;
    await fetchOrdersOffersNotifications(page: 1);
    return true;
  }
}
