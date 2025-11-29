import 'dart:developer' as developer;

import 'package:dio/dio.dart';

import '../../../app/config/env.dart';

/// Interceptor for logging HTTP requests and responses.
/// Respects environment configuration for logging.
class LoggingInterceptor extends Interceptor {
  /// Whether logging is enabled based on environment configuration.
  bool get _isLoggingEnabled => Env.config['enableLogging'] as bool? ?? false;
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (_isLoggingEnabled) {
      _log('┌─────────────────────────────────────────────────────────');
      _log('│ REQUEST: ${options.method} ${options.uri}');
      _log('│ Headers: ${options.headers}');
      if (options.data != null) {
        _log('│ Body: ${options.data}');
      }
      _log('└─────────────────────────────────────────────────────────');
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (_isLoggingEnabled) {
      _log('┌─────────────────────────────────────────────────────────');
      _log('│ RESPONSE: ${response.statusCode} ${response.requestOptions.uri}');
      _log('│ Headers: ${response.headers.map}');
      _log('│ Body: ${response.data}');
      _log('└─────────────────────────────────────────────────────────');
    }
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (_isLoggingEnabled) {
      _log('┌─────────────────────────────────────────────────────────');
      _log('│ ERROR: ${err.type} ${err.requestOptions.uri}');
      _log('│ Message: ${err.message}');
      if (err.response != null) {
        _log('│ Status: ${err.response?.statusCode}');
        _log('│ Body: ${err.response?.data}');
      }
      _log('└─────────────────────────────────────────────────────────');
    }
    handler.next(err);
  }

  void _log(String message) {
    // Uses dart:developer log which only works in debug mode
    developer.log(message, name: 'API');
  }
}
