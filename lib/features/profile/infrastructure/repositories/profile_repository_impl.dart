import 'package:dartz/dartz.dart';
import 'package:newapp/app/bootstrap/hive_init.dart';
import 'package:newapp/core/error/failure.dart';
import 'package:newapp/core/network/network_exceptions.dart';
import 'package:newapp/core/storage/secure_store.dart';
import 'package:newapp/features/profile/domain/entities/update_profile_request.dart';
import 'package:newapp/features/profile/domain/entities/user_profile.dart';
import 'package:newapp/features/profile/domain/repositories/profile_repository.dart';
import 'package:newapp/features/profile/infrastructure/data_sources/local/profile_local_ds.dart';
import 'package:newapp/features/profile/infrastructure/data_sources/remote/profile_api.dart';
import 'package:newapp/features/profile/infrastructure/models/update_profile_request_model.dart';

/// Profile repository implementation.
class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRepositoryImpl({
    required this.profileApi,
    required this.localDataSource,
    required this.secureStore,
  });

  final ProfileApi profileApi;
  final ProfileLocalDataSource localDataSource;
  final SecureStore secureStore;

  @override
  Future<Either<Failure, UserProfile?>> getProfile({
    String? ifModifiedSince,
  }) async {
    try {
      final lastModified = ifModifiedSince ?? await getLastModified();
      final response = await profileApi.getProfile(
        ifModifiedSince: lastModified,
      );

      if (response.isNotModified) {
        // Return null to indicate caller should use cache
        return const Right(null);
      }

      if (response.data != null) {
        final profile = response.data!.toDomain();
        // Save to cache
        await localDataSource.saveProfile(profile, response.lastModified);
        return Right(profile);
      }

      return const Left(ProfileNotFoundFailure());
    } on NetworkException catch (e) {
      return Left(e.toFailure());
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserProfile>> updateProfile(
    UpdateProfileRequest request,
  ) async {
    try {
      final requestModel = UpdateProfileRequestModel.fromDomain(request);
      final response = await profileApi.updateProfile(requestModel);
      final profile = response.toDomain();

      // Update cache
      await localDataSource.saveProfile(profile, null);

      return Right(profile);
    } on NetworkException catch (e) {
      return Left(e.toFailure());
    } catch (e) {
      return Left(ProfileUpdateFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      await profileApi.logout();
      await _clearAllData();
      return const Right(unit);
    } on NetworkException catch (e) {
      // Even if API fails, clear local data
      await _clearAllData();
      return Left(e.toFailure());
    } catch (e) {
      // Clear local data anyway
      await _clearAllData();
      return Left(LogoutFailure(message: e.toString()));
    }
  }

  @override
  Future<UserProfile?> getCachedProfile() async {
    return localDataSource.getProfile();
  }

  @override
  Future<String?> getLastModified() async {
    return localDataSource.getLastModified();
  }

  @override
  Future<void> clearCache() async {
    await localDataSource.clearCache();
  }

  Future<void> _clearAllData() async {
    await secureStore.clearAll();
    await HiveInit.clearAllBoxes();
  }
}
