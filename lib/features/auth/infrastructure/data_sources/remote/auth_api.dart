import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../../../core/network/api_client.dart';
import '../../../../../core/network/endpoints.dart';
import '../../models/auth_request_models.dart';
import '../../models/otp_state_model.dart';
import '../../models/session_model.dart';
import '../../models/user_model.dart';

/// Abstract class defining authentication API operations.
abstract class AuthApi {
  Future<OtpStateModel> requestOtp(OtpRequestDto dto);
  Future<SessionModel> verifyOtp(OtpVerifyDto dto);
  Future<SessionModel> register(RegisterRequestDto dto);
  Future<void> logout();
  Future<UserModel> getProfile();
}

/// Implementation of AuthApi using Dio client.
class AuthApiImpl implements AuthApi {
  AuthApiImpl({required this.apiClient});

  final ApiClient apiClient;

  @override
  Future<OtpStateModel> requestOtp(OtpRequestDto dto) async {
    // debugPrint('🚀 API: Making OTP request to ${Endpoints.sendOtp()}');
    // debugPrint('📦 API: Request data: ${dto.toJson()}');

    final response = await apiClient.post(
      Endpoints.sendOtp(),
      data: dto.toJson(),
    );

    // debugPrint('✅ API: OTP request response status: ${response.statusCode}');
    // debugPrint('📄 API: OTP request response data: ${response.data}');
    // debugPrint('🔧 API: OTP request response headers: ${response.headers}');

    final data = response.data as Map<String, dynamic>;

    // Handle the new API response format
    final otpState = OtpStateModel.fromJson(data);

    // debugPrint('📱 API: Created OTP state: ${otpState.toString()}');

    return otpState;
  }

  @override
  Future<SessionModel> verifyOtp(OtpVerifyDto dto) async {
    debugPrint(
      '🚀 API: Making OTP verification request to ${Endpoints.verifyOtp()}',
    );
    debugPrint('📦 API: Request data: ${dto.toJson()}');

    final Response response;
    try {
      response = await apiClient.post(
        Endpoints.verifyOtp(),
        data: dto.toJson(),
      );

      debugPrint(
        '✅ API: OTP verification response status: ${response.statusCode}',
      );
      debugPrint('📄 API: OTP verification response data: ${response.data}');
      debugPrint(
        '🔧 API: OTP verification response headers: ${response.headers}',
      );
    } catch (e) {
      debugPrint('❌ API: OTP verification request failed: $e');
      debugPrint('📍 API: Error type: ${e.runtimeType}');
      rethrow;
    }

    final data = response.data as Map<String, dynamic>;

    // Extract session info from response
    // The session might come from headers or body
    debugPrint('🔍 API: Extracting session data from OTP response...');
    final sessionId = _extractSessionId(response);
    final xcsrfToken = _extractXcsrfToken(response);
    final userId =
        data['user_id']?.toString() ??
        data['id']?.toString() ??
        data['user']?['id']?.toString() ??
        '';

    debugPrint('🔑 API: Extracted sessionId: "$sessionId"');
    debugPrint('🛡️ API: Extracted xcsrfToken: "$xcsrfToken"');
    debugPrint('👤 API: Extracted userId: "$userId"');

    // 🔴 CAPTURE SESSION DATA FOR HOMEPAGE MODULE
    // print('🔴 REAL SESSION DATA FOR HARDCODING (OTP VERIFY): {');
    // print('  "session_id": "$sessionId",');
    // print('  "xcsrf_token": "$xcsrfToken",');
    // print('  "user_id": "$userId",');
    // print('  "created_at": "${DateTime.now().toIso8601String()}",');
    // print(
    //   '  "expires_at": "${DateTime.now().add(const Duration(days: 1)).toIso8601String()}"',
    // );
    // print('}');
    // print('🔴 HEADERS: ${response.headers}');
    // print('🔴 RESPONSE DATA: ${response.data}');

    // For development: Allow OTP verification without session tokens
    if (userId.isEmpty) {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        type: DioExceptionType.badResponse,
        error: 'OTP verification failed - no user ID returned from server.',
      );
    }

    // COMMENTED OUT FOR DEV - Using hardcoded session in homepage module instead
    // If no session tokens, generate temporary ones for development
    // final finalSessionId = sessionId.isNotEmpty
    //     ? sessionId
    //     : 'temp_session_${userId}_${DateTime.now().millisecondsSinceEpoch}';
    // final finalXcsrfToken = xcsrfToken.isNotEmpty
    //     ? xcsrfToken
    //     : 'temp_csrf_${userId}_${DateTime.now().millisecondsSinceEpoch}';

    // For now, just use empty tokens since we're using hardcoded session in homepage
    final finalSessionId = sessionId;
    final finalXcsrfToken = xcsrfToken;

    debugPrint(
      '🔧 OTP: Using session tokens: sessionId=$finalSessionId, csrf=$finalXcsrfToken',
    );

    return SessionModel(
      sessionId: finalSessionId,
      xcsrfToken: finalXcsrfToken,
      userId: userId,
      createdAt: DateTime.now().toIso8601String(),
    );
  }

  @override
  Future<SessionModel> register(RegisterRequestDto dto) async {
    // debugPrint('🚀 API: Attempting registration with data: ${dto.toJson()}');
    // debugPrint('🌐 API: Registration endpoint: ${Endpoints.register()}');

    final Response response;
    try {
      response = await apiClient.post(Endpoints.register(), data: dto.toJson());

      debugPrint('✅ API: Registration response status: ${response.statusCode}');
      debugPrint('� API: Reggistration response data: ${response.data}');
      debugPrint('🔧 API: Registration response headers: ${response.headers}');
    } catch (e) {
      debugPrint('❌ API: Registration request failed: $e');
      debugPrint('📍 API: Error type: ${e.runtimeType}');
      rethrow;
    }

    final data = response.data as Map<String, dynamic>;

    // Extract session info from response
    debugPrint('🔍 API: Extracting session data from registration response...');
    final sessionId = _extractSessionId(response);
    final xcsrfToken = _extractXcsrfToken(response);
    final userId =
        data['user_id']?.toString() ??
        data['id']?.toString() ??
        data['user']?['id']?.toString() ??
        '';

    debugPrint('� API:r Extracted sessionId: "$sessionId"');
    debugPrint('�️E API: Extracted xcsrfToken: "$xcsrfToken"');
    debugPrint('👤 API: Extracted userId: "$userId"');

    // 🔴 CAPTURE SESSION DATA FOR HOMEPAGE MODULE
    // print('🔴 REAL SESSION DATA FOR HARDCODING: {');
    // print('  "session_id": "$sessionId",');
    // print('  "xcsrf_token": "$xcsrfToken",');
    // print('  "user_id": "$userId",');
    // print('  "created_at": "${DateTime.now().toIso8601String()}",');
    // print(
    //   '  "expires_at": "${DateTime.now().add(const Duration(days: 1)).toIso8601String()}"',
    // );
    // print('}');
    // print('🔴 HEADERS: ${response.headers}');
    // print('🔴 RESPONSE DATA: ${response.data}');

    // For development: Allow registration without session tokens
    // In production, you might want to require proper session management
    if (userId.isEmpty) {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        type: DioExceptionType.badResponse,
        error: 'Registration failed - no user ID returned from server.',
      );
    }

    // COMMENTED OUT FOR DEV - Using hardcoded session in homepage module instead
    // If no session tokens, generate temporary ones for development
    // final finalSessionId = sessionId.isNotEmpty
    //     ? sessionId
    //     : 'temp_session_${userId}_${DateTime.now().millisecondsSinceEpoch}';
    // final finalXcsrfToken = xcsrfToken.isNotEmpty
    //     ? xcsrfToken
    //     : 'temp_csrf_${userId}_${DateTime.now().millisecondsSinceEpoch}';

    // For now, just use empty tokens since we're using hardcoded session in homepage
    final finalSessionId = sessionId;
    final finalXcsrfToken = xcsrfToken;

    debugPrint(
      '🔧 Using session tokens: sessionId=$finalSessionId, csrf=$finalXcsrfToken',
    );

    return SessionModel(
      sessionId: finalSessionId,
      xcsrfToken: finalXcsrfToken,
      userId: userId,
      createdAt: DateTime.now().toIso8601String(),
    );
  }

  @override
  Future<void> logout() async {
    await apiClient.post(Endpoints.logout());
  }

  @override
  Future<UserModel> getProfile() async {
    final response = await apiClient.get(Endpoints.profile());
    final data = response.data as Map<String, dynamic>;
    return UserModel.fromJson(data);
  }

  /// Extracts session ID from response headers or body.
  String _extractSessionId(Response response) {
    debugPrint('🔍 Extracting session ID...');

    // Check headers
    final headerSessionId =
        response.headers.value('session-id') ??
        response.headers.value('x-session-id');
    if (headerSessionId != null) {
      debugPrint('✅ Found session ID in headers: $headerSessionId');
      return headerSessionId;
    }
    debugPrint('❌ No session ID found in headers');

    // Check cookies
    final cookies = response.headers['set-cookie'];
    debugPrint('🍪 Checking cookies: $cookies');
    if (cookies != null) {
      for (final cookie in cookies) {
        if (cookie.contains('sessionid=')) {
          final match = RegExp(r'sessionid=([^;]+)').firstMatch(cookie);
          if (match != null) {
            debugPrint('✅ Found session ID in cookies: ${match.group(1)}');
            return match.group(1)!;
          }
        }
      }
    }
    debugPrint('❌ No session ID found in cookies');

    // Check body
    final data = response.data;
    debugPrint('📄 Checking response body for session ID...');
    if (data is Map<String, dynamic>) {
      final sessionId =
          data['session_id']?.toString() ?? data['sessionId']?.toString() ?? '';
      debugPrint('📄 Session ID from body: "$sessionId"');
      return sessionId;
    }

    debugPrint('❌ No session ID found anywhere');
    return '';
  }

  /// Extracts XCSRF token from response headers or body.
  String _extractXcsrfToken(Response response) {
    debugPrint('🔍 Extracting CSRF token...');

    // Check headers
    final headerToken =
        response.headers.value('X-CSRFToken') ??
        response.headers.value('x-csrftoken') ??
        response.headers.value('csrftoken');
    if (headerToken != null) {
      debugPrint('✅ Found CSRF token in headers: $headerToken');
      return headerToken;
    }
    debugPrint('❌ No CSRF token found in headers');

    // Check cookies
    final cookies = response.headers['set-cookie'];
    debugPrint('🍪 Checking cookies for CSRF: $cookies');
    if (cookies != null) {
      for (final cookie in cookies) {
        if (cookie.contains('csrftoken=')) {
          final match = RegExp(r'csrftoken=([^;]+)').firstMatch(cookie);
          if (match != null) {
            debugPrint('✅ Found CSRF token in cookies: ${match.group(1)}');
            return match.group(1)!;
          }
        }
      }
    }
    debugPrint('❌ No CSRF token found in cookies');

    // Check body
    final data = response.data;
    debugPrint('📄 Checking response body for CSRF token...');
    if (data is Map<String, dynamic>) {
      final csrfToken =
          data['xcsrf_token']?.toString() ??
          data['csrfToken']?.toString() ??
          data['csrf_token']?.toString() ??
          '';
      debugPrint('📄 CSRF token from body: "$csrfToken"');
      return csrfToken;
    }

    debugPrint('❌ No CSRF token found anywhere');
    return '';
  }
}
