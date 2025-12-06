import 'package:dartz/dartz.dart';
import 'package:newapp/core/error/failure.dart';
import 'package:newapp/features/profile/domain/entities/user_profile.dart';
import 'package:newapp/features/profile/domain/repositories/profile_repository.dart';

/// Use case for getting user profile.
class GetProfileUsecase {
  GetProfileUsecase({required this.repository});

  final ProfileRepository repository;

  /// Execute the use case.
  /// Returns null if 304 Not Modified (caller should use cache).
  Future<Either<Failure, UserProfile?>> call({
    String? ifModifiedSince,
  }) async {
    return repository.getProfile(ifModifiedSince: ifModifiedSince);
  }
}
