import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

/// Base failure class using Freezed sealed class pattern.
/// All failure types are variants of this sealed class.
@freezed
sealed class Failure with _$Failure {
  /// Network-related failure (no internet, timeout, etc.)
  const factory Failure.network({
    @Default('Network error occurred') String message,
  }) = NetworkFailure;

  /// Server-side failure (API errors, server errors)
  const factory Failure.server({
    required String message,
    int? statusCode,
  }) = ServerFailure;

  /// Cache/storage related failure
  const factory Failure.cache({
    @Default('Cache error occurred') String message,
  }) = CacheFailure;

  /// Unknown/unexpected failure
  const factory Failure.unknown({
    @Default('An unexpected error occurred') String message,
  }) = UnknownFailure;

  // Authentication-specific failures

  /// Invalid OTP failure
  const factory Failure.invalidOtp({
    @Default('Invalid OTP code') String message,
    int? attemptsRemaining,
  }) = InvalidOtpFailure;

  /// OTP expired failure
  const factory Failure.otpExpired({
    @Default('OTP has expired. Please request a new one.') String message,
  }) = OtpExpiredFailure;

  /// Phone number already exists failure
  const factory Failure.phoneNumberAlreadyExists({
    @Default('This phone number is already registered') String message,
  }) = PhoneNumberAlreadyExistsFailure;

  /// Invalid credentials failure
  const factory Failure.invalidCredentials({
    @Default('Invalid credentials') String message,
  }) = InvalidCredentialsFailure;

  /// Session expired failure
  const factory Failure.sessionExpired({
    @Default('Your session has expired. Please login again.') String message,
  }) = SessionExpiredFailure;

  /// Account not found failure
  const factory Failure.accountNotFound({
    @Default('Account not found') String message,
  }) = AccountNotFoundFailure;

  /// Validation failure
  const factory Failure.validation({
    required String message,
    Map<String, String>? fieldErrors,
  }) = ValidationFailure;
}

/// Extension to get user-friendly messages from failures.
extension FailureMessage on Failure {
  /// Returns a user-friendly message for the failure.
  String get userMessage => when(
        network: (message) => message,
        server: (message, _) => message,
        cache: (message) => message,
        unknown: (message) => message,
        invalidOtp: (message, attemptsRemaining) {
          if (attemptsRemaining != null) {
            return '$message. $attemptsRemaining attempts remaining.';
          }
          return message;
        },
        otpExpired: (message) => message,
        phoneNumberAlreadyExists: (message) => message,
        invalidCredentials: (message) => message,
        sessionExpired: (message) => message,
        accountNotFound: (message) => message,
        validation: (message, _) => message,
      );
}
