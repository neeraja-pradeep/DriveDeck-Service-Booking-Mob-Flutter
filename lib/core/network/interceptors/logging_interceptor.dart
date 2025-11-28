import 'dart:developer' as developer;

import 'package:dio/dio.dart';

/// Interceptor for logging HTTP requests and responses.
/// Only logs in debug mode.
class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _log('┌─────────────────────────────────────────────────────────');
    _log('│ REQUEST: ${options.method} ${options.uri}');
    _log('│ Headers: ${options.headers}');
    if (options.data != null) {
      _log('│ Body: ${options.data}');
    }
    _log('└─────────────────────────────────────────────────────────');
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _log('┌─────────────────────────────────────────────────────────');
    _log('│ RESPONSE: ${response.statusCode} ${response.requestOptions.uri}');
    _log('│ Headers: ${response.headers.map}');
    _log('│ Body: ${response.data}');
    _log('└─────────────────────────────────────────────────────────');
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _log('┌─────────────────────────────────────────────────────────');
    _log('│ ERROR: ${err.type} ${err.requestOptions.uri}');
    _log('│ Message: ${err.message}');
    if (err.response != null) {
      _log('│ Status: ${err.response?.statusCode}');
      _log('│ Body: ${err.response?.data}');
    }
    _log('└─────────────────────────────────────────────────────────');
    handler.next(err);
  }

  void _log(String message) {
    // Uses dart:developer log which only works in debug mode
    developer.log(message, name: 'API');
  }
}
