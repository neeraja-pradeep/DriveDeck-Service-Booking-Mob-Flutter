import 'package:dio/dio.dart';
import 'package:newapp/core/error/failure.dart';

/// Network exception wrapper.
class NetworkException implements Exception {
  const NetworkException({
    required this.message,
    this.statusCode,
  });

  factory NetworkException.fromDioException(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const NetworkException(message: 'Connection timeout');
      case DioExceptionType.connectionError:
        return const NetworkException(message: 'No internet connection');
      case DioExceptionType.badResponse:
        return NetworkException(
          message: _extractErrorMessage(exception.response),
          statusCode: exception.response?.statusCode,
        );
      case DioExceptionType.cancel:
        return const NetworkException(message: 'Request cancelled');
      default:
        return NetworkException(message: exception.message ?? 'Unknown error');
    }
  }

  final String message;
  final int? statusCode;

  static String _extractErrorMessage(Response<dynamic>? response) {
    if (response?.data is Map<String, dynamic>) {
      final data = response!.data as Map<String, dynamic>;
      if (data.containsKey('message')) {
        return data['message'] as String;
      }
      if (data.containsKey('detail')) {
        return data['detail'] as String;
      }
      if (data.containsKey('error')) {
        return data['error'] as String;
      }
    }
    return 'Server error: ${response?.statusCode}';
  }

  @override
  String toString() => 'NetworkException: $message (code: $statusCode)';

  /// Convert to Failure for domain layer.
  Failure toFailure() {
    if (statusCode == null) {
      return NetworkFailure(message: message);
    }
    return switch (statusCode) {
      401 => AuthFailure(message: message),
      403 => AuthFailure(message: message),
      404 => NotFoundFailure(message: message),
      _ => ServerFailure(message: message, statusCode: statusCode),
    };
  }
}
