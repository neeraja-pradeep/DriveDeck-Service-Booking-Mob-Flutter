import 'package:freezed_annotation/freezed_annotation.dart';

part 'otp_state.freezed.dart';

/// Represents the state of an OTP that has been sent.
@freezed
class OtpState with _$OtpState {
  const OtpState._();

  const factory OtpState({
    required String otpSentTo,
    required DateTime expiresAt,
    int? attemptsRemaining,
    String? message,
    String? status,
  }) = _OtpState;

  /// Checks if the OTP has expired.
  bool get isExpired => DateTime.now().isAfter(expiresAt);

  /// Gets the remaining time until OTP expires.
  Duration get remainingTime {
    final remaining = expiresAt.difference(DateTime.now());
    return remaining.isNegative ? Duration.zero : remaining;
  }
}
