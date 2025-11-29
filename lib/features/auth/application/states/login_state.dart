import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/otp_state.dart';
import '../../domain/entities/session.dart';

part 'login_state.freezed.dart';

/// State for the login flow.
@freezed
sealed class LoginState with _$LoginState {
  const LoginState._();

  /// Initial state.
  const factory LoginState.initial() = LoginInitial;

  /// Requesting OTP.
  const factory LoginState.requestingOtp() = LoginRequestingOtp;

  /// OTP has been sent.
  const factory LoginState.otpSent({
    required OtpState otpState,
  }) = LoginOtpSent;

  /// Verifying OTP.
  const factory LoginState.verifyingOtp() = LoginVerifyingOtp;

  /// Login successful.
  const factory LoginState.success({
    required Session session,
  }) = LoginSuccess;

  /// Login error.
  const factory LoginState.error({
    required Failure failure,
  }) = LoginError;

  /// Check if loading.
  bool get isLoading =>
      this is LoginRequestingOtp || this is LoginVerifyingOtp;

  /// Check if OTP was sent.
  bool get isOtpSent => this is LoginOtpSent;

  /// Get OTP state if available.
  OtpState? get otpState => maybeWhen(
        otpSent: (state) => state,
        orElse: () => null,
      );
}
