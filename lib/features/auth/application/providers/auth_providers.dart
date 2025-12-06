import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../app/bootstrap/app_bootstrap.dart';
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

/// Authentication Providers Documentation
///
/// This file contains the complete provider graph for authentication functionality.
/// The providers are organized in layers following Clean Architecture principles:
///
/// **Provider Dependency Graph:**
/// ```
/// UI Layer (Screens/Widgets)
///     ↓
/// State Providers (authStateProvider, loginStateProvider, registerStateProvider)
///     ↓
/// Use Case Providers (requestOtpUsecaseProvider, verifyOtpUsecaseProvider, etc.)
///     ↓
/// Repository Provider (authRepositoryProvider)
///     ↓
/// Data Source Providers (authApiProvider, authLocalDataSourceProvider)
///     ↓
/// Core Providers (apiClientProvider, secureStoreProvider)
/// ```
///
/// **Provider Lifecycles:**
/// - **Singleton Providers**: Core infrastructure (secureStore, apiClient, repository)
/// - **AutoDispose Providers**: Temporary UI state (login, register, xcsrf token)
/// - **Persistent Providers**: Global app state (authState)
///
/// **Memory Management:**
/// - UI state providers use autoDispose to prevent memory leaks
/// - Core providers remain alive for the app lifetime
/// - Callback functions avoid circular dependencies between notifiers

// ============================================================================
// CORE INFRASTRUCTURE PROVIDERS
// ============================================================================
// These providers form the foundation layer and remain alive for app lifetime

/// **SecureStore Provider**
///
/// Provides platform-specific secure storage implementation:
/// - **iOS**: Uses Keychain Services for secure token storage
/// - **Android**: Uses EncryptedSharedPreferences with AES encryption
///
/// **Lifecycle**: Singleton - Lives for entire app lifetime
/// **Dependencies**: None (platform-specific implementation)
/// **Used by**: ApiClient, AuthLocalDataSource, XCSRF token provider
final Provider<SecureStore> secureStoreProvider = Provider<SecureStore>((ref) {
  return SecureStore.create();
});

/// **App Bootstrap Provider**
///
/// Ensures proper app initialization before other providers can function.
/// Validates that AppBootstrap.initialize() has been called in main.dart.
///
/// **Lifecycle**: Singleton - Validates once during app startup
/// **Dependencies**: AppBootstrap (Hive boxes, environment config)
/// **Throws**: StateError if bootstrap hasn't completed
/// **Used by**: Other providers that depend on initialized services
final Provider<bool> appBootstrapProvider = Provider<bool>((ref) {
  // This will throw if bootstrap hasn't been completed
  try {
    // Try to access a box to verify initialization
    AppBootstrap.authBox;
    return true;
  } catch (e) {
    throw StateError(
      'App not properly initialized. Call AppBootstrap.initialize() in main.dart',
    );
  }
});

/// **API Client Provider**
///
/// Central HTTP client with comprehensive interceptor chain:
/// - **Logging**: Environment-aware request/response logging
/// - **Session**: Automatic token attachment and session management
/// - **Auth**: Development fallback headers for authentication
///
/// **Session Expiry Handling**: Uses ref.invalidate() to avoid circular dependencies
/// When session expires → Invalidates authStateProvider → Triggers re-authentication
///
/// **Lifecycle**: Singleton - Shared across all API calls
/// **Dependencies**: SecureStore for session data retrieval
/// **Used by**: All API data sources (AuthApi, etc.)
final Provider<ApiClient> apiClientProvider = Provider<ApiClient>((ref) {
  final secureStore = ref.read(secureStoreProvider);

  return ApiClient(
    getSessionData: () async {
      try {
        final sessionId = await secureStore.getSessionId();
        final xcsrfToken = await secureStore.getXcsrfToken();
        final userId = await secureStore.getUserId();

        if (sessionId != null && xcsrfToken != null && userId != null) {
          return {
            'sessionid': sessionId,
            'X-CSRFToken': xcsrfToken,
            'user-id': userId,
          };
        }
        return null;
      } catch (e) {
        // Return null if there's an error getting session data
        return null;
      }
    },
  );
});

// Data source providers

/// Provider for AuthApi.
final Provider<AuthApi> authApiProvider = Provider<AuthApi>((ref) {
  final apiClient = ref.read(apiClientProvider);
  return AuthApiImpl(apiClient: apiClient);
});

/// Provider for AuthLocalDataSource.
final Provider<AuthLocalDataSource> authLocalDataSourceProvider =
    Provider<AuthLocalDataSource>((ref) {
      final secureStore = ref.read(secureStoreProvider);
      return AuthLocalDataSourceImpl(secureStore: secureStore);
    });

// Repository provider

/// Provider for AuthRepository.
final Provider<AuthRepository> authRepositoryProvider =
    Provider<AuthRepository>((ref) {
      final authApi = ref.read(authApiProvider);
      final localDataSource = ref.read(authLocalDataSourceProvider);
      return AuthRepositoryImpl(
        authApi: authApi,
        localDataSource: localDataSource,
      );
    });

// Use case providers

/// Provider for RequestOtpUsecase.
final Provider<RequestOtpUsecase> requestOtpUsecaseProvider =
    Provider<RequestOtpUsecase>((ref) {
      final repository = ref.read(authRepositoryProvider);
      return RequestOtpUsecase(repository: repository);
    });

/// Provider for VerifyOtpUsecase.
final Provider<VerifyOtpUsecase> verifyOtpUsecaseProvider =
    Provider<VerifyOtpUsecase>((ref) {
      final repository = ref.read(authRepositoryProvider);
      return VerifyOtpUsecase(repository: repository);
    });

/// Provider for RegisterUsecase.
final Provider<RegisterUsecase> registerUsecaseProvider =
    Provider<RegisterUsecase>((ref) {
      final repository = ref.read(authRepositoryProvider);
      return RegisterUsecase(repository: repository);
    });

/// Provider for LogoutUsecase.
final Provider<LogoutUsecase> logoutUsecaseProvider = Provider<LogoutUsecase>((
  ref,
) {
  final repository = ref.read(authRepositoryProvider);
  return LogoutUsecase(repository: repository);
});

/// Provider for CheckSessionUsecase.
final Provider<CheckSessionUsecase> checkSessionUsecaseProvider =
    Provider<CheckSessionUsecase>((ref) {
      final repository = ref.read(authRepositoryProvider);
      return CheckSessionUsecase(repository: repository);
    });

// State providers

/// Main auth state provider.
final StateNotifierProvider<AuthNotifier, AuthState> authStateProvider =
    StateNotifierProvider<AuthNotifier, AuthState>((ref) {
      final checkSessionUsecase = ref.read(checkSessionUsecaseProvider);
      final logoutUsecase = ref.read(logoutUsecaseProvider);
      return AuthNotifier(
        checkSessionUsecase: checkSessionUsecase,
        logoutUsecase: logoutUsecase,
        ref: ref,
      );
    });

/// Login flow state provider.
/// Uses autoDispose to prevent memory leaks and stale state when navigating away.
final AutoDisposeStateNotifierProvider<LoginNotifier, LoginState>
loginStateProvider =
    StateNotifierProvider.autoDispose<LoginNotifier, LoginState>((ref) {
      final requestOtpUsecase = ref.read(requestOtpUsecaseProvider);
      final verifyOtpUsecase = ref.read(verifyOtpUsecaseProvider);
      return LoginNotifier(
        requestOtpUsecase: requestOtpUsecase,
        verifyOtpUsecase: verifyOtpUsecase,
        onAuthSuccess: (session) {
          // Access AuthNotifier when needed, avoiding stale references
          ref.read(authStateProvider.notifier).setAuthenticated(session);
        },
      );
    });

/// Register flow state provider.
/// Uses autoDispose to prevent memory leaks and stale state when navigating away.
final AutoDisposeStateNotifierProvider<RegisterNotifier, RegisterState>
registerStateProvider =
    StateNotifierProvider.autoDispose<RegisterNotifier, RegisterState>((ref) {
      final registerUsecase = ref.read(registerUsecaseProvider);
      return RegisterNotifier(
        registerUsecase: registerUsecase,
        onAuthSuccess: (session) {
          // Access AuthNotifier when needed, avoiding stale references
          ref.read(authStateProvider.notifier).setAuthenticated(session);
        },
      );
    });

/// Current XCSRF token provider.
/// Uses autoDispose to prevent stale token data and ensure fresh tokens are fetched.
/// Wrapped with try-catch to handle secure storage errors gracefully.
final AutoDisposeFutureProvider<String?> xcsrfTokenProvider =
    FutureProvider.autoDispose<String?>((ref) async {
      try {
        final secureStore = ref.watch(secureStoreProvider);
        return await secureStore.getXcsrfToken();
      } catch (e) {
        // Log the error and return null for graceful degradation
        // debugPrint('Error fetching XCSRF token: $e');
        return null;
      }
    });
