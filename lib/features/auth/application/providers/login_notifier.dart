import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/auth_credentials.dart';
import '../../domain/entities/session.dart';
import '../states/login_state.dart';
import '../usecases/request_otp_usecase.dart';
import '../usecases/verify_otp_usecase.dart';

/// Notifier for managing login flow state.
class LoginNotifier extends StateNotifier<LoginState> {
  LoginNotifier({
    required this.requestOtpUsecase,
    required this.verifyOtpUsecase,
    required this.onAuthSuccess,
  }) : super(const LoginState.initial());

  final RequestOtpUsecase requestOtpUsecase;
  final VerifyOtpUsecase verifyOtpUsecase;
  final void Function(Session session) onAuthSuccess;

  String? _currentPhoneNumber;

  /// Requests an OTP for the given phone number.
  Future<void> requestOtp(String phoneNumber) async {
    // debugPrint('🎯 LoginNotifier: Starting OTP request for $phoneNumber');

    state = const LoginState.requestingOtp();
    _currentPhoneNumber = phoneNumber;

    final credentials = OtpRequestCredentials(phoneNumber: phoneNumber);
    // debugPrint('📋 LoginNotifier: Created credentials for OTP request');

    final result = await requestOtpUsecase(credentials);

    result.fold(
      (failure) {
        // debugPrint(
        //   '❌ LoginNotifier: OTP request failed with failure: ${failure.runtimeType}',
        // );
        // debugPrint('💬 LoginNotifier: Failure message: ${failure.userMessage}');
        state = LoginState.error(failure: failure);
      },
      (otpState) {
        // debugPrint('✅ LoginNotifier: OTP request successful');
        // debugPrint('📱 LoginNotifier: OTP sent to: ${otpState.otpSentTo}');
        // debugPrint('💬 LoginNotifier: OTP message: ${otpState.message}');
        state = LoginState.otpSent(otpState: otpState);
      },
    );
  }

  /// Verifies the OTP.
  Future<void> verifyOtp(String otp, {bool rememberMe = false}) async {
    if (_currentPhoneNumber == null) {
      return;
    }

    state = const LoginState.verifyingOtp();

    final credentials = OtpVerifyCredentials(
      phoneNumber: _currentPhoneNumber!,
      otp: otp,
      rememberMe: rememberMe,
    );
    final result = await verifyOtpUsecase(credentials);

    result.fold(
      (failure) {
        state = LoginState.error(failure: failure);
      },
      (session) {
        state = LoginState.success(session: session);
        // Update main auth state via callback
        onAuthSuccess(session);
      },
    );
  }

  /// Resets the login state.
  void resetState() {
    state = const LoginState.initial();
    _currentPhoneNumber = null;
  }

  /// Goes back to phone number entry.
  void goBackToPhoneEntry() {
    state = const LoginState.initial();
  }
}
