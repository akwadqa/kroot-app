// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_otp_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SendOtpController)
const sendOtpControllerProvider = SendOtpControllerProvider._();

final class SendOtpControllerProvider
    extends $AsyncNotifierProvider<SendOtpController, SendOtpResponse?> {
  const SendOtpControllerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'sendOtpControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$sendOtpControllerHash();

  @$internal
  @override
  SendOtpController create() => SendOtpController();
}

String _$sendOtpControllerHash() => r'b093498fa9a6420ae87afa7c434c7342bbf9fb39';

abstract class _$SendOtpController extends $AsyncNotifier<SendOtpResponse?> {
  FutureOr<SendOtpResponse?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<SendOtpResponse?>, SendOtpResponse?>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<SendOtpResponse?>, SendOtpResponse?>,
        AsyncValue<SendOtpResponse?>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
