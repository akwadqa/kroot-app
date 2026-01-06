class HomeUiState {
  final int? bottomSheetIndex;

  HomeUiState({required this.bottomSheetIndex});

  factory HomeUiState.init() => HomeUiState(bottomSheetIndex: 0);

  HomeUiState copyWith({int? bottomSheetIndex}) {
    return HomeUiState(
      bottomSheetIndex: bottomSheetIndex ?? this.bottomSheetIndex,
    );
  }
}
