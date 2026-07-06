// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_language.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CurrentLanguage)
const currentLanguageProvider = CurrentLanguageProvider._();

final class CurrentLanguageProvider
    extends $NotifierProvider<CurrentLanguage, String> {
  const CurrentLanguageProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'currentLanguageProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$currentLanguageHash();

  @$internal
  @override
  CurrentLanguage create() => CurrentLanguage();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$currentLanguageHash() => r'652ad291328d9b9babd15d256302dbedb9a9989f';

abstract class _$CurrentLanguage extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<String, String>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<String, String>, String, Object?, Object?>;
    element.handleValue(ref, created);
  }
}
