import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

/// Location permission status enum.
enum LocationPermissionStatus {
  granted,
  denied,
  deniedForever,
  serviceDisabled,
}

/// Base failure class using Freezed sealed class pattern.
/// All failure types are variants of this sealed class.
@freezed
sealed class Failure with _$Failure {
  /// Network-related failure (no internet, timeout, etc.)
  const factory Failure.network({
    @Default('Network error occurred') String message,
  }) = NetworkFailure;

  /// Server-side failure (API errors, server errors)
  const factory Failure.server({required String message, int? statusCode}) =
      ServerFailure;

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

  // Additional failure types

  /// Parsing failure when data parsing fails
  const factory Failure.parsing({
    @Default('Failed to parse data') String message,
  }) = _ParsingFailure;

  /// Unauthorized failure when user is not authenticated
  const factory Failure.unauthorized({
    @Default('Authentication required') String message,
    String? code,
  }) = _UnauthorizedFailure;

  /// Not found failure when resource doesn't exist
  const factory Failure.notFound({
    @Default('Resource not found') String message,
  }) = _NotFoundFailure;

  /// Permission failure when user lacks permission
  const factory Failure.permission({
    @Default('Permission denied') String message,
  }) = _PermissionFailure;

  /// Generic failure for other cases
  const factory Failure.generic({
    @Default('An unexpected error occurred') String message,
    String? code,
  }) = _GenericFailure;

  // Location-specific failures

  /// Location permission denied failure
  const factory Failure.locationPermissionDenied({
    required LocationPermissionStatus status,
    @Default('Location permission denied') String message,
    String? code,
  }) = _LocationPermissionDeniedFailure;

  /// Location service disabled failure
  const factory Failure.locationServiceDisabled({
    @Default('Location service disabled') String message,
    String? code,
  }) = _LocationServiceDisabledFailure;

  /// Location fetch failure
  const factory Failure.locationFetch({required String message, String? code}) =
      _LocationFetchFailure;

  // Booking-specific failures

  /// Booking not found failure
  const factory Failure.bookingNotFound({
    @Default('Booking not found') String message,
  }) = BookingNotFoundFailure;

  /// Booking already cancelled failure
  const factory Failure.bookingAlreadyCancelled({
    @Default('Booking is already cancelled') String message,
  }) = BookingAlreadyCancelledFailure;

  /// Cancellation not allowed failure
  const factory Failure.cancellationNotAllowed({
    @Default('This booking cannot be cancelled at this time') String message,
    String? reason,
  }) = CancellationNotAllowedFailure;

  /// Booking fetch failure
  const factory Failure.bookingFetch({
    @Default('Failed to fetch bookings') String message,
  }) = BookingFetchFailure;
}

/// Extension to get user-friendly messages from failures.
extension FailureMessage on Failure {
  /// Returns a user-friendly message for the failure.
  String get userMessage => when(
    network: (message) =>
        'Please check your internet connection and try again.',
    server: (message, statusCode) {
      if (statusCode == 500) {
        return 'Server is currently unavailable. Please try again later.';
      }
      if (statusCode == 404) {
        return 'The requested resource was not found.';
      }
      if (statusCode == 401) {
        return 'Your session has expired. Please login again.';
      }
      if (statusCode == 403) {
        return 'You do not have permission to perform this action.';
      }
      return 'Something went wrong. Please try again.';
    },
    cache: (message) => 'Unable to load cached data. Please refresh.',
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
    parsing: (message) => 'Unable to process data',
    unauthorized: (message, _) => message,
    notFound: (message) => 'The requested item was not found',
    permission: (message) =>
        'You do not have permission to perform this action',
    generic: (message, _) => message,
    locationPermissionDenied: (status, message, _) {
      switch (status) {
        case LocationPermissionStatus.denied:
          return 'Location permission is required to show nearby services.';
        case LocationPermissionStatus.deniedForever:
          return 'Location permission is permanently denied. Please enable it in settings.';
        case LocationPermissionStatus.serviceDisabled:
          return 'Location services are disabled. Please enable them in settings.';
        case LocationPermissionStatus.granted:
          return 'Location permission granted.';
      }
    },
    locationServiceDisabled: (message, _) =>
        'Location services are disabled. Please enable them to continue.',
    locationFetch: (message, _) =>
        'Unable to get your location. Please try again.',
    bookingNotFound: (message) => message,
    bookingAlreadyCancelled: (message) => message,
    cancellationNotAllowed: (message, reason) => reason ?? message,
    bookingFetch: (message) => message,
  );

  /// Returns the error code if available.
  String? get code => when(
    network: (_) => null,
    server: (_, statusCode) => statusCode?.toString(),
    cache: (_) => null,
    unknown: (_) => null,
    invalidOtp: (_, _) => null,
    otpExpired: (_) => null,
    phoneNumberAlreadyExists: (_) => null,
    invalidCredentials: (_) => null,
    sessionExpired: (_) => null,
    accountNotFound: (_) => null,
    validation: (_, _) => null,
    parsing: (_) => null,
    unauthorized: (_, code) => code,
    notFound: (_) => null,
    permission: (_) => null,
    generic: (_, code) => code,
    locationPermissionDenied: (_, _, code) => code,
    locationServiceDisabled: (_, code) => code,
    locationFetch: (_, code) => code,
    bookingNotFound: (_) => null,
    bookingAlreadyCancelled: (_) => null,
    cancellationNotAllowed: (_, _) => null,
    bookingFetch: (_) => null,
  );

  /// Legacy method for backward compatibility.
  /// Use [userMessage] getter instead.
  String toUserMessage() => userMessage;
}

// ============================================================================
// Bookings-specific Failures
// ============================================================================

/// Booking-specific failure extensions.
extension BookingFailureX on Failure {
  /// Create a booking not found failure.
  static Failure bookingNotFound([String? message]) =>
      Failure.bookingNotFound(message: message ?? 'Booking not found');

  /// Create a booking already cancelled failure.
  static Failure bookingAlreadyCancelled([String? message]) =>
      Failure.bookingAlreadyCancelled(
        message: message ?? 'Booking is already cancelled',
      );

  /// Create a cancellation not allowed failure.
  static Failure cancellationNotAllowed([String? reason]) =>
      Failure.cancellationNotAllowed(
        message: reason ?? 'This booking cannot be cancelled at this time',
        reason: reason,
      );

  /// Create a booking fetch failure.
  static Failure bookingFetch([String? message]) =>
      Failure.bookingFetch(message: message ?? 'Failed to fetch bookings');
}
