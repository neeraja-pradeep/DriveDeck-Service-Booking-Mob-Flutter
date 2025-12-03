import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/screen/auth_debug_screen.dart';
import '../../features/auth/presentation/screen/login_screen.dart';
import '../../features/auth/presentation/widgets/auth_wrapper.dart';
import '../../features/dashboard/presentation/screen/dashboard_screen.dart';

/// App routes constants.
class AppRoutes {
  AppRoutes._();

  static const String home = '/home';
  static const String login = '/login';
  static const String authDebug = '/auth-debug';
  static const String serviceDetail = '/service/:serviceId';
  static const String categoryDetail = '/category/:categoryId';
  static const String search = '/search';
}

/// App router configuration using GoRouter.
class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.home,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: AppRoutes.login,
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRoutes.authDebug,
        name: 'authDebug',
        builder: (context, state) => const AuthDebugScreen(),
      ),
      GoRoute(
        path: AppRoutes.home,
        name: 'home',
        builder: (context, state) =>
            const AuthWrapper(child: DashboardScreen()),
      ),
      // Placeholder routes for future implementation
      GoRoute(
        path: AppRoutes.search,
        name: 'search',
        builder: (context, state) => const Scaffold(
          body: Center(child: Text('Search Screen - Coming Soon')),
        ),
      ),
      GoRoute(
        path: AppRoutes.serviceDetail,
        name: 'serviceDetail',
        builder: (context, state) {
          final serviceId = state.pathParameters['serviceId'];
          return Scaffold(
            body: Center(
              child: Text('Service Detail - $serviceId - Coming Soon'),
            ),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.categoryDetail,
        name: 'categoryDetail',
        builder: (context, state) {
          final categoryId = state.pathParameters['categoryId'];
          return Scaffold(
            body: Center(
              child: Text('Category Detail - $categoryId - Coming Soon'),
            ),
          );
        },
      ),
    ],
    errorBuilder: (context, state) =>
        Scaffold(body: Center(child: Text('Page not found: ${state.uri}'))),
  );

  /// Navigate to home screen.
  static void goToHome(BuildContext context) {
    context.go(AppRoutes.home);
  }

  /// Navigate to search screen.
  static void goToSearch(BuildContext context) {
    context.push(AppRoutes.search);
  }

  /// Navigate to service detail.
  static void goToServiceDetail(BuildContext context, String serviceId) {
    context.push('/service/$serviceId');
  }

  /// Navigate to category detail.
  static void goToCategoryDetail(BuildContext context, String categoryId) {
    context.push('/category/$categoryId');
  }
}
