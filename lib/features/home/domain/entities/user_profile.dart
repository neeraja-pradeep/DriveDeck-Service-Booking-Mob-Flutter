import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';

/// User profile entity for displaying user information.
@freezed
class UserProfile with _$UserProfile {
  const factory UserProfile({
    required int id,
    required String name,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    String? profileImage,
    double? latitude,
    double? longitude,
  }) = _UserProfile;

  const UserProfile._();

  /// Returns the full name of the user.
  String get fullName {
    if (firstName != null && lastName != null) {
      return '$firstName $lastName'.trim();
    }
    return name;
  }

  /// Returns the display name for greeting.
  String get displayName {
    if (firstName != null && firstName!.isNotEmpty) {
      return firstName!;
    }
    return name.split(' ').first;
  }
}
