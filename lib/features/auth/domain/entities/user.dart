import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

/// User entity representing an authenticated user in the system.
@freezed
class User with _$User {
  const factory User({
    required String id,
    required String phoneNumber,
    String? name,
    String? email,
    String? username,
    String? firstName,
    String? lastName,
    String? profilePicture,
    required DateTime createdAt,
  }) = _User;

  /// Creates an empty User instance for initial/unauthenticated state.
  factory User.empty() => User(
        id: '',
        phoneNumber: '',
        name: null,
        email: null,
        username: null,
        firstName: null,
        lastName: null,
        profilePicture: null,
        createdAt: DateTime.now(),
      );
}
