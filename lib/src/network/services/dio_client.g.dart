// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dio_client.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

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

String _$dioHash() => r'8ff24bd544ed027741e611e68c5ccbacaf207138';

/// NetworkService injection
@ProviderFor(networkService)
const networkServiceProvider = NetworkServiceFamily._();

/// NetworkService injection
final class NetworkServiceProvider
    extends $FunctionalProvider<NetworkService, NetworkService, NetworkService>
    with $Provider<NetworkService> {
  /// NetworkService injection
  const NetworkServiceProvider._({
    required NetworkServiceFamily super.from,
    required Dio? super.argument,
  }) : super(
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
  $ProviderElement<NetworkService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  NetworkService create(Ref ref) {
    final argument = this.argument as Dio?;
    return networkService(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NetworkService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NetworkService>(value),
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

/// NetworkService injection
final class NetworkServiceFamily extends $Family
    with $FunctionalFamilyOverride<NetworkService, Dio?> {
  const NetworkServiceFamily._()
    : super(
        retry: null,
        name: r'networkServiceProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  /// NetworkService injection
  NetworkServiceProvider call([Dio? dio]) =>
      NetworkServiceProvider._(argument: dio, from: this);

  @override
  String toString() => r'networkServiceProvider';
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
