import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// API Client wrapper around Dio for handling HTTP requests.
class ApiClient {
  late final Dio _dio;
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  static const String baseUrl = 'http://156.67.104.149:8110';
  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);

  // Storage keys
  static const String _xcsrfTokenKey = 'xcsrf_token';

  ApiClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: connectTimeout,
        receiveTimeout: receiveTimeout,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    _setupInterceptors();
  }

  void _setupInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // Add dev header for authentication
          options.headers['dev'] = '2'; // Superadmin user ID

          // Add XCSRF token for non-GET requests
          if (options.method != 'GET') {
            final xcsrfToken = await _getXcsrfToken();
            if (xcsrfToken != null && xcsrfToken.isNotEmpty) {
              options.headers['X-CSRFToken'] = xcsrfToken;
            }
          }

          if (kDebugMode) {
            print('REQUEST[${options.method}] => PATH: ${options.path}');
            print('Headers: ${options.headers}');
            if (options.data != null) {
              print('Body: ${options.data}');
            }
          }

          return handler.next(options);
        },
        onResponse: (response, handler) {
          // Extract and store XCSRF token from response if present
          _extractAndStoreXcsrfToken(response);

          if (kDebugMode) {
            print('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
          }
          return handler.next(response);
        },
        onError: (error, handler) {
          if (kDebugMode) {
            print('ERROR[${error.response?.statusCode}] => PATH: ${error.requestOptions.path}');
            print('Error Message: ${error.message}');
          }
          return handler.next(error);
        },
      ),
    );
  }

  /// Gets the stored XCSRF token.
  Future<String?> _getXcsrfToken() async {
    try {
      return await _secureStorage.read(key: _xcsrfTokenKey);
    } catch (e) {
      if (kDebugMode) {
        print('Error reading XCSRF token: $e');
      }
      return null;
    }
  }

  /// Extracts and stores XCSRF token from response.
  void _extractAndStoreXcsrfToken(Response response) {
    // Check for XCSRF token in response headers
    final cookies = response.headers['set-cookie'];
    if (cookies != null) {
      for (final cookie in cookies) {
        if (cookie.contains('csrftoken=')) {
          final token = _extractCsrfFromCookie(cookie);
          if (token != null) {
            _secureStorage.write(key: _xcsrfTokenKey, value: token);
          }
        }
      }
    }

    // Also check for X-CSRFToken in response headers
    final xcsrfHeader = response.headers.value('X-CSRFToken');
    if (xcsrfHeader != null && xcsrfHeader.isNotEmpty) {
      _secureStorage.write(key: _xcsrfTokenKey, value: xcsrfHeader);
    }
  }

  /// Extracts CSRF token from cookie string.
  String? _extractCsrfFromCookie(String cookie) {
    final match = RegExp(r'csrftoken=([^;]+)').firstMatch(cookie);
    return match?.group(1);
  }

  /// Sets the XCSRF token manually (useful after login).
  Future<void> setXcsrfToken(String token) async {
    await _secureStorage.write(key: _xcsrfTokenKey, value: token);
  }

  /// Clears the stored XCSRF token.
  Future<void> clearXcsrfToken() async {
    await _secureStorage.delete(key: _xcsrfTokenKey);
  }

  /// GET request.
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return _dio.get<T>(
      path,
      queryParameters: queryParameters,
      options: options,
    );
  }

  /// POST request.
  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return _dio.post<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  /// PUT request.
  Future<Response<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return _dio.put<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  /// DELETE request.
  Future<Response<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return _dio.delete<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  /// PATCH request.
  Future<Response<T>> patch<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return _dio.patch<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }

  /// Set custom header.
  void setHeader(String key, String value) {
    _dio.options.headers[key] = value;
  }

  /// Remove header.
  void removeHeader(String key) {
    _dio.options.headers.remove(key);
  }

  /// Get the underlying Dio instance.
  Dio get dio => _dio;
}
