import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import 'injectable_container.config.dart';

final getIt = GetIt.instance;

@injectableInit
Future<void> configureDependencies() async {
  getIt.init();
}

@module
abstract class RegisterHttpClient {
  @lazySingleton
  http.Client get client => http.Client();
}

@module
abstract class RegisterInternetConnectionChecker {
  @lazySingleton
  InternetConnection get client => InternetConnection.createInstance();
}
