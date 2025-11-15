import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wedding_app/features/auth/presentation/controller/auth_ui_state.dart';

part 'auth_ui_controller.g.dart';

@riverpod
class AuthUiController extends _$AuthUiController {
  @override
  AuthUiState build() {
    return AuthUiState.initial();
  }

  void agreeTerms() {
    state = state.copyWith(isAgree: !state.isAgree);
  }

  void checkPhoneFilled(bool isFilled) {
    state = state.copyWith(isPhoneFilled: isFilled);
  }

  void makeResendButtonVisibleOrNo(bool isVisible) {
    state = state.copyWith(isResendVisible: isVisible, isTimerZero: true);
  }
}
