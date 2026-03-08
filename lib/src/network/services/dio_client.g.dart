// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dio_client.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(dio)
const dioProvider = DioProvider._();

final class DioProvider extends $FunctionalProvider<Dio, Dio, Dio>
    with $Provider<Dio> {
  const DioProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'dioProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$dioHash();

  @$internal
  @override
  $ProviderElement<Dio> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Dio create(Ref ref) {
    return dio(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Dio value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Dio>(value),
    );
  }
}

String _$dioHash() => r'b2c8d0ea919b9569d954884c6b6d80548387d8a2';

@ProviderFor(networkService)
const networkServiceProvider = NetworkServiceFamily._();

final class NetworkServiceProvider extends $FunctionalProvider<
    NetworkService<dynamic>,
    NetworkService<dynamic>,
    NetworkService<dynamic>> with $Provider<NetworkService<dynamic>> {
  const NetworkServiceProvider._(
      {required NetworkServiceFamily super.from, required Dio? super.argument})
      : super(
          retry: null,
          name: r'networkServiceProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$networkServiceHash();

  @override
  String toString() {
    return r'networkServiceProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<NetworkService<dynamic>> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  NetworkService<dynamic> create(Ref ref) {
    final argument = this.argument as Dio?;
    return networkService(
      ref,
      argument,
    );
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NetworkService<dynamic> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NetworkService<dynamic>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is NetworkServiceProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$networkServiceHash() => r'7aecc727f9e648c49709ba09cd80c82e38d00614';

final class NetworkServiceFamily extends $Family
    with $FunctionalFamilyOverride<NetworkService<dynamic>, Dio?> {
  const NetworkServiceFamily._()
      : super(
          retry: null,
          name: r'networkServiceProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: false,
        );

  NetworkServiceProvider call([
    Dio? dio,
  ]) =>
      NetworkServiceProvider._(argument: dio, from: this);

  @override
  String toString() => r'networkServiceProvider';
}
