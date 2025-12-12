import 'package:equatable/equatable.dart';

/// User profile entity.
class UserProfile extends Equatable {
  const UserProfile({
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
    this.latitude,
    this.longitude,
    this.dateOfBirth,
    this.gender,
    this.profilePicture,
  });

  /// Creates an empty profile for initial state.
  factory UserProfile.empty() => const UserProfile(
    id: 0,
    username: '',
    firstName: '',
    lastName: '',
    phoneNumber: '',
  );

  final int id;
  final String username;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String? email;
  final String? role;
  final String? roleDisplay;
  final String? note;
  final DateTime? dateJoined;
  final DateTime? lastLogin;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final double? latitude;
  final double? longitude;
  final DateTime? dateOfBirth;
  final String? gender;
  final String? profilePicture;

  /// Get full name by combining first and last name.
  String get fullName {
    final name = '$firstName $lastName'.trim();
    return name.isNotEmpty ? name : username;
  }

  /// Get display name for greeting (first name or username).
  String get displayName {
    if (firstName.isNotEmpty) {
      return firstName;
    }
    return username.isNotEmpty ? username : 'Guest';
  }

  /// Get initials from first and last name.
  String get initials {
    final first = firstName.isNotEmpty ? firstName[0].toUpperCase() : '';
    final last = lastName.isNotEmpty ? lastName[0].toUpperCase() : '';
    if (first.isEmpty && last.isEmpty && username.isNotEmpty) {
      return username[0].toUpperCase();
    }
    return '$first$last';
  }

  /// Check if profile is empty/not loaded.
  bool get isEmpty => id == 0;

  /// Check if profile has valid data.
  bool get isNotEmpty => !isEmpty;

  /// Create a copy with updated fields.
  UserProfile copyWith({
    int? id,
    String? username,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? email,
    String? role,
    String? roleDisplay,
    String? note,
    DateTime? dateJoined,
    DateTime? lastLogin,
    DateTime? createdAt,
    DateTime? updatedAt,
    double? latitude,
    double? longitude,
    DateTime? dateOfBirth,
    String? gender,
    String? profilePicture,
  }) {
    return UserProfile(
      id: id ?? this.id,
      username: username ?? this.username,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      role: role ?? this.role,
      roleDisplay: roleDisplay ?? this.roleDisplay,
      note: note ?? this.note,
      dateJoined: dateJoined ?? this.dateJoined,
      lastLogin: lastLogin ?? this.lastLogin,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      gender: gender ?? this.gender,
      profilePicture: profilePicture ?? this.profilePicture,
    );
  }

  @override
  List<Object?> get props => [
    id,
    username,
    firstName,
    lastName,
    phoneNumber,
    email,
    role,
    roleDisplay,
    note,
    dateJoined,
    lastLogin,
    createdAt,
    updatedAt,
    latitude,
    longitude,
    dateOfBirth,
    gender,
    profilePicture,
  ];
}
