import 'package:flutter/material.dart';
import 'package:kroot_app/features/event/data/models/utils_response/utils_response.dart';
import 'package:kroot_app/features/event/presentation/controller/home_controller.dart';
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

  void changeBundle(BundleModel bundle) {
    state = AsyncData(state.value!.copyWith(bundleModel: bundle));
  }

  Future<String?> getPaymentUrl(String subscriptionType, String local) async {
    try {
      state = AsyncData(state.value!.copyWith(paymentLink: AsyncLoading()));
      final repo = ref.read(profileRespositoryProvider);
      final response = await repo.getPaymentUrl(subscriptionType, local);

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

  Future<void> deleteUser() async {
    try {
      final id = ref
          .read(homeControllerProvider)
          .value!
          .utilsResponse!
          .value!
          .subscriber!
          .email!;
      state = AsyncData(state.value!.copyWith(deleteUser: AsyncLoading()));
      final repo = ref.read(profileRespositoryProvider);
      final response = await repo.deleteUser(id);

      if (response.hasFailed) {
        state = AsyncData(
          state.value!.copyWith(
            deleteUser: AsyncError(
              response.message ?? '',
              StackTrace.fromString(response.message ?? ''),
            ),
          ),
        );

        return;
      }

      state = AsyncData(
        state.value!.copyWith(deleteUser: AsyncData(VoidCallbackAction)),
      );
      return response.data;
    } catch (e, st) {
      state = AsyncData(state.value!.copyWith(deleteUser: AsyncError(e, st)));
      return;
    }
  }

  Future<void> logout() async {
    try {
      state = AsyncData(state.value!.copyWith(isLogout: true));
      state = const AsyncLoading();
      final repo = ref.read(profileRespositoryProvider);
      final response = await repo.logout();
      if (response.hasFailed) {
        state = AsyncError(
          response.message ?? 'Error , try again',
          StackTrace.current,
        );
        state = AsyncData(state.value!.copyWith(isLogout: true));

        return;
      }

      state = AsyncData(state.value!.copyWith(isLogout: true));
    } catch (e, st) {
      state = AsyncError(e, st);
      state = AsyncData(state.value!.copyWith(isLogout: false));
    }
  }
}
