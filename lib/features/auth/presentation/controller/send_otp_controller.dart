import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:kroot_app/features/auth/data/models/send_otp/send_otp_response.dart';
import 'package:kroot_app/features/auth/data/repo/auth_repository.dart';

part 'send_otp_controller.g.dart';

@riverpod
class SendOtpController extends _$SendOtpController {
  @override
  FutureOr<SendOtpResponse?> build() {
    return null;
  }

  Future<void> sendOtp({
    required String number,
    bool isFromCreate = false,
  }) async {
    try {
      if (!isFromCreate) state = const AsyncLoading();
      final result = await ref
          .read(authRepositoryProvider)
          // .sendOtp(number: number);
          // todo :
          // .sendOtp(number: '97451365471');
          .sendOtp(number: number.replaceAll('+', ''));

      if (result.status != 200 && result.status != 404) {
        // throw Exception(result.message);
        state = AsyncError(result.message ?? '', StackTrace.current);
      }
      if (!isFromCreate) {
        state = AsyncData(result.data);
      }
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
