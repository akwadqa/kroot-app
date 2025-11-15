class ProfileState {
  final int index;
  final bool? isLogout;

  ProfileState({required this.index, this.isLogout});

  factory ProfileState.init() => ProfileState(index: 0, isLogout: false);

  ProfileState copyWith({int? index, bool? isLogout}) {
    return ProfileState(index: index ?? this.index, isLogout: isLogout);
  }
}
