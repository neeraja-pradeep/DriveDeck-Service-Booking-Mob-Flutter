import 'dart:io';

import 'package:dio/dio.dart';

import '../error/failure.dart';

/// Utility class for handling network exceptions.
///
/// Converts various exceptions into appropriate [Failure] types.
class NetworkExceptions {
  NetworkExceptions._();

  /// Converts a [DioException] to a [Failure].
  static Failure getDioException(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const NetworkFailure('Connection timeout');

      case DioExceptionType.badCertificate:
        return const NetworkFailure('Invalid certificate');

      case DioExceptionType.badResponse:
        return _handleBadResponse(error.response);

      case DioExceptionType.cancel:
        return const NetworkFailure('Request cancelled');

      case DioExceptionType.connectionError:
        return const NetworkFailure('No internet connection');

      case DioExceptionType.unknown:
        if (error.error is SocketException) {
          return const NetworkFailure('No internet connection');
        }
        return NetworkFailure(error.message ?? 'Unknown error');
    }
  }

  /// Handles bad response from server.
  static Failure _handleBadResponse(Response<dynamic>? response) {
    if (response == null) {
      return const ServerFailure('No response from server');
    }

    final statusCode = response.statusCode ?? 0;
    final data = response.data;

    String message = 'Server error';
    if (data is Map<String, dynamic>) {
      message = data['message'] as String? ??
          data['error'] as String? ??
          data['detail'] as String? ??
          'Server error';
    }

    switch (statusCode) {
      case 400:
        return ValidationFailure(message);
      case 401:
        return AuthenticationFailure(message);
      case 403:
        return PermissionFailure(message);
      case 404:
        return NotFoundFailure(message);
      case 409:
        return ServerFailure(message, statusCode);
      case 422:
        return ValidationFailure(message);
      case 500:
      case 502:
      case 503:
      case 504:
        return ServerFailure(message, statusCode);
      default:
        return ServerFailure(message, statusCode);
    }
  }

  /// Converts a generic exception to a [Failure].
  static Failure getException(Object error) {
    if (error is DioException) {
      return getDioException(error);
    }
    if (error is SocketException) {
      return const NetworkFailure('No internet connection');
    }
    if (error is FormatException) {
      return const ParsingFailure('Invalid data format');
    }
    return ServerFailure(error.toString());
  }
}
