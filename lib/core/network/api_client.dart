import 'package:dio/dio.dart';

import 'endpoints.dart';

/// HTTP client wrapper for API communication.
///
/// Configures Dio with base URL, headers, and interceptors.
class ApiClient {
  /// Creates a new [ApiClient] instance.
  ApiClient({
    Dio? dio,
    String? baseUrl,
  }) : _dio = dio ?? Dio() {
    _dio.options = BaseOptions(
      baseUrl: baseUrl ?? Endpoints.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
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

  final Dio _dio;

  /// The underlying Dio instance.
  Dio get dio => _dio;

  /// Performs a GET request.
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Options? options,
  }) {
    return _dio.get<T>(
      path,
      queryParameters: queryParameters,
      options: _mergeOptions(options, headers),
    );
  }

  /// Performs a POST request.
  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Options? options,
  }) {
    return _dio.post<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: _mergeOptions(options, headers),
    );
  }

  /// Performs a PUT request.
  Future<Response<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Options? options,
  }) {
    return _dio.put<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: _mergeOptions(options, headers),
    );
  }

  /// Performs a PATCH request.
  Future<Response<T>> patch<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Options? options,
  }) {
    return _dio.patch<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: _mergeOptions(options, headers),
    );
  }

  /// Performs a DELETE request.
  Future<Response<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    Options? options,
  }) {
    return _dio.delete<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: _mergeOptions(options, headers),
    );
  }

  Options? _mergeOptions(Options? options, Map<String, dynamic>? headers) {
    if (headers == null && options == null) return null;
    return (options ?? Options()).copyWith(
      headers: {
        ...?options?.headers,
        ...?headers,
      },
    );
  }
}

/// Interceptor for adding authentication headers.
class _AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Add dev header with user ID (for development)
    // In production, this would be replaced with proper authentication
    options.headers['dev'] = '2'; // Superadmin user ID

    // Add XCSRF token for non-GET requests
    if (options.method != 'GET') {
      // XCSRF token would be fetched from secure storage
      // options.headers['X-CSRFToken'] = xcsrfToken;
    }

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Handle 401 errors - could trigger token refresh
    if (err.response?.statusCode == 401) {
      // Token refresh logic would go here
    }
    handler.next(err);
  }
}

/// Wrapper for conditional response (304 Not Modified support).
class ConditionalResponse<T> {
  /// Creates a new [ConditionalResponse].
  const ConditionalResponse({
    required this.data,
    required this.isModified,
    this.lastModified,
  });

  /// The response data (null if 304).
  final T? data;

  /// True if data was modified (200), false if not (304).
  final bool isModified;

  /// The Last-Modified header value from response.
  final String? lastModified;
}
