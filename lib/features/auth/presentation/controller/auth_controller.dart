import 'package:kroot_app/src/notifications/notifications/services/notification_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:kroot_app/features/auth/application/auth_service.dart';
import 'package:kroot_app/features/auth/data/repo/auth_repository.dart';
import 'package:kroot_app/features/auth/presentation/controller/auth_controller_state.dart';
import 'package:kroot_app/features/auth/presentation/controller/send_otp_controller.dart';

part 'auth_controller.g.dart';

@Riverpod(keepAlive: true)
class AuthController extends _$AuthController {
  @override
  FutureOr<AuthControllerState?> build() => null;

  Future<void> verifyOtp(String otp, String? numberNull) async {
    try {
      final number = ref
          .read(sendOtpControllerProvider)
          .asData
          ?.value
          ?.mobile_number;
      // final number = state.value?.sendOtpResponse?.mobile_number;
      state = AsyncLoading();
      final result = await ref
          .read(authRepositoryProvider)
          .verifyOtp(
            number:
                numberNull?.replaceAll('+', '') ??
                number?.replaceAll('+', '') ??
                '',
            otp: otp,
          );
      // .verifyOtp(number: '97451365471' ?? number ?? '', otp: otp);

      if (result.hasFailed) {
        // throw Exception(result.message);
        state = AsyncError(result.message ?? '', StackTrace.current);
        return;
      }
      await ref.read(userDataProvider.notifier).setData(result.data!.token!);
      await ref
          .read(notificationsServiceProvider)
          .sendDeviceToken(result.data!.email!);

      state = AsyncData(
        state.value?.copyWith(verifyOtpResponse: result.data) ??
            AuthControllerState(verifyOtpResponse: result.data),
      );
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> creataAccount({
    required String firstName,
    required String lastName,
    required String number,
    String? email,
  }) async {
    try {
      // final number = state.value?.sendOtpResponse?.mobile_number;
      state = const AsyncLoading();
      final result = await ref
          .read(authRepositoryProvider)
          .createAccount(
            firstName: firstName,
            lastName: lastName,
            mobile: number.replaceAll('+', ''),
            email: email,
          );

      if (result.hasFailed) {
        // throw Exception(result.message);
        state = AsyncError(result.message ?? '', StackTrace.current);
        return;
      }
      state = AsyncData(
        state.value?.copyWith(createAccountResponse: result.data) ??
            AuthControllerState(createAccountResponse: result.data),
      );
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
