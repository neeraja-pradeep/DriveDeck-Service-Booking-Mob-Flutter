import 'package:dartz/dartz.dart';
import 'package:newapp/core/error/failure.dart';
import 'package:newapp/features/profile/domain/entities/update_profile_request.dart';
import 'package:newapp/features/profile/domain/entities/user_profile.dart';

/// Abstract profile repository interface.
abstract class ProfileRepository {
  /// Get user profile with conditional fetch support.
  /// Returns null if 304 Not Modified (use cache).
  Future<Either<Failure, UserProfile?>> getProfile({
    String? ifModifiedSince,
  });

  /// Update user profile.
  /// Requires XCSRF token (handled by interceptor).
  Future<Either<Failure, UserProfile>> updateProfile(
    UpdateProfileRequest request,
  );

  /// Logout user and clear session.
  /// Requires XCSRF token (handled by interceptor).
  Future<Either<Failure, Unit>> logout();

  /// Get cached profile from local storage.
  Future<UserProfile?> getCachedProfile();

  /// Get last modified timestamp for conditional fetch.
  Future<String?> getLastModified();

  /// Clear cached profile data.
  Future<void> clearCache();
}
