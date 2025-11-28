import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/session.dart';
import '../../domain/repositories/auth_repository.dart';

/// Use case for checking current session.
class CheckSessionUsecase {
  CheckSessionUsecase({required this.repository});

  final AuthRepository repository;

  /// Checks if a valid session exists.
  Future<Either<Failure, Session?>> call() async {
    return repository.getCurrentSession();
  }
}
