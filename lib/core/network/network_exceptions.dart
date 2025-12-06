import 'dart:io';
import 'package:dio/dio.dart';
import '../error/failure.dart';

/// Utility class for handling network exceptions.
///
/// Converts various exceptions into appropriate [Failure] types.
class NetworkExceptions {
  NetworkExceptions._();

  /// Converts any exception to a [Failure].
  static Failure handleException(Object error) {
    if (error is DioException) {
      return getDioException(error);
    }

    if (error is SocketException) {
      return const Failure.network(message: 'No internet connection');
    }

    if (error is FormatException) {
      return const Failure.parsing(message: 'Invalid data format');
    }

    return Failure.generic(message: error.toString());
  }

  /// Converts a [DioException] to a [Failure].
  static Failure getDioException(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const Failure.network(message: 'Connection timeout');

      case DioExceptionType.badCertificate:
        return const Failure.network(message: 'Invalid certificate');

      case DioExceptionType.badResponse:
        return _handleBadResponse(error.response);

      case DioExceptionType.cancel:
        return const Failure.network(message: 'Request cancelled');

      case DioExceptionType.connectionError:
        return const Failure.network(message: 'No internet connection');

      case DioExceptionType.unknown:
        if (error.error is SocketException) {
          return const Failure.network(message: 'No internet connection');
        }
        return Failure.generic(message: error.message ?? 'Unknown error');
    }
  }

  /// Handles bad response from server.
  static Failure _handleBadResponse(Response<dynamic>? response) {
    if (response == null) {
      return const Failure.server(message: 'No response from server');
    }

    final statusCode = response.statusCode ?? 0;
    final data = response.data;

    String message = 'Server error';
    if (data is Map<String, dynamic>) {
      message =
          data['message'] as String? ??
          data['error'] as String? ??
          data['detail'] as String? ??
          'Server error';
    }

    switch (statusCode) {
      case 400:
        return Failure.validation(message: message);
      case 401:
        return Failure.unauthorized(message: message);
      case 403:
        return Failure.permission(message: message);
      case 404:
        return Failure.notFound(message: message);
      case 409:
        return Failure.server(message: message, statusCode: statusCode);
      case 422:
        return Failure.validation(message: message);
      case 500:
      case 502:
      case 503:
      case 504:
        return Failure.server(message: message, statusCode: statusCode);
      default:
        return Failure.server(message: message, statusCode: statusCode);
    }
  }
}
