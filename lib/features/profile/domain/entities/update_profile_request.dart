import 'package:equatable/equatable.dart';

/// Request entity for updating user profile.
class UpdateProfileRequest extends Equatable {
  const UpdateProfileRequest({
    required this.firstName,
    required this.lastName,
    this.email,
  });

  final String firstName;
  final String lastName;
  final String? email;

  @override
  List<Object?> get props => [firstName, lastName, email];
}
