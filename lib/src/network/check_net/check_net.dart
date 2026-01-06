import 'network_info.dart';

import 'package:internet_connection_checker/internet_connection_checker.dart';

class CheckNet<T> {
  NetworkInfo networkInformation = NetworkInfoImplemntes(
    InternetConnectionChecker.instance,
  );
}
