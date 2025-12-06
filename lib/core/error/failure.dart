import 'package:equatable/equatable.dart';

/// Base failure class for domain-level error handling.
abstract class Failure extends Equatable {
  const Failure({this.message = 'An unexpected error occurred'});

  final String message;

  @override
  List<Object?> get props => [message];
}

/// Network-related failures.
class NetworkFailure extends Failure {
  const NetworkFailure({super.message = 'Network connection failed'});
}

/// Server-related failures.
class ServerFailure extends Failure {
  const ServerFailure({
    super.message = 'Server error occurred',
    this.statusCode,
  });

  final int? statusCode;

  @override
  List<Object?> get props => [message, statusCode];
}

/// Cache-related failures.
class CacheFailure extends Failure {
  const CacheFailure({super.message = 'Cache operation failed'});
}

/// Authentication failures.
class AuthFailure extends Failure {
  const AuthFailure({super.message = 'Authentication failed'});
}

/// Validation failures.
class ValidationFailure extends Failure {
  const ValidationFailure({super.message = 'Validation failed'});
}

/// Not found failures.
class NotFoundFailure extends Failure {
  const NotFoundFailure({super.message = 'Resource not found'});
}

/// Profile-specific failures.
class ProfileNotFoundFailure extends Failure {
  const ProfileNotFoundFailure({super.message = 'Profile not found'});
}

/// Profile update failure.
class ProfileUpdateFailure extends Failure {
  const ProfileUpdateFailure({super.message = 'Failed to update profile'});
}

/// Logout failure.
class LogoutFailure extends Failure {
  const LogoutFailure({super.message = 'Failed to logout'});
}

/// Extension to convert failure to user-friendly message.
extension FailureX on Failure {
  String toUserMessage() {
    return switch (this) {
      NetworkFailure() => 'Please check your internet connection',
      ServerFailure(statusCode: final code) =>
        'Server error${code != null ? ' ($code)' : ''}. Please try again.',
      CacheFailure() => 'Unable to access local data',
      AuthFailure() => 'Please login again',
      ValidationFailure() => message,
      NotFoundFailure() => 'The requested resource was not found',
      ProfileNotFoundFailure() => 'Profile not found',
      ProfileUpdateFailure() => 'Failed to update profile. Please try again.',
      LogoutFailure() => 'Failed to logout. Please try again.',
      _ => message,
    };
  }
}
