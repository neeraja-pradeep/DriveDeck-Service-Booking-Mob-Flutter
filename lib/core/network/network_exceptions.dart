import 'dart:io';

import 'package:dio/dio.dart';

import '../error/failure.dart';

/// Utility class to map network exceptions to Failure types.
class NetworkExceptions {
  NetworkExceptions._();

  /// Maps a DioException to a Failure.
  static Failure mapDioException(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const Failure.network(
          message: 'Connection timed out. Please try again.',
        );

      case DioExceptionType.connectionError:
        return const Failure.network(
          message: 'No internet connection. Please check your network.',
        );

      case DioExceptionType.badResponse:
        return _handleResponseError(exception.response);

      case DioExceptionType.cancel:
        return const Failure.network(message: 'Request was cancelled');

      case DioExceptionType.badCertificate:
        return const Failure.network(message: 'Security certificate error');

      case DioExceptionType.unknown:
        if (exception.error is SocketException) {
          return const Failure.network(
            message: 'No internet connection. Please check your network.',
          );
        }
        return Failure.unknown(
          message: exception.message ?? 'An unexpected error occurred',
        );
    }
  }

  /// Handles HTTP response errors.
  static Failure _handleResponseError(Response? response) {
    if (response == null) {
      return const Failure.unknown(message: 'No response from server');
    }

    final statusCode = response.statusCode ?? 0;
    final data = response.data;

    // Try to extract error message from response
    String message = 'An error occurred';
    if (data is Map<String, dynamic>) {
      message = data['detail'] as String? ??
          data['message'] as String? ??
          data['error'] as String? ??
          message;
    }

    switch (statusCode) {
      case 400:
        // Check for specific auth errors
        if (message.toLowerCase().contains('otp')) {
          if (message.toLowerCase().contains('expired')) {
            return Failure.otpExpired(message: message);
          }
          return Failure.invalidOtp(message: message);
        }
        if (message.toLowerCase().contains('already') &&
            message.toLowerCase().contains('registered')) {
          return Failure.phoneNumberAlreadyExists(message: message);
        }
        return Failure.validation(message: message);

      case 401:
        if (message.toLowerCase().contains('session') ||
            message.toLowerCase().contains('expired')) {
          return Failure.sessionExpired(message: message);
        }
        return Failure.invalidCredentials(message: message);

      case 403:
        return Failure.server(
          message: 'Access denied',
          statusCode: statusCode,
        );

      case 404:
        if (message.toLowerCase().contains('account') ||
            message.toLowerCase().contains('user')) {
          return Failure.accountNotFound(message: message);
        }
        return Failure.server(
          message: 'Resource not found',
          statusCode: statusCode,
        );

      case 422:
        return Failure.validation(message: message);

      case 500:
      case 502:
      case 503:
        return Failure.server(
          message: 'Server error. Please try again later.',
          statusCode: statusCode,
        );

      default:
        return Failure.server(message: message, statusCode: statusCode);
    }
  }

  /// Maps a generic exception to a Failure.
  static Failure mapException(dynamic exception) {
    if (exception is DioException) {
      return mapDioException(exception);
    }
    if (exception is SocketException) {
      return const Failure.network(
        message: 'No internet connection. Please check your network.',
      );
    }
    if (exception is FormatException) {
      return const Failure.unknown(message: 'Invalid data format received');
    }
    return Failure.unknown(
      message: exception.toString(),
    );
  }
}
