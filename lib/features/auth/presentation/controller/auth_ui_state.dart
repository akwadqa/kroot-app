// ignore_for_file: public_member_api_docs, sort_constructors_first
class AuthUiState {
  final bool isAgree, isValidate, isPhoneFilled, isResendVisible , isTimerZero;

  AuthUiState({
    required this.isAgree,
    required this.isValidate,
    required this.isPhoneFilled,
    required this.isResendVisible,
    required this.isTimerZero,
  });

  factory AuthUiState.initial() => AuthUiState(
    isAgree: false,
    isValidate: false,
    isPhoneFilled: false,
    isTimerZero: false,
    isResendVisible: false,
  );

  AuthUiState copyWith({
    bool? isAgree,
    bool? isValidate,
    bool? isPhoneFilled,
    bool? isResendVisible,
    bool? isTimerZero
  }) {
    return AuthUiState(
      isTimerZero:isTimerZero ?? this.isTimerZero,
      isValidate: isValidate ?? this.isValidate,
      isAgree: isAgree ?? this.isAgree,
      isResendVisible: isResendVisible ?? this.isResendVisible,
      isPhoneFilled: isPhoneFilled ?? this.isPhoneFilled,
    );
  }
}
