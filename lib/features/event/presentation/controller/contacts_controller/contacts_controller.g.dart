// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contacts_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Device contacts, fetched once and cached for the app lifetime.

@ProviderFor(deviceContacts)
const deviceContactsProvider = DeviceContactsProvider._();

/// Device contacts, fetched once and cached for the app lifetime.

final class DeviceContactsProvider extends $FunctionalProvider<
        AsyncValue<List<Contact>>, List<Contact>, FutureOr<List<Contact>>>
    with $FutureModifier<List<Contact>>, $FutureProvider<List<Contact>> {
  /// Device contacts, fetched once and cached for the app lifetime.
  const DeviceContactsProvider._()
      : super(
          from: null,
          argument: null,
          retry: _noRetry,
          name: r'deviceContactsProvider',
          isAutoDispose: false,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$deviceContactsHash();

  @$internal
  @override
  $FutureProviderElement<List<Contact>> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<Contact>> create(Ref ref) {
    return deviceContacts(ref);
  }
}

String _$deviceContactsHash() => r'e70494a1f734ba6957babf5d71d79074d740494c';

/// Contacts & guests state for one event flow.
/// [eventId] == null -> create flow, otherwise -> update flow of that event.

@ProviderFor(ContactsController)
const contactsControllerProvider = ContactsControllerFamily._();

/// Contacts & guests state for one event flow.
/// [eventId] == null -> create flow, otherwise -> update flow of that event.
final class ContactsControllerProvider
    extends $AsyncNotifierProvider<ContactsController, ContactsState> {
  /// Contacts & guests state for one event flow.
  /// [eventId] == null -> create flow, otherwise -> update flow of that event.
  const ContactsControllerProvider._(
      {required ContactsControllerFamily super.from,
      required String? super.argument})
      : super(
          retry: null,
          name: r'contactsControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$contactsControllerHash();

  @override
  String toString() {
    return r'contactsControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ContactsController create() => ContactsController();

  @override
  bool operator ==(Object other) {
    return other is ContactsControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$contactsControllerHash() =>
    r'2ccf577a09a75332078e83f7b5dfbc11906df86f';

/// Contacts & guests state for one event flow.
/// [eventId] == null -> create flow, otherwise -> update flow of that event.

final class ContactsControllerFamily extends $Family
    with
        $ClassFamilyOverride<ContactsController, AsyncValue<ContactsState>,
            ContactsState, FutureOr<ContactsState>, String?> {
  const ContactsControllerFamily._()
      : super(
          retry: null,
          name: r'contactsControllerProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  /// Contacts & guests state for one event flow.
  /// [eventId] == null -> create flow, otherwise -> update flow of that event.

  ContactsControllerProvider call(
    String? eventId,
  ) =>
      ContactsControllerProvider._(argument: eventId, from: this);

  @override
  String toString() => r'contactsControllerProvider';
}

/// Contacts & guests state for one event flow.
/// [eventId] == null -> create flow, otherwise -> update flow of that event.

abstract class _$ContactsController extends $AsyncNotifier<ContactsState> {
  late final _$args = ref.$arg as String?;
  String? get eventId => _$args;

  FutureOr<ContactsState> build(
    String? eventId,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      _$args,
    );
    final ref = this.ref as $Ref<AsyncValue<ContactsState>, ContactsState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<ContactsState>, ContactsState>,
        AsyncValue<ContactsState>,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
