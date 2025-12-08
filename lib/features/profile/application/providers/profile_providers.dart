import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../auth/application/providers/auth_providers.dart';
import '../providers/edit_profile_notifier.dart';
import '../providers/profile_notifier.dart';
import '../states/edit_profile_state.dart';
import '../states/profile_state.dart';
import '../usecases/get_profile_usecase.dart';
import '../usecases/logout_usecase.dart';
import '../usecases/update_profile_usecase.dart';
import '../../domain/entities/user_profile.dart';
import '../../domain/repositories/profile_repository.dart';
import '../../infrastructure/data_sources/local/profile_local_ds.dart';
import '../../infrastructure/data_sources/remote/profile_api.dart';
import '../../infrastructure/repositories/profile_repository_impl.dart';

// Profile API provider - uses shared apiClientProvider for session cookie auth
final profileApiProvider = Provider<ProfileApi>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return ProfileApiImpl(apiClient: apiClient);
});

// Profile local data source provider
final profileLocalDataSourceProvider = Provider<ProfileLocalDataSource>((ref) {
  return ProfileLocalDataSourceImpl();
});

// Profile repository provider
final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  final profileApi = ref.watch(profileApiProvider);
  final localDataSource = ref.watch(profileLocalDataSourceProvider);
  final secureStore = ref.watch(secureStoreProvider);
  return ProfileRepositoryImpl(
    profileApi: profileApi,
    localDataSource: localDataSource,
    secureStore: secureStore,
  );
});

// Use case providers
final getProfileUsecaseProvider = Provider<GetProfileUsecase>((ref) {
  final repository = ref.watch(profileRepositoryProvider);
  return GetProfileUsecase(repository: repository);
});

final updateProfileUsecaseProvider = Provider<UpdateProfileUsecase>((ref) {
  final repository = ref.watch(profileRepositoryProvider);
  return UpdateProfileUsecase(repository: repository);
});

final logoutUsecaseProvider = Provider<LogoutUsecase>((ref) {
  final repository = ref.watch(profileRepositoryProvider);
  return LogoutUsecase(repository: repository);
});

// Main profile state provider
final profileStateProvider =
    StateNotifierProvider<ProfileNotifier, ProfileState>((ref) {
      return ProfileNotifier(ref);
    });

// Edit profile state provider
final editProfileStateProvider =
    StateNotifierProvider.autoDispose<EditProfileNotifier, EditProfileState>((
      ref,
    ) {
      return EditProfileNotifier(ref);
    });

// Derived providers
final currentUserProfileProvider = Provider<UserProfile?>((ref) {
  final state = ref.watch(profileStateProvider);
  if (state.dataState is ProfileLoaded) {
    return (state.dataState as ProfileLoaded).profile;
  }
  return null;
});

final isProfileLoadingProvider = Provider<bool>((ref) {
  final state = ref.watch(profileStateProvider);
  return state.dataState is ProfileLoading;
});

final isLoggingOutProvider = Provider<bool>((ref) {
  final state = ref.watch(profileStateProvider);
  return state.isLoggingOut;
});
