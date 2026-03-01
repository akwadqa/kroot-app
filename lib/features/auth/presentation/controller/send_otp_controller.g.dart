// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_otp_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

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

String _$sendOtpControllerHash() => r'26113d657b1de708ed76e7a8ab81e118ebd53daf';

abstract class _$SendOtpController extends $AsyncNotifier<SendOtpResponse?> {
  FutureOr<SendOtpResponse?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<SendOtpResponse?>, SendOtpResponse?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<SendOtpResponse?>, SendOtpResponse?>,
              AsyncValue<SendOtpResponse?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
