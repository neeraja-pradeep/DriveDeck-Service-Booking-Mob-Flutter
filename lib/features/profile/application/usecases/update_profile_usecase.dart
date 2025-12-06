import 'package:dartz/dartz.dart';
import 'package:newapp/core/error/failure.dart';
import 'package:newapp/features/profile/domain/entities/update_profile_request.dart';
import 'package:newapp/features/profile/domain/entities/user_profile.dart';
import 'package:newapp/features/profile/domain/repositories/profile_repository.dart';

/// Use case for updating user profile.
class UpdateProfileUsecase {
  UpdateProfileUsecase({required this.repository});

  final ProfileRepository repository;

  /// Execute the use case.
  Future<Either<Failure, UserProfile>> call(UpdateProfileRequest request) async {
    return repository.updateProfile(request);
  }
}
