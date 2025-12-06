import 'package:equatable/equatable.dart';
import 'package:newapp/core/error/failure.dart';
import 'package:newapp/features/profile/domain/entities/user_profile.dart';

/// Edit profile state.
sealed class EditProfileState extends Equatable {
  const EditProfileState();

  @override
  List<Object?> get props => [];
}

/// Initial edit profile state.
class EditProfileInitial extends EditProfileState {
  const EditProfileInitial({required this.profile});

  final UserProfile profile;

  @override
  List<Object?> get props => [profile];
}

/// Saving profile state.
class EditProfileSaving extends EditProfileState {
  const EditProfileSaving();
}

/// Profile saved successfully state.
class EditProfileSaved extends EditProfileState {
  const EditProfileSaved({required this.profile});

  final UserProfile profile;

  @override
  List<Object?> get props => [profile];
}

/// Edit profile error state.
class EditProfileError extends EditProfileState {
  const EditProfileError({
    required this.failure,
    required this.currentProfile,
  });

  final Failure failure;
  final UserProfile currentProfile;

  @override
  List<Object?> get props => [failure, currentProfile];
}
