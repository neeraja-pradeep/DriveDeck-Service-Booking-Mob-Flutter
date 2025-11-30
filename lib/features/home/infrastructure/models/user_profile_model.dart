import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/user_profile.dart';

part 'user_profile_model.freezed.dart';
part 'user_profile_model.g.dart';

/// User profile model for API response parsing.
@freezed
class UserProfileModel with _$UserProfileModel {
  const factory UserProfileModel({
    required int id,
    String? name,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    String? email,
    String? phone,
    @JsonKey(name: 'profile_image') String? profileImage,
    double? latitude,
    double? longitude,
  }) = _UserProfileModel;

  const UserProfileModel._();

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileModelFromJson(json);

  /// Converts the model to a domain entity.
  UserProfile toEntity() {
    return UserProfile(
      id: id,
      name: name ?? '${firstName ?? ''} ${lastName ?? ''}'.trim(),
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
      profileImage: profileImage,
      latitude: latitude,
      longitude: longitude,
    );
  }
}
