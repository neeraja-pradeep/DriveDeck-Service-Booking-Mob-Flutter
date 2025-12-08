import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/error/failure.dart';
import '../../infrastructure/data_sources/remote/auth_api.dart';
import '../states/auth_state.dart';
import 'auth_providers.dart';

/// Provider for auth API.
final authApiProvider = Provider<AuthApi>((ref) {
  final apiClient = ref.read(apiClientProvider);
  return AuthApiImpl(apiClient: apiClient);
});

/// Auth notifier for managing authentication state.
class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(const AuthInitial());

  /// Check authentication status on app start.
  Future<void> checkAuthStatus() async {
    // TODO: In production, this would check stored session and validate it
    state = const AuthUnauthenticated();
  }

  /// Verify OTP and authenticate user.
  Future<void> verifyOtp(String phoneNumber, String otpCode) async {
    state = const AuthLoading();

    try {
      // TODO: Implement OTP verification with actual API
      // final dto = OtpVerifyDto(phoneNumber: phoneNumber, otpCode: otpCode);
      // final sessionModel = await _authApi.verifyOtp(dto);
      state = const AuthUnauthenticated();
    } catch (e) {
      state = AuthError(failure: Failure.unknown(message: e.toString()));
    }
  }

  /// Logout user.
  Future<void> logout() async {
    // TODO: Clear stored session
    state = const AuthUnauthenticated();
  }
}

/// Provider for auth notifier.
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier();
});
