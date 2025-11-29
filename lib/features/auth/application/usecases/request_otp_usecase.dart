import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/utils/validators.dart';
import '../../domain/entities/auth_credentials.dart';
import '../../domain/entities/otp_state.dart';
import '../../domain/repositories/auth_repository.dart';

/// Use case for requesting an OTP.
class RequestOtpUsecase {
  RequestOtpUsecase({required this.repository});

  final AuthRepository repository;

  /// Requests an OTP for the given phone number.
  Future<Either<Failure, OtpState>> call(
    OtpRequestCredentials credentials,
  ) async {
    // Validate phone number format
    final validationError = Validators.validatePhoneNumber(
      credentials.phoneNumber,
    );
    if (validationError != null) {
      return Left(Failure.validation(message: validationError));
    }

    return repository.requestOtp(credentials);
  }
}
