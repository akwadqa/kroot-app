import 'package:kroot_app/features/profile/data/repository/profile_respository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:kroot_app/features/auth/application/auth_service.dart';
import 'package:kroot_app/features/profile/presentation/controller/profile_state.dart';

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

  Future<String?> getPaymentUrl(String subscription_type,String local) async {
    try {
      state = AsyncData(state.value!.copyWith(paymentLink: AsyncLoading()));
      final repo = ref.read(profileRespositoryProvider);
      final response = await repo.getPaymentUrl(subscription_type,local);

      if (response.hasFailed) {
        state = AsyncData(
          state.value!.copyWith(
            paymentLink: AsyncError(
              response.message ?? '',
              StackTrace.fromString(response.message ?? ''),
            ),
          ),
        );

        return null;
      }

      state = AsyncData(
        state.value!.copyWith(paymentLink: AsyncData(response.data!)),
      );
      return response.data;
    } catch (e, st) {
      state = AsyncData(state.value!.copyWith(paymentLink: AsyncError(e, st)));
      return null;
    }
  }

  Future<void> logout() async {
    try {
      state = AsyncData(state.value!.copyWith(isLogout: true));
      state = const AsyncLoading();
      ref.read(userDataProvider.notifier).removeData();
      state = AsyncData(state.value!.copyWith(isLogout: false));
    } catch (e, st) {
      state = AsyncError(e, st);
      state = AsyncData(state.value!.copyWith(isLogout: false));
    }

    // state = await AsyncValue.guard(() async {
    //   ref.read(userDataProvider.notifier).removeData();
    //   return state.value!;
    // });
  }
}
