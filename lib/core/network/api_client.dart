import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:newapp/core/network/network_exceptions.dart';
import 'package:newapp/core/storage/secure_store.dart';

/// API client wrapper for Dio HTTP client with interceptors.
class ApiClient {
  ApiClient({
    required this.baseUrl,
    required this.secureStore,
    Dio? dio,
  }) : _dio = dio ?? Dio() {
    _dio.options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
    _setupInterceptors();
  }

  final String baseUrl;
  final SecureStore secureStore;
  final Dio _dio;

  Dio get dio => _dio;

  void _setupInterceptors() {
    _dio.interceptors.addAll([
      _AuthInterceptor(secureStore),
      if (kDebugMode) _LoggingInterceptor(),
    ]);
  }

  /// GET request with optional if-modified-since header.
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    String? ifModifiedSince,
    Options? options,
  }) async {
    try {
      final headers = <String, dynamic>{};
      if (ifModifiedSince != null) {
        headers['If-Modified-Since'] = ifModifiedSince;
      }
      return await _dio.get<T>(
        path,
        queryParameters: queryParameters,
        options: (options ?? Options()).copyWith(
          headers: {...options?.headers ?? {}, ...headers},
          validateStatus: (status) =>
              status != null && (status < 400 || status == 304),
        ),
      );
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  /// POST request.
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

  /// PATCH request.
  Future<Response<T>> patch<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.patch<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioException catch (e) {
      throw NetworkException.fromDioException(e);
    }
  }

  /// PUT request.
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

  /// DELETE request.
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
}

/// Interceptor for adding authentication headers.
class _AuthInterceptor extends Interceptor {
  _AuthInterceptor(this._secureStore);

  final SecureStore _secureStore;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final userId = await _secureStore.getUserId();
    if (userId != null) {
      options.headers['dev'] = userId;
    }

    final xcsrfToken = await _secureStore.getXcsrfToken();
    if (xcsrfToken != null && _isNonGetRequest(options.method)) {
      options.headers['X-CSRFToken'] = xcsrfToken;
    }

    handler.next(options);
  }

  bool _isNonGetRequest(String method) {
    return method.toUpperCase() != 'GET';
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final lastModified = response.headers.value('Last-Modified');
    if (lastModified != null) {
      response.extra['lastModified'] = lastModified;
    }
    handler.next(response);
  }
}

/// Logging interceptor for debug mode.
class _LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('┌──────────────────────────────────────────');
    debugPrint('│ ${options.method} ${options.uri}');
    debugPrint('│ Headers: ${options.headers}');
    if (options.data != null) {
      debugPrint('│ Data: ${options.data}');
    }
    debugPrint('└──────────────────────────────────────────');
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint('┌──────────────────────────────────────────');
    debugPrint('│ Response: ${response.statusCode}');
    debugPrint('│ Data: ${response.data}');
    debugPrint('└──────────────────────────────────────────');
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint('┌──────────────────────────────────────────');
    debugPrint('│ Error: ${err.message}');
    debugPrint('│ Response: ${err.response?.data}');
    debugPrint('└──────────────────────────────────────────');
    handler.next(err);
  }
}
