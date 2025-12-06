import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:newapp/features/profile/domain/entities/user_profile.dart';

part 'user_profile_model.g.dart';

/// User profile model for API serialization and Hive storage.
@JsonSerializable()
@HiveType(typeId: 40)
class UserProfileModel {
  const UserProfileModel({
    required this.id,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    this.email,
    this.role,
    this.roleDisplay,
    this.note,
    this.dateJoined,
    this.lastLogin,
    this.createdAt,
    this.updatedAt,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileModelFromJson(json);

  factory UserProfileModel.fromDomain(UserProfile profile) => UserProfileModel(
        id: profile.id,
        username: profile.username,
        firstName: profile.firstName,
        lastName: profile.lastName,
        phoneNumber: profile.phoneNumber,
        email: profile.email,
        role: profile.role,
        roleDisplay: profile.roleDisplay,
        note: profile.note,
        dateJoined: profile.dateJoined?.toIso8601String(),
        lastLogin: profile.lastLogin?.toIso8601String(),
        createdAt: profile.createdAt?.toIso8601String(),
        updatedAt: profile.updatedAt?.toIso8601String(),
      );

  @HiveField(0)
  @JsonKey(name: 'id')
  final int id;

  @HiveField(1)
  @JsonKey(name: 'username')
  final String username;

  @HiveField(2)
  @JsonKey(name: 'first_name')
  final String firstName;

  @HiveField(3)
  @JsonKey(name: 'last_name')
  final String lastName;

  @HiveField(4)
  @JsonKey(name: 'phone_number')
  final String phoneNumber;

  @HiveField(5)
  @JsonKey(name: 'email')
  final String? email;

  @HiveField(6)
  @JsonKey(name: 'role')
  final String? role;

  @HiveField(7)
  @JsonKey(name: 'role_display')
  final String? roleDisplay;

  @HiveField(8)
  @JsonKey(name: 'note')
  final String? note;

  @HiveField(9)
  @JsonKey(name: 'date_joined')
  final String? dateJoined;

  @HiveField(10)
  @JsonKey(name: 'last_login')
  final String? lastLogin;

  @HiveField(11)
  @JsonKey(name: 'created_at')
  final String? createdAt;

  @HiveField(12)
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  Map<String, dynamic> toJson() => _$UserProfileModelToJson(this);

  /// Convert to domain entity.
  UserProfile toDomain() => UserProfile(
        id: id,
        username: username,
        firstName: firstName,
        lastName: lastName,
        phoneNumber: phoneNumber,
        email: email,
        role: role,
        roleDisplay: roleDisplay,
        note: note,
        dateJoined: dateJoined != null ? DateTime.tryParse(dateJoined!) : null,
        lastLogin: lastLogin != null ? DateTime.tryParse(lastLogin!) : null,
        createdAt: createdAt != null ? DateTime.tryParse(createdAt!) : null,
        updatedAt: updatedAt != null ? DateTime.tryParse(updatedAt!) : null,
      );
}
