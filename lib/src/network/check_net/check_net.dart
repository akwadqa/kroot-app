
import 'network_info.dart';

import 'package:internet_connection_checker/internet_connection_checker.dart';

class CheckNet<T> {
  NetworkInfo networkInformation = NetworkInfoImplemntes(
    InternetConnectionChecker.instance,
  );

  // Future<T> checkNetResponse({
  //   required Function() tryRight,
  //   Future<T> Function()? tryRightCach,
  // }) async {
  //   if (await networkInformation.isConnected) {
  //     try {
  //       return await tryRight();
  //     } on DioException { 
  //       rethrow;
  //     } catch (e) {
  //       rethrow;
  //     }
  //   } else {
  //     //   if (tryRightCach == null) {
  //     //     print('---------------------------------------------ofline!');
  //     //     throw Exception('You are offline');
  //     //   } else {
  //     //     try {
  //     //       return await tryRightCach();
  //     //     } catch (e) {
  //     throw Exception('You are offline');
  //     //     }
  //     //   }
  //   }
  // }
}
