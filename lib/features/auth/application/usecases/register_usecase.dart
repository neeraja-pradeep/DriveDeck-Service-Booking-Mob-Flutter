import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/utils/validators.dart';
import '../../domain/entities/auth_credentials.dart';
import '../../domain/entities/session.dart';
import '../../domain/repositories/auth_repository.dart';

/// Use case for user registration.
class RegisterUsecase {
  RegisterUsecase({required this.repository});

  final AuthRepository repository;

  /// Registers a new user and returns a session on success.
  Future<Either<Failure, Session>> call(
    RegisterCredentials credentials,
  ) async {
    // Validate phone number
    final phoneError = Validators.validatePhoneNumber(
      credentials.phoneNumber,
    );
    if (phoneError != null) {
      return Left(Failure.validation(message: phoneError));
    }

    // Validate username
    final usernameError = Validators.validateUsername(credentials.username);
    if (usernameError != null) {
      return Left(Failure.validation(message: usernameError));
    }

    // Validate password
    final passwordError = Validators.validatePassword(credentials.password);
    if (passwordError != null) {
      return Left(Failure.validation(message: passwordError));
    }

    // Validate confirm password
    final confirmError = Validators.validateConfirmPassword(
      credentials.password,
      credentials.confirmPassword,
    );
    if (confirmError != null) {
      return Left(Failure.validation(message: confirmError));
    }

    return repository.register(credentials);
  }
}
