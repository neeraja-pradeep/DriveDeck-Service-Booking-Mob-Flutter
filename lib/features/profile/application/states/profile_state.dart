import 'package:equatable/equatable.dart';
import 'package:newapp/core/error/failure.dart';
import 'package:newapp/features/profile/domain/entities/user_profile.dart';

/// Profile data state.
sealed class ProfileDataState extends Equatable {
  const ProfileDataState();

  @override
  List<Object?> get props => [];
}

/// Initial profile state.
class ProfileInitial extends ProfileDataState {
  const ProfileInitial();
}

/// Profile loading state.
class ProfileLoading extends ProfileDataState {
  const ProfileLoading();
}

/// Profile loaded state.
class ProfileLoaded extends ProfileDataState {
  const ProfileLoaded({
    required this.profile,
    this.fromCache = false,
  });

  final UserProfile profile;
  final bool fromCache;

  @override
  List<Object?> get props => [profile, fromCache];
}

/// Profile error state.
class ProfileError extends ProfileDataState {
  const ProfileError({required this.failure});

  final Failure failure;

  @override
  List<Object?> get props => [failure];
}

/// Main profile state combining data state and logout state.
class ProfileState extends Equatable {
  const ProfileState({
    required this.dataState,
    this.isLoggingOut = false,
  });

  factory ProfileState.initial() => const ProfileState(
        dataState: ProfileInitial(),
      );

  final ProfileDataState dataState;
  final bool isLoggingOut;

  ProfileState copyWith({
    ProfileDataState? dataState,
    bool? isLoggingOut,
  }) {
    return ProfileState(
      dataState: dataState ?? this.dataState,
      isLoggingOut: isLoggingOut ?? this.isLoggingOut,
    );
  }

  @override
  List<Object?> get props => [dataState, isLoggingOut];
}
