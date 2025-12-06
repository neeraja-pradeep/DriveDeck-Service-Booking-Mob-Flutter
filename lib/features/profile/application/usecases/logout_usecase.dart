import 'package:dartz/dartz.dart';
import 'package:newapp/core/error/failure.dart';
import 'package:newapp/features/profile/domain/repositories/profile_repository.dart';

/// Use case for logging out user.
class LogoutUsecase {
  LogoutUsecase({required this.repository});

  final ProfileRepository repository;

  /// Execute the use case.
  Future<Either<Failure, Unit>> call() async {
    return repository.logout();
  }
}
