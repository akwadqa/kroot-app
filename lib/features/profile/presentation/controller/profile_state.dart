import 'package:riverpod_annotation/riverpod_annotation.dart';

class ProfileState {
  final int index;
  final bool? isLogout;
  final AsyncValue<String>? paymentLink;

  ProfileState({required this.index, this.isLogout, this.paymentLink});

  factory ProfileState.init() =>
      ProfileState(index: 0, isLogout: false, paymentLink: null);

  ProfileState copyWith({
    int? index,
    bool? isLogout,
    AsyncValue<String>? paymentLink,
  }) {
    return ProfileState(
      index: index ?? this.index,
      isLogout: isLogout,
      paymentLink: paymentLink ?? this.paymentLink,
    );
  }
}
