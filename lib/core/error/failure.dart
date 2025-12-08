import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

/// Location permission status enum.
enum LocationPermissionStatus {
  granted,
  denied,
  deniedForever,
  serviceDisabled,
}

@freezed
sealed class Failure with _$Failure {
  // 1. ADD THIS PRIVATE CONSTRUCTOR
  // This is required by Freezed to allow custom methods/getters inside the class
  const Failure._();

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
  const factory Failure.invalidOtp({
    @Default('Invalid OTP code') String message,
    int? attemptsRemaining,
  }) = InvalidOtpFailure;

  const factory Failure.otpExpired({
    @Default('OTP has expired. Please request a new one.') String message,
  }) = OtpExpiredFailure;

  const factory Failure.phoneNumberAlreadyExists({
    @Default('This phone number is already registered') String message,
  }) = PhoneNumberAlreadyExistsFailure;

  const factory Failure.invalidCredentials({
    @Default('Invalid credentials') String message,
  }) = InvalidCredentialsFailure;

  const factory Failure.sessionExpired({
    @Default('Your session has expired. Please login again.') String message,
  }) = SessionExpiredFailure;

  const factory Failure.accountNotFound({
    @Default('Account not found') String message,
  }) = AccountNotFoundFailure;

  const factory Failure.validation({
    required String message,
    Map<String, String>? fieldErrors,
  }) = ValidationFailure;

  // Additional failure types
  const factory Failure.parsing({
    @Default('Failed to parse data') String message,
  }) = _ParsingFailure;

  const factory Failure.unauthorized({
    @Default('Authentication required') String message,
    String? code,
  }) = _UnauthorizedFailure;

  const factory Failure.notFound({
    @Default('Resource not found') String message,
  }) = _NotFoundFailure;

  const factory Failure.permission({
    @Default('Permission denied') String message,
  }) = _PermissionFailure;

  const factory Failure.generic({
    @Default('An unexpected error occurred') String message,
    String? code,
  }) = _GenericFailure;

  // Location-specific failures
  const factory Failure.locationPermissionDenied({
    required LocationPermissionStatus status,
    @Default('Location permission denied') String message,
    String? code,
  }) = _LocationPermissionDeniedFailure;

  const factory Failure.locationServiceDisabled({
    @Default('Location service disabled') String message,
    String? code,
  }) = _LocationServiceDisabledFailure;

  const factory Failure.locationFetch({required String message, String? code}) =
      _LocationFetchFailure;

  // Booking-specific failures
  const factory Failure.bookingNotFound({
    @Default('Booking not found') String message,
  }) = BookingNotFoundFailure;

  const factory Failure.bookingAlreadyCancelled({
    @Default('Booking is already cancelled') String message,
  }) = BookingAlreadyCancelledFailure;

  const factory Failure.cancellationNotAllowed({
    @Default('This booking cannot be cancelled at this time') String message,
    String? reason,
  }) = CancellationNotAllowedFailure;

  const factory Failure.bookingFetch({
    @Default('Failed to fetch bookings') String message,
  }) = BookingFetchFailure;

  // Shop-specific failures
  const factory Failure.shopNotFound({
    @Default('Shop not found') String message,
  }) = ShopNotFoundFailure;

  const factory Failure.noSlotsAvailable({
    @Default('No slots available for the selected date') String message,
  }) = NoSlotsAvailableFailure;

  const factory Failure.bookingCreationFailed({
    required String message,
  }) = BookingCreationFailure;

  const factory Failure.slotNoLongerAvailable({
    @Default('The selected time slot is no longer available') String message,
  }) = SlotNoLongerAvailableFailure;

  const factory Failure.invalidPromoCode({
    @Default('Invalid or expired promo code') String message,
  }) = InvalidPromoCodeFailure;

  const factory Failure.noConnection({
    @Default('No internet connection') String message,
  }) = NoConnectionFailure;

  // 2. MOVE THE GETTER LOGIC HERE (Inside the class body)

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
    shopNotFound: (message) => message,
    noSlotsAvailable: (message) => message,
    bookingCreationFailed: (message) => message,
    slotNoLongerAvailable: (message) => message,
    invalidPromoCode: (message) => message,
    noConnection: (message) => message,
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
    shopNotFound: (_) => null,
    noSlotsAvailable: (_) => null,
    bookingCreationFailed: (_) => null,
    slotNoLongerAvailable: (_) => null,
    invalidPromoCode: (_) => null,
    noConnection: (_) => null,
  );

  /// Legacy method support
  String toUserMessage() => userMessage;
}

// ============================================================================
// Bookings-specific Failures (Helpers can stay as extensions)
// ============================================================================

extension BookingFailureX on Failure {
  static Failure bookingNotFound([String? message]) =>
      Failure.bookingNotFound(message: message ?? 'Booking not found');

  static Failure bookingAlreadyCancelled([String? message]) =>
      Failure.bookingAlreadyCancelled(
        message: message ?? 'Booking is already cancelled',
      );

  static Failure cancellationNotAllowed([String? reason]) =>
      Failure.cancellationNotAllowed(
        message: reason ?? 'This booking cannot be cancelled at this time',
        reason: reason,
      );

  static Failure bookingFetch([String? message]) =>
      Failure.bookingFetch(message: message ?? 'Failed to fetch bookings');
}
