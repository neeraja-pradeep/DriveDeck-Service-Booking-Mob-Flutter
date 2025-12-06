import 'package:hive/hive.dart';
import 'package:newapp/core/storage/hive/boxes.dart';
import 'package:newapp/core/storage/hive/keys.dart';
import 'package:newapp/features/profile/domain/entities/user_profile.dart';
import 'package:newapp/features/profile/infrastructure/models/user_profile_model.dart';

/// Abstract profile local data source interface.
abstract class ProfileLocalDataSource {
  /// Save profile to local storage.
  Future<void> saveProfile(UserProfile profile, String? lastModified);

  /// Get cached profile from local storage.
  Future<UserProfile?> getProfile();

  /// Get last modified timestamp.
  Future<String?> getLastModified();

  /// Clear profile cache.
  Future<void> clearCache();
}

/// Profile local data source implementation using Hive.
class ProfileLocalDataSourceImpl implements ProfileLocalDataSource {
  ProfileLocalDataSourceImpl();

  Box<dynamic> get _box => Hive.box<dynamic>(HiveBoxes.profileBox);

  @override
  Future<void> saveProfile(UserProfile profile, String? lastModified) async {
    final model = UserProfileModel.fromDomain(profile);
    await _box.put(ProfileBoxKeys.userProfile, model);
    if (lastModified != null) {
      await _box.put(ProfileBoxKeys.profileTimestamp, lastModified);
    }
  }

  @override
  Future<UserProfile?> getProfile() async {
    final model = _box.get(ProfileBoxKeys.userProfile);
    if (model is UserProfileModel) {
      return model.toDomain();
    }
    return null;
  }

  @override
  Future<String?> getLastModified() async {
    final timestamp = _box.get(ProfileBoxKeys.profileTimestamp);
    return timestamp as String?;
  }

  @override
  Future<void> clearCache() async {
    await _box.delete(ProfileBoxKeys.userProfile);
    await _box.delete(ProfileBoxKeys.profileTimestamp);
  }
}
