import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';

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
    // debugPrint(
    //   '🚀 API: Making OTP verification request to ${Endpoints.verifyOtp()}',
    // );
    // debugPrint('📦 API: Request data: ${dto.toJson()}');

    final response = await apiClient.post(
      Endpoints.verifyOtp(),
      data: dto.toJson(),
    );

    // debugPrint(
    //   '✅ API: OTP verification response status: ${response.statusCode}',
    // );
    // debugPrint('📄 API: OTP verification response data: ${response.data}');
    // debugPrint(
    //   '🔧 API: OTP verification response headers: ${response.headers}',
    // );

    final data = response.data as Map<String, dynamic>;

    // Extract session info from response
    // The session might come from headers or body
    final sessionId = _extractSessionId(response);
    final xcsrfToken = _extractXcsrfToken(response);
    final userId =
        data['user_id']?.toString() ??
        data['id']?.toString() ??
        data['user']?['id']?.toString() ??
        '';

    return SessionModel(
      sessionId: sessionId,
      xcsrfToken: xcsrfToken,
      userId: userId,
      createdAt: DateTime.now().toIso8601String(),
    );
  }

  @override
  Future<SessionModel> register(RegisterRequestDto dto) async {
    // debugPrint('🚀 Attempting registration with data: ${dto.toJson()}');

    final response = await apiClient.post(
      Endpoints.register(),
      data: dto.toJson(),
    );

    // debugPrint('✅ Registration response status: ${response.statusCode}');
    // debugPrint('📄 Registration response data: ${response.data}');
    // debugPrint('🔧 Registration response headers: ${response.headers}');

    final data = response.data as Map<String, dynamic>;

    // Extract session info from response
    final sessionId = _extractSessionId(response);
    final xcsrfToken = _extractXcsrfToken(response);
    final userId =
        data['user_id']?.toString() ??
        data['id']?.toString() ??
        data['user']?['id']?.toString() ??
        '';

    // debugPrint('🔑 Extracted sessionId: $sessionId');
    // debugPrint('🛡️ Extracted xcsrfToken: $xcsrfToken');
    // debugPrint('👤 Extracted userId: $userId');

    // If no session tokens are returned, create a temporary session
    // This might indicate that the API requires a separate login after registration
    final finalSessionId = sessionId.isNotEmpty
        ? sessionId
        : 'temp_${DateTime.now().millisecondsSinceEpoch}';
    final finalXcsrfToken = xcsrfToken.isNotEmpty
        ? xcsrfToken
        : 'temp_csrf_${DateTime.now().millisecondsSinceEpoch}';

    // if (sessionId.isEmpty || xcsrfToken.isEmpty) {
    //   debugPrint(
    //     '⚠️ Warning: No session tokens returned from registration API',
    //   );
    //   debugPrint(
    //     '💡 This might require a separate login step after registration',
    //   );
    // }

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
    // Check headers
    final headerSessionId =
        response.headers.value('session-id') ??
        response.headers.value('x-session-id');
    if (headerSessionId != null) return headerSessionId;

    // Check cookies
    final cookies = response.headers['set-cookie'];
    if (cookies != null) {
      for (final cookie in cookies) {
        if (cookie.contains('sessionid=')) {
          final match = RegExp(r'sessionid=([^;]+)').firstMatch(cookie);
          if (match != null) return match.group(1)!;
        }
      }
    }

    // Check body
    final data = response.data;
    if (data is Map<String, dynamic>) {
      return data['session_id']?.toString() ??
          data['sessionId']?.toString() ??
          '';
    }

    return '';
  }

  /// Extracts XCSRF token from response headers or body.
  String _extractXcsrfToken(Response response) {
    // Check headers
    final headerToken =
        response.headers.value('X-CSRFToken') ??
        response.headers.value('x-csrftoken') ??
        response.headers.value('csrftoken');
    if (headerToken != null) return headerToken;

    // Check cookies
    final cookies = response.headers['set-cookie'];
    if (cookies != null) {
      for (final cookie in cookies) {
        if (cookie.contains('csrftoken=')) {
          final match = RegExp(r'csrftoken=([^;]+)').firstMatch(cookie);
          if (match != null) return match.group(1)!;
        }
      }
    }

    // Check body
    final data = response.data;
    if (data is Map<String, dynamic>) {
      return data['xcsrf_token']?.toString() ??
          data['csrfToken']?.toString() ??
          data['csrf_token']?.toString() ??
          '';
    }

    return '';
  }
}
