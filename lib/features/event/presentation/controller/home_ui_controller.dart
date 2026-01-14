import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:kroot_app/features/event/presentation/controller/home_ui_state.dart';

part 'home_ui_controller.g.dart';

@riverpod
class HomeUiController extends _$HomeUiController {
  @override
  HomeUiState build() {
    return HomeUiState.init();
  }

  void changeBottomIndex() {
    final current = state;
    if (current.bottomSheetIndex == 0) {
      state = HomeUiState(bottomSheetIndex: 1);
    } else {
      state = HomeUiState(bottomSheetIndex: 0);
    }
  }
}
