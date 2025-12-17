import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../auth/presentation/components/auth_mode_toggle.dart';

/// State for the auth screen.
class AuthScreenState {
  const AuthScreenState({
    required this.currentMode,
    this.phoneNumber = '',
    this.username = '',
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
    this.rememberMe = false,
    this.phoneError,
    this.usernameError,
    this.emailError,
    this.passwordError,
    this.confirmPasswordError,
  });

  final AuthMode currentMode;
  final String phoneNumber;
  final String username;
  final String email;
  final String password;
  final String confirmPassword;
  final bool rememberMe;
  final String? phoneError;
  final String? usernameError;
  final String? emailError;
  final String? passwordError;
  final String? confirmPasswordError;

  /// Initial state with login mode.
  factory AuthScreenState.initial() => const AuthScreenState(
        currentMode: AuthMode.login,
      );

  /// Copy with method for immutable state updates.
  AuthScreenState copyWith({
    AuthMode? currentMode,
    String? phoneNumber,
    String? username,
    String? email,
    String? password,
    String? confirmPassword,
    bool? rememberMe,
    String? phoneError,
    String? usernameError,
    String? emailError,
    String? passwordError,
    String? confirmPasswordError,
    bool clearPhoneError = false,
    bool clearUsernameError = false,
    bool clearEmailError = false,
    bool clearPasswordError = false,
    bool clearConfirmPasswordError = false,
  }) {
    return AuthScreenState(
      currentMode: currentMode ?? this.currentMode,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      rememberMe: rememberMe ?? this.rememberMe,
      phoneError: clearPhoneError ? null : (phoneError ?? this.phoneError),
      usernameError:
          clearUsernameError ? null : (usernameError ?? this.usernameError),
      emailError: clearEmailError ? null : (emailError ?? this.emailError),
      passwordError:
          clearPasswordError ? null : (passwordError ?? this.passwordError),
      confirmPasswordError: clearConfirmPasswordError
          ? null
          : (confirmPasswordError ?? this.confirmPasswordError),
    );
  }

  /// Check if login mode is active.
  bool get isLoginMode => currentMode == AuthMode.login;

  /// Check if register mode is active.
  bool get isRegisterMode => currentMode == AuthMode.register;

  /// Check if there are any form errors.
  bool get hasErrors =>
      phoneError != null ||
      usernameError != null ||
      emailError != null ||
      passwordError != null ||
      confirmPasswordError != null;
}

/// Notifier for managing auth screen state.
class AuthScreenNotifier extends StateNotifier<AuthScreenState> {
  AuthScreenNotifier() : super(AuthScreenState.initial());

  /// Switch between login and register modes.
  void setMode(AuthMode mode) {
    state = state.copyWith(
      currentMode: mode,
      clearPhoneError: true,
      clearUsernameError: true,
      clearEmailError: true,
      clearPasswordError: true,
      clearConfirmPasswordError: true,
    );
  }

  /// Toggle to login mode.
  void switchToLogin() => setMode(AuthMode.login);

  /// Toggle to register mode.
  void switchToRegister() => setMode(AuthMode.register);

  /// Update phone number.
  void setPhoneNumber(String value) {
    state = state.copyWith(phoneNumber: value, clearPhoneError: true);
  }

  /// Update username.
  void setUsername(String value) {
    state = state.copyWith(username: value, clearUsernameError: true);
  }

  /// Update email.
  void setEmail(String value) {
    state = state.copyWith(email: value, clearEmailError: true);
  }

  /// Update password.
  void setPassword(String value) {
    state = state.copyWith(password: value, clearPasswordError: true);
  }

  /// Update confirm password.
  void setConfirmPassword(String value) {
    state = state.copyWith(confirmPassword: value, clearConfirmPasswordError: true);
  }

  /// Update remember me.
  void setRememberMe(bool value) {
    state = state.copyWith(rememberMe: value);
  }

  /// Set phone error.
  void setPhoneError(String? error) {
    state = state.copyWith(phoneError: error);
  }

  /// Set username error.
  void setUsernameError(String? error) {
    state = state.copyWith(usernameError: error);
  }

  /// Set email error.
  void setEmailError(String? error) {
    state = state.copyWith(emailError: error);
  }

  /// Set password error.
  void setPasswordError(String? error) {
    state = state.copyWith(passwordError: error);
  }

  /// Set confirm password error.
  void setConfirmPasswordError(String? error) {
    state = state.copyWith(confirmPasswordError: error);
  }

  /// Clear all errors.
  void clearErrors() {
    state = state.copyWith(
      clearPhoneError: true,
      clearUsernameError: true,
      clearEmailError: true,
      clearPasswordError: true,
      clearConfirmPasswordError: true,
    );
  }

  /// Clear all form data.
  void clearForm() {
    state = state.copyWith(
      phoneNumber: '',
      username: '',
      email: '',
      password: '',
      confirmPassword: '',
      rememberMe: false,
      clearPhoneError: true,
      clearUsernameError: true,
      clearEmailError: true,
      clearPasswordError: true,
      clearConfirmPasswordError: true,
    );
  }

  /// Reset to initial state.
  void reset() {
    state = AuthScreenState.initial();
  }
}
