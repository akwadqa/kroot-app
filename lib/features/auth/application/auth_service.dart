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
  String? build() {
    final sharedPrefs = ref.watch(sharedPreferencesProvider).requireValue;
    final token = sharedPrefs.getString(Keys.token);
     if(token != null){
      return sharedPrefs.getString(Keys.token)!;
    }
    return null;
  }

  Future<void> setData(
    String token,
  ) async {
    final sharedPrefs = ref.read(sharedPreferencesProvider).requireValue;
    await sharedPrefs.setString(Keys.token, token);
    state = token
  
    ;
  }

  Future<void> removeData() async {
    final sharedPrefs = ref.read(sharedPreferencesProvider).requireValue;
    await sharedPrefs.remove(Keys.token);
    state = null;
  }
}

@riverpod
bool isAuthinticated(Ref ref) {
  return ref.watch(userDataProvider) != null;
}
