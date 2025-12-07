import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/utils/validators.dart';
import '../../domain/entities/auth_credentials.dart';
import '../../domain/entities/session.dart';
import '../../domain/repositories/auth_repository.dart';

/// Use case for verifying an OTP.
class VerifyOtpUsecase {
  VerifyOtpUsecase({required this.repository});

  final AuthRepository repository;

  /// Verifies the OTP and returns a session on success.
  Future<Either<Failure, Session>> call(
    OtpVerifyCredentials credentials,
  ) async {
    // Validate OTP format
    final otpError = Validators.validateOtp(credentials.otp);
    if (otpError != null) {
      return Left(Failure.validation(message: otpError));
    }

    // Validate phone number
    final phoneError = Validators.validatePhoneNumber(credentials.phoneNumber);
    if (phoneError != null) {
      return Left(Failure.validation(message: phoneError));
    }

    return repository.verifyOtp(credentials);
  }
}
