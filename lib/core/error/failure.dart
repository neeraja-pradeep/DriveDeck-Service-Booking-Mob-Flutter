import 'package:equatable/equatable.dart';

/// Base failure class for handling errors across the application.
abstract class Failure extends Equatable {
  final String message;
  final String? code;

  const Failure({
    required this.message,
    this.code,
  });

  @override
  List<Object?> get props => [message, code];

  /// Returns a user-friendly message for display in the UI.
  String toUserMessage() => message;
}

/// Network-related failures.
class NetworkFailure extends Failure {
  const NetworkFailure({
    super.message = 'No internet connection. Please check your network.',
    super.code,
  });
}

/// Server-related failures.
class ServerFailure extends Failure {
  final int? statusCode;

  const ServerFailure({
    required super.message,
    super.code,
    this.statusCode,
  });

  @override
  List<Object?> get props => [message, code, statusCode];
}

/// Cache-related failures.
class CacheFailure extends Failure {
  const CacheFailure({
    super.message = 'Failed to retrieve cached data.',
    super.code,
  });
}

/// Authentication failures.
class AuthFailure extends Failure {
  const AuthFailure({
    super.message = 'Authentication failed. Please login again.',
    super.code,
  });
}

/// Validation failures.
class ValidationFailure extends Failure {
  const ValidationFailure({
    required super.message,
    super.code,
  });
}

/// Shop-specific failures.
class ShopNotFoundFailure extends Failure {
  const ShopNotFoundFailure({
    super.message = 'Shop not found.',
    super.code,
  });
}

/// No available slots failure.
class NoSlotsAvailableFailure extends Failure {
  const NoSlotsAvailableFailure({
    super.message = 'No time slots available for the selected date.',
    super.code,
  });
}

/// Booking failure.
class BookingFailure extends Failure {
  const BookingFailure({
    required super.message,
    super.code,
  });
}

/// Slot no longer available failure.
class SlotNoLongerAvailableFailure extends Failure {
  const SlotNoLongerAvailableFailure({
    super.message = 'The selected time slot is no longer available.',
    super.code,
  });
}

/// Invalid promo code failure.
class InvalidPromoCodeFailure extends Failure {
  const InvalidPromoCodeFailure({
    super.message = 'Invalid or expired promo code.',
    super.code,
  });
}

/// Unknown failure.
class UnknownFailure extends Failure {
  const UnknownFailure({
    super.message = 'An unexpected error occurred. Please try again.',
    super.code,
  });
}
