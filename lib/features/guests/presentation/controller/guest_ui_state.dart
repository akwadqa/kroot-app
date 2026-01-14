
class GuestUiState {
  final int index;

  GuestUiState({required this.index});

  factory GuestUiState.init() => GuestUiState(index: 0);

  GuestUiState copyWith({int? index}) {
    return GuestUiState(index: index ?? this.index);
  }
}
