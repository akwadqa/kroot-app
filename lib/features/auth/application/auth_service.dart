import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../src/constants/keys.dart';

part 'auth_service.g.dart';

@Riverpod(keepAlive: true)
Future<SharedPreferences> sharedPreferences(Ref ref) async =>
    await SharedPreferences.getInstance();

@Riverpod(keepAlive: true)
class UserData extends _$UserData {
  @override
  UserSession? build() {
    final sharedPrefs = ref.watch(sharedPreferencesProvider).requireValue;

    final token = sharedPrefs.getString(Keys.token);
    final freeSubscribe = sharedPrefs.getInt(Keys.freeSubscribe);

    if (token != null && freeSubscribe != null) {
      return UserSession(
        token: token,
        freeSubscribe: freeSubscribe,
      );
    }

    return null;
  }



  Future<void> setData(
    String token,
    int isFreeSubscribe,
  ) async {
    final sharedPrefs = ref.read(sharedPreferencesProvider).requireValue;
    await sharedPrefs.setString(Keys.token, token);
    await sharedPrefs.setInt(Keys.freeSubscribe, isFreeSubscribe);
      state = UserSession(
      token: token,
      freeSubscribe: isFreeSubscribe,
    );
  }

  Future<void> removeData() async {
    final sharedPrefs = ref.read(sharedPreferencesProvider).requireValue;
    await sharedPrefs.remove(Keys.token);
        await sharedPrefs.remove(Keys.freeSubscribe);

    state = null;
  }
}

@riverpod
bool isAuthinticated(Ref ref) {
  return ref.watch(userDataProvider) != null;
}
class UserSession {
  final String token;
  final int freeSubscribe;

  const UserSession({
    required this.token,
    required this.freeSubscribe,
  });
}