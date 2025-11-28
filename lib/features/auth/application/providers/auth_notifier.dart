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
  }) : super(const AuthState.initial());

  final CheckSessionUsecase checkSessionUsecase;
  final LogoutUsecase logoutUsecase;

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
        // Even on failure, set to unauthenticated
        state = const AuthState.unauthenticated();
      },
      (_) {
        state = const AuthState.unauthenticated();
      },
    );
  }

  /// Handles session expiry event from network layer.
  void handleSessionExpiry() {
    state = const AuthState.sessionExpired();
  }
}
