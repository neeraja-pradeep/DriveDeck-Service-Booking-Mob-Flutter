import 'dart:io';

import 'package:dio/dio.dart';

/// Network exception types for error handling.
enum NetworkExceptionType {
  requestCancelled,
  unauthorizedRequest,
  badRequest,
  notFound,
  methodNotAllowed,
  requestTimeout,
  sendTimeout,
  receiveTimeout,
  conflict,
  internalServerError,
  notImplemented,
  serviceUnavailable,
  noInternetConnection,
  formatException,
  unableToProcess,
  defaultError,
  unexpectedError,
  notModified,
}

/// Network exception class for handling API errors.
class NetworkException implements Exception {
  final String message;
  final NetworkExceptionType type;
  final int? statusCode;

  const NetworkException({
    required this.message,
    required this.type,
    this.statusCode,
  });

  /// Creates a NetworkException from a DioException.
  factory NetworkException.fromDioException(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.cancel:
        return const NetworkException(
          message: 'Request was cancelled',
          type: NetworkExceptionType.requestCancelled,
        );

      case DioExceptionType.connectionTimeout:
        return const NetworkException(
          message: 'Connection timeout',
          type: NetworkExceptionType.requestTimeout,
        );

      case DioExceptionType.sendTimeout:
        return const NetworkException(
          message: 'Send timeout',
          type: NetworkExceptionType.sendTimeout,
        );

      case DioExceptionType.receiveTimeout:
        return const NetworkException(
          message: 'Receive timeout',
          type: NetworkExceptionType.receiveTimeout,
        );

      case DioExceptionType.badResponse:
        return _handleResponseError(exception.response);

      case DioExceptionType.badCertificate:
        return const NetworkException(
          message: 'Bad certificate',
          type: NetworkExceptionType.unexpectedError,
        );

      case DioExceptionType.connectionError:
        return const NetworkException(
          message: 'No internet connection',
          type: NetworkExceptionType.noInternetConnection,
        );

      case DioExceptionType.unknown:
        if (exception.error is SocketException) {
          return const NetworkException(
            message: 'No internet connection',
            type: NetworkExceptionType.noInternetConnection,
          );
        }
        return NetworkException(
          message: exception.message ?? 'Unexpected error occurred',
          type: NetworkExceptionType.unexpectedError,
        );
    }
  }

  /// Handles response errors based on status code.
  static NetworkException _handleResponseError(Response<dynamic>? response) {
    final statusCode = response?.statusCode;

    switch (statusCode) {
      case 304:
        return const NetworkException(
          message: 'Not modified',
          type: NetworkExceptionType.notModified,
          statusCode: 304,
        );
      case 400:
        return NetworkException(
          message: response?.data?['message']?.toString() ?? 'Bad request',
          type: NetworkExceptionType.badRequest,
          statusCode: 400,
        );
      case 401:
        return const NetworkException(
          message: 'Unauthorized',
          type: NetworkExceptionType.unauthorizedRequest,
          statusCode: 401,
        );
      case 403:
        return const NetworkException(
          message: 'Forbidden',
          type: NetworkExceptionType.unauthorizedRequest,
          statusCode: 403,
        );
      case 404:
        return const NetworkException(
          message: 'Not found',
          type: NetworkExceptionType.notFound,
          statusCode: 404,
        );
      case 405:
        return const NetworkException(
          message: 'Method not allowed',
          type: NetworkExceptionType.methodNotAllowed,
          statusCode: 405,
        );
      case 409:
        return const NetworkException(
          message: 'Conflict',
          type: NetworkExceptionType.conflict,
          statusCode: 409,
        );
      case 500:
        return const NetworkException(
          message: 'Internal server error',
          type: NetworkExceptionType.internalServerError,
          statusCode: 500,
        );
      case 501:
        return const NetworkException(
          message: 'Not implemented',
          type: NetworkExceptionType.notImplemented,
          statusCode: 501,
        );
      case 503:
        return const NetworkException(
          message: 'Service unavailable',
          type: NetworkExceptionType.serviceUnavailable,
          statusCode: 503,
        );
      default:
        return NetworkException(
          message: 'Received invalid status code: $statusCode',
          type: NetworkExceptionType.defaultError,
          statusCode: statusCode,
        );
    }
  }

  @override
  String toString() => 'NetworkException: $message (type: $type)';
}
