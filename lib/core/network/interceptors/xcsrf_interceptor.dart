import 'package:dio/dio.dart';

import '../../storage/secure_store.dart';

/// Interceptor that adds XCSRF token to non-GET requests.
class XcsrfInterceptor extends Interceptor {
  XcsrfInterceptor({required this.secureStore});

  final SecureStore secureStore;

  static const String xcsrfHeaderKey = 'X-CSRFToken';

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Only add XCSRF token for non-GET requests
    if (options.method.toUpperCase() != 'GET') {
      final xcsrfToken = await secureStore.getXcsrfToken();
      if (xcsrfToken != null && xcsrfToken.isNotEmpty) {
        options.headers[xcsrfHeaderKey] = xcsrfToken;
      }
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Extract and save XCSRF token from response headers if present
    final xcsrfToken = response.headers.value(xcsrfHeaderKey) ??
        response.headers.value('x-csrftoken') ??
        response.headers.value('csrftoken');

    if (xcsrfToken != null && xcsrfToken.isNotEmpty) {
      secureStore.saveXcsrfToken(xcsrfToken);
    }

    handler.next(response);
  }
}
