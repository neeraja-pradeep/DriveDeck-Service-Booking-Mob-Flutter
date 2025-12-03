import 'package:equatable/equatable.dart';
import '../../domain/entities/session.dart';
import '../../domain/entities/user.dart';

/// Authentication state for the application.
sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

/// Initial state when auth status is unknown.
class AuthInitial extends AuthState {
  const AuthInitial();
}

/// Loading state during authentication operations.
class AuthLoading extends AuthState {
  const AuthLoading();
}

/// Authenticated state with user session.
class AuthAuthenticated extends AuthState {
  final Session session;
  final User? user;

  const AuthAuthenticated(this.session, {this.user});

  @override
  List<Object?> get props => [session, user];
}

/// Unauthenticated state.
class AuthUnauthenticated extends AuthState {
  const AuthUnauthenticated();
}

/// Error state during authentication.
class AuthError extends AuthState {
  final String message;

  const AuthError(this.message);

  @override
  List<Object?> get props => [message];
}

/// Extension for convenient state checking.
extension AuthStateX on AuthState {
  bool get isAuthenticated => this is AuthAuthenticated;
  bool get isUnauthenticated => this is AuthUnauthenticated;
  bool get isLoading => this is AuthLoading;
  bool get hasError => this is AuthError;

  Session? get session =>
      this is AuthAuthenticated ? (this as AuthAuthenticated).session : null;

  User? get user =>
      this is AuthAuthenticated ? (this as AuthAuthenticated).user : null;
}
