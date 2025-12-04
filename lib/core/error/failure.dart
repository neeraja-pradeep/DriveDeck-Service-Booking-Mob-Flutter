import 'package:equatable/equatable.dart';

/// Base class for all failures in the application.
///
/// Failures represent expected error cases that should be handled
/// by the application.
abstract class Failure extends Equatable {
  /// Creates a new [Failure] with an optional message.
  const Failure([this.message = 'An unexpected error occurred']);

  /// The error message describing what went wrong.
  final String message;

  /// Returns a user-friendly message for display.
  String get userMessage => message;

  @override
  List<Object?> get props => [message];
}

/// Failure when a network request fails.
class NetworkFailure extends Failure {
  /// Creates a new [NetworkFailure].
  const NetworkFailure([super.message = 'Network error occurred']);

  @override
  String get userMessage => 'Please check your internet connection';
}

/// Failure when the server returns an error.
class ServerFailure extends Failure {
  /// Creates a new [ServerFailure].
  const ServerFailure([
    super.message = 'Server error occurred',
    this.statusCode,
  ]);

  /// The HTTP status code if available.
  final int? statusCode;

  @override
  String get userMessage => 'Something went wrong. Please try again later';

  @override
  List<Object?> get props => [message, statusCode];
}

/// Failure when local cache operations fail.
class CacheFailure extends Failure {
  /// Creates a new [CacheFailure].
  const CacheFailure([super.message = 'Cache error occurred']);

  @override
  String get userMessage => 'Unable to load cached data';
}

/// Failure when data parsing fails.
class ParsingFailure extends Failure {
  /// Creates a new [ParsingFailure].
  const ParsingFailure([super.message = 'Failed to parse data']);

  @override
  String get userMessage => 'Unable to process data';
}

/// Failure when user is not authenticated.
class AuthenticationFailure extends Failure {
  /// Creates a new [AuthenticationFailure].
  const AuthenticationFailure([super.message = 'Authentication required']);

  @override
  String get userMessage => 'Please login to continue';
}

/// Failure when the requested resource is not found.
class NotFoundFailure extends Failure {
  /// Creates a new [NotFoundFailure].
  const NotFoundFailure([super.message = 'Resource not found']);

  @override
  String get userMessage => 'The requested item was not found';
}

/// Failure when the user doesn't have permission.
class PermissionFailure extends Failure {
  /// Creates a new [PermissionFailure].
  const PermissionFailure([super.message = 'Permission denied']);

  @override
  String get userMessage => 'You do not have permission to perform this action';
}

/// Failure when validation fails.
class ValidationFailure extends Failure {
  /// Creates a new [ValidationFailure].
  const ValidationFailure([super.message = 'Validation failed']);

  @override
  String get userMessage => message;
}

// ============================================================================
// Bookings-specific Failures
// ============================================================================

/// Failure when a booking is not found.
class BookingNotFoundFailure extends Failure {
  /// Creates a new [BookingNotFoundFailure].
  const BookingNotFoundFailure([super.message = 'Booking not found']);

  @override
  String get userMessage => 'The booking could not be found';
}

/// Failure when trying to cancel an already cancelled booking.
class BookingAlreadyCancelledFailure extends Failure {
  /// Creates a new [BookingAlreadyCancelledFailure].
  const BookingAlreadyCancelledFailure([
    super.message = 'Booking is already cancelled',
  ]);

  @override
  String get userMessage => 'This booking has already been cancelled';
}

/// Failure when cancellation is not allowed.
class CancellationNotAllowedFailure extends Failure {
  /// Creates a new [CancellationNotAllowedFailure].
  const CancellationNotAllowedFailure([
    super.message = 'Cancellation not allowed',
    this.reason,
  ]);

  /// The specific reason why cancellation is not allowed.
  final String? reason;

  @override
  String get userMessage =>
      reason ?? 'This booking cannot be cancelled at this time';

  @override
  List<Object?> get props => [message, reason];
}

/// Failure when fetching bookings fails.
class BookingFetchFailure extends Failure {
  /// Creates a new [BookingFetchFailure].
  const BookingFetchFailure([super.message = 'Failed to fetch bookings']);

  @override
  String get userMessage => 'Unable to load bookings. Please try again';
}
