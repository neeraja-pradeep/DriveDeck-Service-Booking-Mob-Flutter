import 'package:dio/dio.dart';

import '../storage/secure_store.dart';
import 'endpoints.dart';
import 'interceptors/logging_interceptor.dart';
import 'interceptors/session_interceptor.dart';
import 'interceptors/xcsrf_interceptor.dart';

/// Callback type for session expiry events.
typedef SessionExpiryCallback = void Function();

/// API client wrapper around Dio with interceptors.
class ApiClient {
  ApiClient({
    required SecureStore secureStore,
    SessionExpiryCallback? onSessionExpired,
  })  : _secureStore = secureStore,
        _onSessionExpired = onSessionExpired {
    _dio = Dio(_baseOptions);
    _setupInterceptors();
  }

  final SecureStore _secureStore;
  final SessionExpiryCallback? _onSessionExpired;
  late final Dio _dio;

  static final BaseOptions _baseOptions = BaseOptions(
    baseUrl: Endpoints.baseUrl,
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
    sendTimeout: const Duration(seconds: 30),
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    },
  );

  void _setupInterceptors() {
    // Order: Logging -> Session -> XCSRF -> Error
    _dio.interceptors.addAll([
      LoggingInterceptor(),
      SessionInterceptor(
        secureStore: _secureStore,
        onSessionExpired: _onSessionExpired,
      ),
      XcsrfInterceptor(secureStore: _secureStore),
    ]);
  }

  /// Exposes the Dio instance for direct access if needed.
  Dio get dio => _dio;

  /// Performs a GET request.
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) {
    return _dio.get<T>(
      path,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
  }

  /// Performs a POST request.
  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) {
    return _dio.post<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
  }

  /// Performs a PUT request.
  Future<Response<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) {
    return _dio.put<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
  }

  /// Performs a PATCH request.
  Future<Response<T>> patch<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) {
    return _dio.patch<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
  }

  /// Performs a DELETE request.
  Future<Response<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) {
    return _dio.delete<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
  }
}
