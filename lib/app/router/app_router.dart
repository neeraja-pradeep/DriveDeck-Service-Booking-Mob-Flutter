import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/application/providers/auth_providers.dart';
import '../../features/auth/application/states/auth_state.dart';
import '../../features/auth/presentation/screen/login_screen.dart';
import '../../features/auth/presentation/screen/otp_verification_screen.dart';
import '../../features/dashboard/presentation/screen/home_screen.dart';
import 'routes.dart';

/// Provider for GoRouter.
final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateProvider);

  return GoRouter(
    initialLocation: Routes.splash,
    debugLogDiagnostics: true,
    refreshListenable: GoRouterRefreshStream(ref),
    redirect: (context, state) {
      final isLoggedIn = authState.isAuthenticated;
      final isLoggingIn = state.matchedLocation == Routes.login ||
          state.matchedLocation == Routes.otpVerification;
      final isSplash = state.matchedLocation == Routes.splash;

      // If on splash, check auth state
      if (isSplash) {
        if (authState is AuthLoading || authState is AuthInitial) {
          return null; // Stay on splash while checking
        }
        return isLoggedIn ? Routes.home : Routes.login;
      }

      // If not logged in and not on login flow, redirect to login
      if (!isLoggedIn && !isLoggingIn) {
        return Routes.login;
      }

      // If logged in and trying to access login, redirect to home
      if (isLoggedIn && isLoggingIn) {
        return Routes.home;
      }

      // Handle session expired
      if (authState is AuthSessionExpired && !isLoggingIn) {
        return Routes.login;
      }

      return null;
    },
    routes: [
      // Splash route
      GoRoute(
        path: Routes.splash,
        builder: (context, state) => const SplashScreen(),
      ),

      // Login route
      GoRoute(
        path: Routes.login,
        builder: (context, state) => const LoginScreen(),
      ),

      // OTP verification route
      GoRoute(
        path: Routes.otpVerification,
        builder: (context, state) {
          final args = state.extra as Map<String, dynamic>?;
          return OtpVerificationScreen(
            phoneNumber: args?['phoneNumber'] as String? ?? '',
            rememberMe: args?['rememberMe'] as bool? ?? false,
          );
        },
      ),

      // Home route
      GoRoute(
        path: Routes.home,
        builder: (context, state) => const HomeScreen(),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Page not found: ${state.matchedLocation}'),
      ),
    ),
  );
});

/// Simple splash screen widget.
class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Check auth status on init
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(authStateProvider.notifier).checkAuthStatus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

/// GoRouter refresh stream for Riverpod state changes.
class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(this._ref) {
    _ref.listen(authStateProvider, (_, __) {
      notifyListeners();
    });
  }

  final Ref _ref;
}
