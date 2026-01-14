import 'package:kroot_app/features/event/data/models/utils_response/utils_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class ProfileState {
  final int index;
  final bool? isLogout;
  final AsyncValue<String>? paymentLink;

  //? This for select bundle :
  final BundleModel? bundleModel;

  ProfileState({
    this.bundleModel,
    required this.index,
    this.isLogout,
    this.paymentLink,
  });

  factory ProfileState.init() =>
      ProfileState(index: 0, isLogout: false, paymentLink: null);

  ProfileState copyWith({
    int? index,
    bool? isLogout,
    AsyncValue<String>? paymentLink,
    BundleModel? bundleModel,
  }) {
    return ProfileState(
      index: index ?? this.index,
      isLogout: isLogout,
      bundleModel: bundleModel ?? this.bundleModel,
      paymentLink: paymentLink ?? this.paymentLink,
    );
  }
}
