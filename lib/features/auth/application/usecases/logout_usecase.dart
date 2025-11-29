import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../domain/repositories/auth_repository.dart';

/// Use case for logging out.
class LogoutUsecase {
  LogoutUsecase({required this.repository});

  final AuthRepository repository;

  /// Logs out the current user.
  Future<Either<Failure, Unit>> call() async {
    return repository.logout();
  }
}
