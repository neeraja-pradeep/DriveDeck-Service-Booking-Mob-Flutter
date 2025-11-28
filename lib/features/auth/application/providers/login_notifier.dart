import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/auth_credentials.dart';
import '../states/login_state.dart';
import '../usecases/request_otp_usecase.dart';
import '../usecases/verify_otp_usecase.dart';
import 'auth_notifier.dart';

/// Notifier for managing login flow state.
class LoginNotifier extends StateNotifier<LoginState> {
  LoginNotifier({
    required this.requestOtpUsecase,
    required this.verifyOtpUsecase,
    required this.authNotifier,
  }) : super(const LoginState.initial());

  final RequestOtpUsecase requestOtpUsecase;
  final VerifyOtpUsecase verifyOtpUsecase;
  final AuthNotifier authNotifier;

  String? _currentPhoneNumber;

  /// Requests an OTP for the given phone number.
  Future<void> requestOtp(String phoneNumber) async {
    state = const LoginState.requestingOtp();
    _currentPhoneNumber = phoneNumber;

    final credentials = OtpRequestCredentials(phoneNumber: phoneNumber);
    final result = await requestOtpUsecase(credentials);

    result.fold(
      (failure) {
        state = LoginState.error(failure: failure);
      },
      (otpState) {
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
        // Update main auth state
        authNotifier.setAuthenticated(session);
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
