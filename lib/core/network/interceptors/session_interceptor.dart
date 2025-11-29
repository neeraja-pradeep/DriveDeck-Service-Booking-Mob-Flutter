import 'package:dio/dio.dart';

import '../../storage/secure_store.dart';

/// Callback type for session expiry events.
typedef SessionExpiryCallback = void Function();

/// Interceptor that handles session-based authentication.
/// Adds session ID to requests and handles 401 responses.
class SessionInterceptor extends Interceptor {
  SessionInterceptor({
    required this.secureStore,
    this.onSessionExpired,
  });

  final SecureStore secureStore;
  final SessionExpiryCallback? onSessionExpired;

  static const String sessionIdHeaderKey = 'X-Session-ID';
  static const String devHeaderKey = 'dev';

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Add session ID to request headers
    final sessionId = await secureStore.getSessionId();
    if (sessionId != null && sessionId.isNotEmpty) {
      options.headers[sessionIdHeaderKey] = sessionId;
    }

    // Add user ID to dev header as required by API
    final userId = await secureStore.getUserId();
    if (userId != null && userId.isNotEmpty) {
      options.headers[devHeaderKey] = userId;
    }

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Extract session ID from response headers/cookies if present
    final sessionId = response.headers.value('session-id') ??
        response.headers.value('x-session-id');

    if (sessionId != null && sessionId.isNotEmpty) {
      secureStore.saveSessionId(sessionId);
    }

    // Also check for session in Set-Cookie header
    final cookies = response.headers['set-cookie'];
    if (cookies != null) {
      for (final cookie in cookies) {
        if (cookie.contains('sessionid=')) {
          final match = RegExp(r'sessionid=([^;]+)').firstMatch(cookie);
          if (match != null) {
            secureStore.saveSessionId(match.group(1)!);
          }
        }
      }
    }

    handler.next(response);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    // Handle 401 Unauthorized - session expired
    if (err.response?.statusCode == 401) {
      // Clear local session
      await secureStore.clearAuthData();

      // Trigger redirect to login
      onSessionExpired?.call();
    }

    handler.next(err);
  }
}
