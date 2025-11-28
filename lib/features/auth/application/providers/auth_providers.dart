import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../../core/network/api_client.dart';
import '../../../../core/storage/secure_store.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../infrastructure/data_sources/local/auth_local_ds.dart';
import '../../infrastructure/data_sources/remote/auth_api.dart';
import '../../infrastructure/repositories/auth_repository_impl.dart';
import '../states/auth_state.dart';
import '../states/login_state.dart';
import '../states/register_state.dart';
import '../usecases/check_session_usecase.dart';
import '../usecases/logout_usecase.dart';
import '../usecases/register_usecase.dart';
import '../usecases/request_otp_usecase.dart';
import '../usecases/verify_otp_usecase.dart';
import 'auth_notifier.dart';
import 'login_notifier.dart';
import 'register_notifier.dart';

// Core providers

/// Provider for SecureStore.
final secureStoreProvider = Provider<SecureStore>((ref) {
  const storage = FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
    iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
  );
  return SecureStore(storage);
});

/// Provider for ApiClient.
final apiClientProvider = Provider<ApiClient>((ref) {
  final secureStore = ref.watch(secureStoreProvider);
  final authNotifier = ref.read(authStateProvider.notifier);

  return ApiClient(
    secureStore: secureStore,
    onSessionExpired: () {
      authNotifier.handleSessionExpiry();
    },
  );
});

// Data source providers

/// Provider for AuthApi.
final authApiProvider = Provider<AuthApi>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return AuthApiImpl(apiClient: apiClient);
});

/// Provider for AuthLocalDataSource.
final authLocalDataSourceProvider = Provider<AuthLocalDataSource>((ref) {
  final secureStore = ref.watch(secureStoreProvider);
  return AuthLocalDataSourceImpl(secureStore: secureStore);
});

// Repository provider

/// Provider for AuthRepository.
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final authApi = ref.watch(authApiProvider);
  final localDataSource = ref.watch(authLocalDataSourceProvider);
  return AuthRepositoryImpl(
    authApi: authApi,
    localDataSource: localDataSource,
  );
});

// Use case providers

/// Provider for RequestOtpUsecase.
final requestOtpUsecaseProvider = Provider<RequestOtpUsecase>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return RequestOtpUsecase(repository: repository);
});

/// Provider for VerifyOtpUsecase.
final verifyOtpUsecaseProvider = Provider<VerifyOtpUsecase>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return VerifyOtpUsecase(repository: repository);
});

/// Provider for RegisterUsecase.
final registerUsecaseProvider = Provider<RegisterUsecase>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return RegisterUsecase(repository: repository);
});

/// Provider for LogoutUsecase.
final logoutUsecaseProvider = Provider<LogoutUsecase>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return LogoutUsecase(repository: repository);
});

/// Provider for CheckSessionUsecase.
final checkSessionUsecaseProvider = Provider<CheckSessionUsecase>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return CheckSessionUsecase(repository: repository);
});

// State providers

/// Main auth state provider.
final authStateProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final checkSessionUsecase = ref.watch(checkSessionUsecaseProvider);
  final logoutUsecase = ref.watch(logoutUsecaseProvider);
  return AuthNotifier(
    checkSessionUsecase: checkSessionUsecase,
    logoutUsecase: logoutUsecase,
  );
});

/// Login flow state provider.
final loginStateProvider = StateNotifierProvider<LoginNotifier, LoginState>((ref) {
  final requestOtpUsecase = ref.watch(requestOtpUsecaseProvider);
  final verifyOtpUsecase = ref.watch(verifyOtpUsecaseProvider);
  final authNotifier = ref.read(authStateProvider.notifier);
  return LoginNotifier(
    requestOtpUsecase: requestOtpUsecase,
    verifyOtpUsecase: verifyOtpUsecase,
    authNotifier: authNotifier,
  );
});

/// Register flow state provider.
final registerStateProvider = StateNotifierProvider<RegisterNotifier, RegisterState>((ref) {
  final registerUsecase = ref.watch(registerUsecaseProvider);
  final authNotifier = ref.read(authStateProvider.notifier);
  return RegisterNotifier(
    registerUsecase: registerUsecase,
    authNotifier: authNotifier,
  );
});

/// Current XCSRF token provider.
final xcsrfTokenProvider = FutureProvider<String?>((ref) async {
  final secureStore = ref.watch(secureStoreProvider);
  return secureStore.getXcsrfToken();
});
