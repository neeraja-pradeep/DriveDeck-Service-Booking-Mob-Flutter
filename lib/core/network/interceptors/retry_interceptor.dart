import 'dart:io';

import 'package:dio/dio.dart';

/// Retry interceptor for handling transient network failures.
/// Automatically retries requests for 5xx server errors and timeout errors.
class RetryInterceptor extends Interceptor {
  RetryInterceptor({
    this.maxRetries = 3,
    this.retryDelay = const Duration(seconds: 1),
  });

  final int maxRetries;
  final Duration retryDelay;

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final shouldRetry = _shouldRetry(err);
    final retryCount = err.requestOptions.extra['retry_count'] as int? ?? 0;

    if (shouldRetry && retryCount < maxRetries) {
      // debugPrint('🔄 Retry Interceptor: Retrying request (attempt ${retryCount + 1}/$maxRetries)');

      // Wait before retrying
      await Future.delayed(retryDelay * (retryCount + 1));

      // Update retry count
      err.requestOptions.extra['retry_count'] = retryCount + 1;

      try {
        // Retry the request
        final response = await Dio().fetch(err.requestOptions);
        handler.resolve(response);
      } catch (e) {
        // If retry fails, continue with the error chain
        if (e is DioException) {
          onError(e, handler);
        } else {
          handler.reject(err);
        }
      }
    } else {
      // Max retries reached or shouldn't retry
      handler.next(err);
    }
  }

  /// Determines if a request should be retried based on the error type.
  bool _shouldRetry(DioException err) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        // debugPrint('🔄 Retry Interceptor: Timeout error, will retry');
        return true;

      case DioExceptionType.connectionError:
        // Retry on connection errors (network issues)
        if (err.error is SocketException) {
          // debugPrint('🔄 Retry Interceptor: Socket error, will retry');
          return true;
        }
        return false;

      case DioExceptionType.badResponse:
        final statusCode = err.response?.statusCode;
        if (statusCode != null && statusCode >= 500) {
          // debugPrint('🔄 Retry Interceptor: Server error ($statusCode), will retry');
          return true;
        }
        return false;

      case DioExceptionType.cancel:
      case DioExceptionType.badCertificate:
      case DioExceptionType.unknown:
        return false;
    }
  }
}
