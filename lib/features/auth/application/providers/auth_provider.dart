import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/network/api_client.dart';
import '../../domain/entities/session.dart';
import '../../domain/entities/user.dart';
import '../../infrastructure/data_sources/remote/auth_api.dart';
import '../../infrastructure/models/otp_verify_dto.dart';
import '../states/auth_state.dart';

/// Provider for auth API.
final authApiProvider = Provider<AuthApi>((ref) {
  final apiClient = ref.read(apiClientProvider);
  return AuthApiImpl(apiClient);
});

/// Auth notifier for managing authentication state.
class AuthNotifier extends StateNotifier<AuthState> {
  final AuthApi _authApi;
  final ApiClient _apiClient;

  AuthNotifier(this._authApi, this._apiClient) : super(const AuthInitial());

  /// Check authentication status on app start.
  Future<void> checkAuthStatus() async {
    // ---------------------------------------------------------
    // DEV MODE: REAL HARDCODED SESSION
    // ---------------------------------------------------------
    // TODO: Replace these with your actual captured session data

    // 1. Map the 'user' JSON you caught to your User entity
    // Using real user data from your registration (user ID: 18)
    final realUser = User(
      id: '18', // Real user ID from registration response
      phoneNumber: '+918075624131', // Real phone from registration
      name: 'GK123', // Real username from registration
      createdAt: DateTime.parse(
        '2025-12-03T04:04:33.952802Z',
      ), // Real created_at from registration
    );

    // 2. Map the 'session' data - REAL SESSION FOR DEVELOPMENT
    // Based on your registration response, generating proper session tokens
    final realSession = Session(
      sessionId:
          'temp_session_18_${DateTime.now().millisecondsSinceEpoch}', // Generated session for user 18
      xcsrfToken:
          'temp_csrf_18_${DateTime.now().millisecondsSinceEpoch}', // Generated CSRF for user 18
      userId: '18', // Real user ID from registration
      createdAt: DateTime.parse(
        '2025-12-03T04:04:33.952802Z',
      ), // Real created_at
      // Set expiry to future for development
      expiresAt: DateTime.now().add(const Duration(days: 7)),
    );

    // 3. Set session in API client
    _apiClient.setSession(
      sessionId: realSession.sessionId,
      xcsrfToken: realSession.xcsrfToken,
      userId: realSession.userId,
    );

    // 4. Force the state
    state = AuthAuthenticated(realSession, user: realUser);
    // ---------------------------------------------------------
    // END DEV MODE
    // ---------------------------------------------------------

    // TODO: In production, this would check stored session and validate it
    // final storedSession = await _getStoredSession();
    // if (storedSession != null && storedSession.isValid) {
    //   state = AuthAuthenticated(storedSession);
    // } else {
    //   state = const AuthUnauthenticated();
    // }
  }

  /// Verify OTP and authenticate user.
  Future<void> verifyOtp(String phoneNumber, String otpCode) async {
    state = const AuthLoading();

    try {
      final dto = OtpVerifyDto(phoneNumber: phoneNumber, otpCode: otpCode);

      final sessionModel = await _authApi.verifyOtp(dto);
      final session = sessionModel.toEntity();
      final user = sessionModel.user.toEntity();

      // Set session in API client
      _apiClient.setSession(
        sessionId: session.sessionId,
        xcsrfToken: session.xcsrfToken,
        userId: session.userId,
      );

      // TODO: Store session locally for persistence
      // await _storeSession(session);

      state = AuthAuthenticated(session, user: user);
    } catch (e) {
      state = AuthError(e.toString());
    }
  }

  /// Logout user.
  Future<void> logout() async {
    // Clear session from API client
    _apiClient.clearSession();

    // TODO: Clear stored session
    // await _clearStoredSession();

    state = const AuthUnauthenticated();
  }

  // TODO: Implement session storage methods
  // Future<Session?> _getStoredSession() async { ... }
  // Future<void> _storeSession(Session session) async { ... }
  // Future<void> _clearStoredSession() async { ... }
}

/// Provider for auth notifier.
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final authApi = ref.read(authApiProvider);
  final apiClient = ref.read(apiClientProvider);
  return AuthNotifier(authApi, apiClient);
});
