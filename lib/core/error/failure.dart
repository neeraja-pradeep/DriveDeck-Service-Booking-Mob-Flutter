import 'package:equatable/equatable.dart';

/// Base failure class for domain-level errors.
/// All failures should extend this class.
abstract class Failure extends Equatable {
  final String message;
  final String? code;

  const Failure({
    required this.message,
    this.code,
  });

  /// Converts the failure to a user-friendly message.
  String toUserMessage();

  @override
  List<Object?> get props => [message, code];
}

/// Network-related failures.
class NetworkFailure extends Failure {
  const NetworkFailure({
    super.message = 'Network error occurred',
    super.code,
  });

  @override
  String toUserMessage() => 'Please check your internet connection and try again.';
}

/// Server-related failures.
class ServerFailure extends Failure {
  final int? statusCode;

  const ServerFailure({
    super.message = 'Server error occurred',
    super.code,
    this.statusCode,
  });

  @override
  String toUserMessage() {
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
  }

  @override
  List<Object?> get props => [message, code, statusCode];
}

/// Cache-related failures.
class CacheFailure extends Failure {
  const CacheFailure({
    super.message = 'Cache error occurred',
    super.code,
  });

  @override
  String toUserMessage() => 'Unable to load cached data. Please refresh.';
}

/// Validation-related failures.
class ValidationFailure extends Failure {
  const ValidationFailure({
    required super.message,
    super.code,
  });

  @override
  String toUserMessage() => message;
}

/// Location permission denied failure.
class LocationPermissionDeniedFailure extends Failure {
  final LocationPermissionStatus status;

  const LocationPermissionDeniedFailure({
    required this.status,
    super.message = 'Location permission denied',
    super.code,
  });

  @override
  String toUserMessage() {
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
  }

  @override
  List<Object?> get props => [message, code, status];
}

/// Location service disabled failure.
class LocationServiceDisabledFailure extends Failure {
  const LocationServiceDisabledFailure({
    super.message = 'Location service disabled',
    super.code,
  });

  @override
  String toUserMessage() =>
      'Location services are disabled. Please enable them to continue.';
}

/// Location fetch failure.
class LocationFetchFailure extends Failure {
  const LocationFetchFailure({
    required super.message,
    super.code,
  });

  @override
  String toUserMessage() => 'Unable to get your location. Please try again.';
}

/// Unknown failure.
class UnknownFailure extends Failure {
  const UnknownFailure({
    super.message = 'An unknown error occurred',
    super.code,
  });

  @override
  String toUserMessage() => 'Something went wrong. Please try again.';
}

/// Location permission status enum.
enum LocationPermissionStatus {
  granted,
  denied,
  deniedForever,
  serviceDisabled,
}
