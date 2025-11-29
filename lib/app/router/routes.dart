import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Type-safe route definitions that eliminate hardcoded strings
/// and provide compile-time safety for navigation.

/// Base route class for type safety
abstract class AppRoute {
  const AppRoute();

  /// The route path
  String get path;

  /// Navigate to this route
  void go(BuildContext context);

  /// Push this route onto the navigation stack
  Future<T?> push<T extends Object?>(BuildContext context);

  /// Replace the current route with this route
  void pushReplacement(BuildContext context);
}

/// Splash route - root path
class SplashRoute extends AppRoute {
  const SplashRoute();

  @override
  String get path => '/';

  @override
  void go(BuildContext context) => context.go(path);

  @override
  Future<T?> push<T extends Object?>(BuildContext context) =>
      context.push<T>(path);

  @override
  void pushReplacement(BuildContext context) => context.pushReplacement(path);
}

/// Login route
class LoginRoute extends AppRoute {
  const LoginRoute();

  @override
  String get path => '/login';

  @override
  void go(BuildContext context) => context.go(path);

  @override
  Future<T?> push<T extends Object?>(BuildContext context) =>
      context.push<T>(path);

  @override
  void pushReplacement(BuildContext context) => context.pushReplacement(path);
}

/// OTP Verification route with typed parameters
class OtpVerificationRoute extends AppRoute {
  const OtpVerificationRoute({
    required this.phoneNumber,
    this.rememberMe = false,
  });

  final String phoneNumber;
  final bool rememberMe;

  @override
  String get path => '/otp-verification';

  /// Get the full path with query parameters
  String get fullPath =>
      '$path?phoneNumber=${Uri.encodeComponent(phoneNumber)}&rememberMe=$rememberMe';

  @override
  void go(BuildContext context) {
    context.go(
      path,
      extra: {'phoneNumber': phoneNumber, 'rememberMe': rememberMe},
    );
  }

  @override
  Future<T?> push<T extends Object?>(BuildContext context) {
    return context.push<T>(
      path,
      extra: {'phoneNumber': phoneNumber, 'rememberMe': rememberMe},
    );
  }

  @override
  void pushReplacement(BuildContext context) {
    context.pushReplacement(
      path,
      extra: {'phoneNumber': phoneNumber, 'rememberMe': rememberMe},
    );
  }
}

/// Home route
class HomeRoute extends AppRoute {
  const HomeRoute();

  @override
  String get path => '/home';

  @override
  void go(BuildContext context) => context.go(path);

  @override
  Future<T?> push<T extends Object?>(BuildContext context) =>
      context.push<T>(path);

  @override
  void pushReplacement(BuildContext context) => context.pushReplacement(path);
}

/// Profile route
class ProfileRoute extends AppRoute {
  const ProfileRoute();

  @override
  String get path => '/profile';

  @override
  void go(BuildContext context) => context.go(path);

  @override
  Future<T?> push<T extends Object?>(BuildContext context) =>
      context.push<T>(path);

  @override
  void pushReplacement(BuildContext context) => context.pushReplacement(path);
}

/// Legacy Routes class for backward compatibility during migration
/// TODO: Remove this once all navigation calls are updated to use typed routes
@Deprecated('Use typed routes instead (e.g., LoginRoute(), HomeRoute())')
class Routes {
  Routes._();

  // Auth routes
  static const String login = '/login';
  static const String otpVerification = '/otp-verification';

  // Main routes
  static const String home = '/home';
  static const String splash = '/';

  // Profile routes
  static const String profile = '/profile';
}
