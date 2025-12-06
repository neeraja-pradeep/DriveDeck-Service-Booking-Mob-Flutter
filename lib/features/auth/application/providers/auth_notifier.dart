import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/session.dart';
import '../states/auth_state.dart';
import '../usecases/check_session_usecase.dart';
import '../usecases/logout_usecase.dart';

/// Notifier for managing main authentication state.
class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier({
    required this.checkSessionUsecase,
    required this.logoutUsecase,
    required this.ref,
  }) : super(const AuthState.initial());

  final CheckSessionUsecase checkSessionUsecase;
  final LogoutUsecase logoutUsecase;
  final Ref ref;

  /// Checks the current auth status on app start.
  Future<void> checkAuthStatus() async {
    state = const AuthState.loading();

    final result = await checkSessionUsecase();

    result.fold(
      (failure) {
        state = const AuthState.unauthenticated();
      },
      (session) {
        if (session == null) {
          state = const AuthState.unauthenticated();
        } else if (session.isExpired) {
          state = const AuthState.sessionExpired();
        } else {
          state = AuthState.authenticated(session: session);
        }
      },
    );
  }

  /// Sets the authenticated state after successful login/register.
  void setAuthenticated(Session session) {
    state = AuthState.authenticated(session: session);
  }

  /// Logs out the current user.
  Future<void> logout() async {
    state = const AuthState.loading();

    final result = await logoutUsecase();

    result.fold(
      (failure) {
        // Even on failure, set to unauthenticated and invalidate providers
        _invalidateUserSpecificProviders();
        state = const AuthState.unauthenticated();
      },
      (_) {
        // Invalidate all user-specific providers to clear cached data
        _invalidateUserSpecificProviders();
        state = const AuthState.unauthenticated();
      },
    );
  }

  /// Invalidates all providers that might contain user-specific data.
  void _invalidateUserSpecificProviders() {
    // Note: Auto-dispose providers (loginStateProvider, registerStateProvider, xcsrfTokenProvider)
    // will be automatically cleaned up when auth state changes since they watch auth state.
    // This method is kept for future user-specific providers that need explicit invalidation.

    // Future user-specific providers should be invalidated here:
    // Example: ref.invalidate(userProfileProvider);
    // Example: ref.invalidate(userPreferencesProvider);
  }

  /// Handles session expiry event from network layer.
  void handleSessionExpiry() {
    state = const AuthState.sessionExpired();
  }
}
