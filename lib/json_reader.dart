import 'dart:convert';

import 'package:d_demo/core/utils/m_logger.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'core/error/exceptions.dart';

Future<http.Response> readApi<T>(
  String url, {
  String method = 'GET',
  Map<String, String>? header,
}) async {
  final uri = 'assets/api/$url.json';
  return rootBundle.loadStructuredData<http.Response>(
    uri,
    (response) async {
      try {
        final encodedData = const Utf8Codec().encode(response);
        final result = http.Response.bytes(
          encodedData,
          200,
          headers: header ?? {},
          request: http.Request(method, Uri.parse(uri)),
        );
        MLogger.log('response: ${result.body}');

        /// simulate api call
        await Future.delayed(const Duration(milliseconds: 500));
        return result;
      } catch (error) {
        throw ServerException(message: error.toString());
      }
    },
  );
}
