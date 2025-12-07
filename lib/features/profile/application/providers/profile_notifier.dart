import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newapp/features/profile/application/providers/profile_providers.dart';
import 'package:newapp/features/profile/application/states/profile_state.dart';
import 'package:newapp/features/profile/domain/entities/user_profile.dart';

/// Profile state notifier for managing profile data and logout.
class ProfileNotifier extends StateNotifier<ProfileState> {
  ProfileNotifier(this._ref) : super(ProfileState.initial());

  final Ref _ref;

  /// Initialize profile by fetching from cache first, then API.
  Future<void> initialize() async {
    await _fetchProfile();
  }

  Future<void> _fetchProfile() async {
    // print('ProfileNotifier: Starting _fetchProfile');

    // Try to get cached profile first
    final repository = _ref.read(profileRepositoryProvider);
    final cachedProfile = await repository.getCachedProfile();

    // print('ProfileNotifier: Cached profile: ${cachedProfile?.username}');

    if (cachedProfile != null) {
      state = state.copyWith(
        dataState: ProfileLoaded(profile: cachedProfile, fromCache: true),
      );
    } else {
      state = state.copyWith(dataState: const ProfileLoading());
    }

    // Fetch from API with conditional request
    final lastModified = await repository.getLastModified();
    final getProfileUsecase = _ref.read(getProfileUsecaseProvider);

    // print(
    //   'ProfileNotifier: Fetching from API with lastModified: $lastModified',
    // );

    final result = await getProfileUsecase(ifModifiedSince: lastModified);

    result.fold(
      (failure) {
        // print('ProfileNotifier: API fetch failed: ${failure.message}');
        // Only show error if we don't have cached data
        if (cachedProfile == null) {
          state = state.copyWith(dataState: ProfileError(failure: failure));
        }
      },
      (profile) {
        // print('ProfileNotifier: API fetch success: ${profile?.username}');
        if (profile != null) {
          state = state.copyWith(
            dataState: ProfileLoaded(profile: profile, fromCache: false),
          );
        }
        // If profile is null (304), keep the cached data
      },
    );
  }

  /// Refresh profile by force fetching from API.
  Future<void> refresh() async {
    final getProfileUsecase = _ref.read(getProfileUsecaseProvider);
    final result = await getProfileUsecase();

    result.fold(
      (failure) {
        // Keep current state, just show error via toast
      },
      (profile) {
        if (profile != null) {
          state = state.copyWith(
            dataState: ProfileLoaded(profile: profile, fromCache: false),
          );
        }
      },
    );
  }

  /// Update profile locally after edit.
  void updateProfileLocally(UserProfile profile) {
    state = state.copyWith(
      dataState: ProfileLoaded(profile: profile, fromCache: false),
    );
  }

  /// Logout user.
  Future<bool> logout() async {
    state = state.copyWith(isLoggingOut: true);

    final logoutUsecase = _ref.read(logoutUsecaseProvider);
    final result = await logoutUsecase();

    return result.fold(
      (failure) {
        state = state.copyWith(isLoggingOut: false);
        // Even on failure, we've cleared local data, so return true
        return true;
      },
      (_) {
        state = state.copyWith(isLoggingOut: false);
        return true;
      },
    );
  }
}
