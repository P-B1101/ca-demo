import 'package:http/http.dart';

typedef ConvertToModel<T> = T Function(
  dynamic body,
  Map<String, String> header,
);

typedef Request = Future<Response> Function();

typedef LoadOrFail<T> = Future<T> Function();
typedef AuthorizedLoadOrFail<T> = Future<T> Function(String token);
