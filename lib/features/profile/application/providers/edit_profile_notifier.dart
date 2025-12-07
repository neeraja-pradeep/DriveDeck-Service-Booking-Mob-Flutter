import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newapp/features/profile/application/providers/profile_providers.dart';
import 'package:newapp/features/profile/application/states/edit_profile_state.dart';
import 'package:newapp/features/profile/domain/entities/update_profile_request.dart';
import 'package:newapp/features/profile/domain/entities/user_profile.dart';

/// Edit profile state notifier.
class EditProfileNotifier extends StateNotifier<EditProfileState> {
  EditProfileNotifier(this._ref)
      : super(EditProfileInitial(profile: UserProfile.empty()));

  final Ref _ref;

  /// Initialize with current profile.
  void initialize(UserProfile profile) {
    state = EditProfileInitial(profile: profile);
  }

  /// Save profile updates.
  Future<bool> saveProfile(UpdateProfileRequest request) async {
    final currentProfile = _getCurrentProfile();
    state = const EditProfileSaving();

    final updateProfileUsecase = _ref.read(updateProfileUsecaseProvider);
    final result = await updateProfileUsecase(request);

    return result.fold(
      (failure) {
        state = EditProfileError(
          failure: failure,
          currentProfile: currentProfile,
        );
        return false;
      },
      (updatedProfile) {
        state = EditProfileSaved(profile: updatedProfile);
        // Update main profile state
        _ref.read(profileStateProvider.notifier).updateProfileLocally(
              updatedProfile,
            );
        return true;
      },
    );
  }

  UserProfile _getCurrentProfile() {
    return switch (state) {
      EditProfileInitial(profile: final p) => p,
      EditProfileError(currentProfile: final p) => p,
      EditProfileSaved(profile: final p) => p,
      EditProfileSaving() => UserProfile.empty(),
    };
  }
}
