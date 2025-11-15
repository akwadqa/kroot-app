import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:wedding_app/features/auth/application/auth_service.dart';
import 'package:wedding_app/features/profile/presentation/controller/profile_state.dart';

part 'profile_controller.g.dart';

@riverpod
class ProfileController extends _$ProfileController {
  @override
  FutureOr<ProfileState> build() async {
    return ProfileState.init();
  }

  void changeIndex(int index) {
    state = AsyncData(state.value!.copyWith(index: index));
  }

  Future<void> logout() async {
    try {
      state = AsyncData(state.value!.copyWith(isLogout: true));
      state = const AsyncLoading();
      ref.read(userDataProvider.notifier).removeData();
      state = AsyncData(state.value!.copyWith(isLogout: false));
    } catch (e,st) {
        state = AsyncError(e, st);
      state = AsyncData(state.value!.copyWith(isLogout: false));
    }

    // state = await AsyncValue.guard(() async {
    //   ref.read(userDataProvider.notifier).removeData();
    //   return state.value!;
    // });
  }
}
