import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newapp/core/network/api_client.dart';
import 'package:newapp/core/network/endpoints.dart';
import 'package:newapp/core/storage/secure_store.dart';
import 'package:newapp/features/profile/application/providers/edit_profile_notifier.dart';
import 'package:newapp/features/profile/application/providers/profile_notifier.dart';
import 'package:newapp/features/profile/application/states/edit_profile_state.dart';
import 'package:newapp/features/profile/application/states/profile_state.dart';
import 'package:newapp/features/profile/application/usecases/get_profile_usecase.dart';
import 'package:newapp/features/profile/application/usecases/logout_usecase.dart';
import 'package:newapp/features/profile/application/usecases/update_profile_usecase.dart';
import 'package:newapp/features/profile/domain/entities/user_profile.dart';
import 'package:newapp/features/profile/domain/repositories/profile_repository.dart';
import 'package:newapp/features/profile/infrastructure/data_sources/local/profile_local_ds.dart';
import 'package:newapp/features/profile/infrastructure/data_sources/remote/profile_api.dart';
import 'package:newapp/features/profile/infrastructure/repositories/profile_repository_impl.dart';

// Core providers
final secureStoreProvider = Provider<SecureStore>((ref) {
  return SecureStore();
});

final apiClientProvider = Provider<ApiClient>((ref) {
  final secureStore = ref.watch(secureStoreProvider);
  return ApiClient(
    baseUrl: Endpoints.baseUrl,
    secureStore: secureStore,
  );
});

// Profile API provider
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
    StateNotifierProvider.autoDispose<EditProfileNotifier, EditProfileState>(
        (ref) {
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
