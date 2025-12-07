import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/auth_credentials.dart';
import '../entities/otp_state.dart';
import '../entities/session.dart';

/// Abstract repository defining authentication operations.
/// All methods return Either<Failure, T> for functional error handling.
abstract class AuthRepository {
  /// Requests an OTP to be sent to the provided phone number.
  Future<Either<Failure, OtpState>> requestOtp(
    OtpRequestCredentials credentials,
  );

  /// Verifies the OTP and returns a session on success.
  Future<Either<Failure, Session>> verifyOtp(
    OtpVerifyCredentials credentials,
  );

  /// Registers a new user and returns a session on success.
  Future<Either<Failure, Session>> register(
    RegisterCredentials credentials,
  );

  /// Logs out the current user.
  Future<Either<Failure, Unit>> logout();

  /// Gets the current session from local storage.
  /// Returns null if no session exists.
  Future<Either<Failure, Session?>> getCurrentSession();

  /// Clears the current session from local storage.
  Future<Either<Failure, Unit>> clearSession();

  /// Checks if the current session is valid.
  Future<Either<Failure, bool>> isSessionValid();
}
