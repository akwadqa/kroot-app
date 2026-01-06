part of 'bottm_navigation_bar_provider.dart';

@ProviderFor(BottomNavIndex)
const bottomNavIndexProvider = BottomNavIndexProvider._();

final class BottomNavIndexProvider
    extends $NotifierProvider<BottomNavIndex, int> {
  const BottomNavIndexProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bottomNavIndexProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bottomNavIndexHash();

  @$internal
  @override
  BottomNavIndex create() => BottomNavIndex();

  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$bottomNavIndexHash() => r'59407c849966979151fadc67336236fc7508297f';

abstract class _$BottomNavIndex extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
