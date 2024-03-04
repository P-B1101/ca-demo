import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract class NetworkInfo {
  /// check internet connection using above addresses.
  ///
  /// https://icanhazip.com/
  /// https://jsonplaceholder.typicode.com/posts/1
  /// https://pokeapi.co/api/v2/pokemon?limit=1
  /// https://reqres.in/api/users/1
  /// 
  ///
  /// Can change address to check internal servers in Iran.
  Future<bool> get isConnected;
}

@LazySingleton(as: NetworkInfo)
class NetworkInfoImpl implements NetworkInfo {
  final InternetConnection checker;

  const NetworkInfoImpl({
    required this.checker,
  });

  @override
  Future<bool> get isConnected async => checker.hasInternetAccess;
}
