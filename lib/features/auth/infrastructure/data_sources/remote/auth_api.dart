import 'package:dio/dio.dart';

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
    final response = await apiClient.post(
      Endpoints.sendOtp(),
      data: dto.toJson(),
    );

    final data = response.data as Map<String, dynamic>;

    // The API might return different structures, handle accordingly
    return OtpStateModel(
      otpSentTo: dto.phone,
      message: data['detail'] as String? ?? data['message'] as String?,
      expiresAt: data['expires_at'] as String?,
      attemptsRemaining: data['attempts_remaining'] as int?,
    );
  }

  @override
  Future<SessionModel> verifyOtp(OtpVerifyDto dto) async {
    final response = await apiClient.post(
      Endpoints.verifyOtp(),
      data: dto.toJson(),
    );

    final data = response.data as Map<String, dynamic>;

    // Extract session info from response
    // The session might come from headers or body
    final sessionId = _extractSessionId(response);
    final xcsrfToken = _extractXcsrfToken(response);
    final userId = data['user_id']?.toString() ??
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
    final response = await apiClient.post(
      Endpoints.register(),
      data: dto.toJson(),
    );

    final data = response.data as Map<String, dynamic>;

    // Extract session info from response
    final sessionId = _extractSessionId(response);
    final xcsrfToken = _extractXcsrfToken(response);
    final userId = data['user_id']?.toString() ??
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
    final headerSessionId = response.headers.value('session-id') ??
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
    final headerToken = response.headers.value('X-CSRFToken') ??
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
