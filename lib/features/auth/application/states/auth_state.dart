import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/session.dart';

part 'auth_state.freezed.dart';

/// Main authentication state for the app.
@freezed
sealed class AuthState with _$AuthState {
  const AuthState._();

  /// Initial state before auth check.
  const factory AuthState.initial() = AuthInitial;

  /// Loading state during auth operations.
  const factory AuthState.loading() = AuthLoading;

  /// User is authenticated with a valid session.
  const factory AuthState.authenticated({
    required Session session,
  }) = AuthAuthenticated;

  /// User is not authenticated.
  const factory AuthState.unauthenticated() = AuthUnauthenticated;

  /// Session has expired, need re-authentication.
  const factory AuthState.sessionExpired() = AuthSessionExpired;

  /// Auth error occurred.
  const factory AuthState.error({
    required Failure failure,
  }) = AuthError;

  /// Check if user is authenticated.
  bool get isAuthenticated => this is AuthAuthenticated;

  /// Check if auth is loading.
  bool get isLoading => this is AuthLoading;

  /// Get current session if authenticated.
  Session? get currentSession => maybeWhen(
        authenticated: (session) => session,
        orElse: () => null,
      );
}
