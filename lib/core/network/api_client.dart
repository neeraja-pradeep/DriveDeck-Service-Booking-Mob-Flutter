import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'endpoints.dart';
import 'network_exceptions.dart';

/// Provider for the API client.
final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient();
});

/// Conditional API response wrapper.
/// Used for if-modified-since header pattern.
class ConditionalApiResponse<T> {
  final bool isModified;
  final T? data;
  final DateTime? lastModified;

  const ConditionalApiResponse._({
    required this.isModified,
    this.data,
    this.lastModified,
  });

  /// Response was modified (200 OK).
  factory ConditionalApiResponse.modified({
    required T data,
    required DateTime lastModified,
  }) {
    return ConditionalApiResponse._(
      isModified: true,
      data: data,
      lastModified: lastModified,
    );
  }

  /// Response was not modified (304 Not Modified).
  factory ConditionalApiResponse.notModified() {
    return const ConditionalApiResponse._(
      isModified: false,
    );
  }
}

/// API client for making HTTP requests.
class ApiClient {
  late final Dio _dio;

  ApiClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: Endpoints.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );

    _dio.interceptors.addAll([
      _AuthInterceptor(),
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        error: true,
      ),
    ]);
  }

  /// Sets the user ID header for API requests.
  void setUserId(String userId) {
    _dio.options.headers['dev'] = userId;
  }

  /// Performs a GET request.
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.get<T>(
        path,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  /// Performs a conditional GET request with if-modified-since header.
  /// Returns ConditionalApiResponse indicating if data was modified.
  Future<ConditionalApiResponse<T>> getConditional<T>(
    String path, {
    DateTime? ifModifiedSince,
    Map<String, dynamic>? queryParameters,
    T Function(dynamic)? fromJson,
  }) async {
    try {
      final headers = <String, dynamic>{};
      if (ifModifiedSince != null) {
        headers['If-Modified-Since'] = _formatHttpDate(ifModifiedSince);
      }

      final response = await _dio.get<dynamic>(
        path,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
          validateStatus: (status) =>
              status != null && (status < 300 || status == 304),
        ),
      );

      if (response.statusCode == 304) {
        return ConditionalApiResponse.notModified();
      }

      final lastModifiedHeader = response.headers.value('Last-Modified') ??
          response.headers.value('last-modified');
      final lastModified = lastModifiedHeader != null
          ? _parseHttpDate(lastModifiedHeader)
          : DateTime.now();

      final data =
          fromJson != null ? fromJson(response.data) : response.data as T;

      return ConditionalApiResponse.modified(
        data: data,
        lastModified: lastModified,
      );
    } on DioException catch (e) {
      if (e.response?.statusCode == 304) {
        return ConditionalApiResponse.notModified();
      }
      throw NetworkException.fromDioException(e);
    }
  }

  /// Performs a POST request.
  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.post<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  /// Performs a PUT request.
  Future<Response<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.put<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  /// Performs a DELETE request.
  Future<Response<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.delete<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  /// Formats DateTime to HTTP date format (RFC 7231).
  String _formatHttpDate(DateTime dateTime) {
    final weekdays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    final months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];

    final utc = dateTime.toUtc();
    final weekday = weekdays[utc.weekday - 1];
    final day = utc.day.toString().padLeft(2, '0');
    final month = months[utc.month - 1];
    final year = utc.year;
    final hour = utc.hour.toString().padLeft(2, '0');
    final minute = utc.minute.toString().padLeft(2, '0');
    final second = utc.second.toString().padLeft(2, '0');

    return '$weekday, $day $month $year $hour:$minute:$second GMT';
  }

  /// Parses HTTP date format to DateTime.
  DateTime _parseHttpDate(String httpDate) {
    try {
      final months = {
        'Jan': 1,
        'Feb': 2,
        'Mar': 3,
        'Apr': 4,
        'May': 5,
        'Jun': 6,
        'Jul': 7,
        'Aug': 8,
        'Sep': 9,
        'Oct': 10,
        'Nov': 11,
        'Dec': 12,
      };

      final parts = httpDate.split(' ');
      final day = int.parse(parts[1]);
      final month = months[parts[2]] ?? 1;
      final year = int.parse(parts[3]);
      final timeParts = parts[4].split(':');
      final hour = int.parse(timeParts[0]);
      final minute = int.parse(timeParts[1]);
      final second = int.parse(timeParts[2]);

      return DateTime.utc(year, month, day, hour, minute, second);
    } catch (_) {
      return DateTime.now();
    }
  }
}

/// Auth interceptor for adding authentication headers.
class _AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Add default user ID header if not set
    options.headers['dev'] ??= '2'; // Default to superadmin
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Handle 401 errors - could trigger logout or token refresh
    if (err.response?.statusCode == 401) {
      // Token refresh logic would go here
    }
    handler.next(err);
  }
}
