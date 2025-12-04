import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/bookings/presentation/screens/bookings_screen.dart';
import '../../features/dashboard/presentation/screen/home_screen.dart';
import '../../features/profile/presentation/screen/profile_screen.dart';
import '../../features/shell/presentation/screens/main_shell_screen.dart';
import 'routes.dart';

/// Application router configuration.
///
/// Configures all routes and navigation using GoRouter.
class AppRouter {
  AppRouter._();

  /// Global navigator key.
  static final GlobalKey<NavigatorState> rootNavigatorKey =
      GlobalKey<NavigatorState>();

  /// Shell navigator key for bottom navigation.
  static final GlobalKey<NavigatorState> shellNavigatorKey =
      GlobalKey<NavigatorState>();

  /// The router configuration.
  static final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: Routes.home,
    debugLogDiagnostics: true,
    routes: [
      // Shell route for bottom navigation
      ShellRoute(
        navigatorKey: shellNavigatorKey,
        builder: (context, state, child) {
          return MainShellScreen(child: child);
        },
        routes: [
          // Home tab
          GoRoute(
            path: Routes.home,
            name: 'home',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: HomeScreen(),
            ),
          ),
          // Bookings tab
          GoRoute(
            path: Routes.bookings,
            name: 'bookings',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: BookingsScreen(),
            ),
          ),
          // Profile tab
          GoRoute(
            path: Routes.profile,
            name: 'profile',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: ProfileScreen(),
            ),
          ),
        ],
      ),
      // Booking detail (outside shell for full-screen experience)
      GoRoute(
        path: Routes.bookingDetail,
        name: 'bookingDetail',
        parentNavigatorKey: rootNavigatorKey,
        builder: (context, state) {
          final bookingId = state.pathParameters['bookingId']!;
          // TODO: Implement BookingDetailScreen if needed
          return const SizedBox.shrink();
        },
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Page not found: ${state.uri.path}'),
      ),
    ),
  );

  /// Navigates to the home screen.
  static void goToHome(BuildContext context) {
    context.go(Routes.home);
  }

  /// Navigates to the bookings screen.
  static void goToBookings(BuildContext context) {
    context.go(Routes.bookings);
  }

  /// Navigates to the profile screen.
  static void goToProfile(BuildContext context) {
    context.go(Routes.profile);
  }

  /// Navigates to booking detail.
  static void goToBookingDetail(BuildContext context, String bookingId) {
    context.push(Routes.bookingDetailPath(bookingId));
  }
}
