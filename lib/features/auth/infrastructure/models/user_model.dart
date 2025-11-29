import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/user.dart';

part 'user_model.g.dart';

/// JSON serializable model for User entity.
/// Handles snake_case from API.
@JsonSerializable()
class UserModel {
  const UserModel({
    required this.id,
    required this.phone,
    this.email,
    this.username,
    this.firstName,
    this.lastName,
    this.profilePicture,
    this.createdAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  factory UserModel.fromDomain(User user) => UserModel(
        id: int.tryParse(user.id) ?? 0,
        phone: user.phoneNumber,
        email: user.email,
        username: user.username,
        firstName: user.firstName,
        lastName: user.lastName,
        profilePicture: user.profilePicture,
        createdAt: user.createdAt.toIso8601String(),
      );

  final int id;
  final String phone;
  final String? email;
  final String? username;
  @JsonKey(name: 'first_name')
  final String? firstName;
  @JsonKey(name: 'last_name')
  final String? lastName;
  @JsonKey(name: 'profile_picture')
  final String? profilePicture;
  @JsonKey(name: 'created_at')
  final String? createdAt;

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  /// Converts this model to a domain User entity.
  User toDomain() => User(
        id: id.toString(),
        phoneNumber: phone,
        name: _getFullName(),
        email: email,
        username: username,
        firstName: firstName,
        lastName: lastName,
        profilePicture: profilePicture,
        createdAt: createdAt != null
            ? DateTime.tryParse(createdAt!) ?? DateTime.now()
            : DateTime.now(),
      );

  String? _getFullName() {
    if (firstName != null && lastName != null) {
      return '$firstName $lastName'.trim();
    }
    return firstName ?? lastName ?? username;
  }
}
