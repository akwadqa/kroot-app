import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wedding_app/features/guests/presentation/controller/guest_ui_state.dart';

part 'guest_ui_controller.g.dart';

@riverpod
class GuestUiController extends _$GuestUiController {
  @override
  GuestUiState build() {
    return GuestUiState.init();
  }

  void changIndex(int index) {
    state = state.copyWith(index: index);
  }
}
