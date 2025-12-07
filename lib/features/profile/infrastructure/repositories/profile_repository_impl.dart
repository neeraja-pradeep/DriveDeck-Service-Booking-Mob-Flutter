import 'package:dartz/dartz.dart';
import 'package:newapp/core/error/failure.dart';
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
      // print(
      //   'ProfileRepository: Getting profile with ifModifiedSince: $ifModifiedSince',
      // );

      final lastModified = ifModifiedSince ?? await getLastModified();
      // print('ProfileRepository: Using lastModified: $lastModified');

      final response = await profileApi.getProfile(
        ifModifiedSince: lastModified,
      );

      // print(
      //   'ProfileRepository: API response isNotModified: ${response.isNotModified}',
      // );

      if (response.isNotModified) {
        // Return null to indicate caller should use cache
        // print('ProfileRepository: Returning null (not modified)');
        return const Right(null);
      }

      if (response.data != null) {
        // print('ProfileRepository: Converting response data to domain');
        final profile = response.data!.toDomain();
        // print('ProfileRepository: Profile converted: ${profile.username}');

        // Save to cache
        await localDataSource.saveProfile(profile, response.lastModified);
        // print('ProfileRepository: Profile saved to cache');

        return Right(profile);
      }

      // print('ProfileRepository: No profile data in response');
      return const Left(Failure.notFound(message: 'Profile not found'));
    } catch (e, stackTrace) {
      // print('ProfileRepository: Error getting profile: $e');
      // print('ProfileRepository: Stack trace: $stackTrace');
      return Left(Failure.server(message: e.toString()));
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
    } catch (e) {
      return Left(Failure.server(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      await profileApi.logout();
      await _clearAllData();
      return const Right(unit);
    } catch (e) {
      // Clear local data anyway
      await _clearAllData();
      return Left(Failure.server(message: e.toString()));
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
    await localDataSource.clearCache();
  }
}
