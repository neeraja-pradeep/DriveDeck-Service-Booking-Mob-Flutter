import 'package:flutter/material.dart';
import 'package:newapp/features/profile/presentation/screens/edit_profile_screen.dart';
import 'package:newapp/features/profile/presentation/screens/profile_screen.dart';

/// Route names for the application.
class AppRoutes {
  AppRoutes._();

  static const String profile = '/profile';
  static const String editProfile = '/profile/edit';
}

/// Application router for handling navigation.
class AppRouter {
  AppRouter._();

  /// Generate route based on route settings.
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.profile:
        return _buildRoute(const ProfileScreen(), settings);
      case AppRoutes.editProfile:
        return _buildRoute(const EditProfileScreen(), settings);
      default:
        return _buildRoute(const ProfileScreen(), settings);
    }
  }

  static MaterialPageRoute<dynamic> _buildRoute(
    Widget page,
    RouteSettings settings,
  ) {
    return MaterialPageRoute<dynamic>(
      builder: (context) => page,
      settings: settings,
    );
  }
}

/// Navigation extension for BuildContext.
extension NavigationExtension on BuildContext {
  /// Navigate to a named route.
  Future<T?> pushNamed<T>(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed<T>(routeName, arguments: arguments);
  }

  /// Replace the current route with a named route.
  Future<T?> pushReplacementNamed<T, TO>(
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.of(this).pushReplacementNamed<T, TO>(
      routeName,
      arguments: arguments,
    );
  }

  /// Pop the current route.
  void pop<T>([T? result]) {
    Navigator.of(this).pop<T>(result);
  }

  /// Pop until reaching the specified route.
  void popUntil(String routeName) {
    Navigator.of(this).popUntil(ModalRoute.withName(routeName));
  }

  /// Navigate to edit profile screen.
  void goToEditProfile() {
    pushNamed<void>(AppRoutes.editProfile);
  }

  /// Navigate to profile screen.
  void goToProfile() {
    pushNamed<void>(AppRoutes.profile);
  }
}
