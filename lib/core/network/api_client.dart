import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'endpoints.dart';

/// HTTP client wrapper for API communication.
///
/// Configures Dio with base URL, headers, and interceptors.
class ApiClient {
  /// Creates a new [ApiClient] instance.
  ApiClient({
    Dio? dio,
    String? baseUrl,
    Future<Map<String, String>?> Function()? getSessionData,
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
      _AuthInterceptor(getSessionData: getSessionData),
      LogInterceptor(requestBody: true, responseBody: true, error: true),
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
      headers: {...?options?.headers, ...?headers},
    );
  }
}

/// Interceptor for adding authentication headers.
class _AuthInterceptor extends Interceptor {
  _AuthInterceptor({this.getSessionData});

  /// Function to get current session data.
  final Future<Map<String, String>?> Function()? getSessionData;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Get session data if available
    final sessionData = await getSessionData?.call();
    if (sessionData != null) {
      // Add session headers
      options.headers.addAll(sessionData);
    } else {
      // Fallback to development headers
      options.headers['dev'] = '18'; // Development user ID
    }

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Handle 401 errors - could trigger token refresh
    if (err.response?.statusCode == 401) {
      // Token refresh logic would go here
      // For now, just pass the error through
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

/// Provider for the API client.
final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient();
});
