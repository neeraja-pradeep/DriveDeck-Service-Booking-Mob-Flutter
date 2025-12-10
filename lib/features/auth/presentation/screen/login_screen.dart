import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/routes.dart';
import '../../../../core/error/failure.dart';
import '../../application/providers/auth_providers.dart';
import '../../application/states/login_state.dart';
import '../../application/states/register_state.dart';
import '../components/auth_mode_toggle.dart';
import '../components/login_form_section.dart';
import '../components/register_form_section.dart';
import '../components/social_login_section.dart';

/// Main authentication screen with toggle between Login/Register.
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  AuthMode _currentMode = AuthMode.login;

  @override
  Widget build(BuildContext context) {
    // Listen to login state for navigation
    ref.listen<LoginState>(loginStateProvider, (previous, next) {
      next.whenOrNull(
        otpSent: (otpState) {
          // debugPrint(
          //   '🎯 UI: OTP sent successfully, navigating to verification screen',
          // );
          // debugPrint('📱 UI: Phone number: ${otpState.otpSentTo}');

          // Navigate to OTP verification screen using GoRouter
          OtpVerificationRoute(
            phoneNumber: otpState.otpSentTo,
            rememberMe: false,
          ).go(context);
        },
        error: (failure) {
          // debugPrint(
          //   '❌ UI: Login failed with error type: ${failure.runtimeType}',
          // );

          final errorMessage = failure.when(
            network: (msg) {
              // debugPrint('🌐 UI: Network error: $msg');
              return msg;
            },
            server: (msg, statusCode) {
              // debugPrint('🔥 UI: Server error: $msg (Status: $statusCode)');
              return msg;
            },
            cache: (msg) {
              // debugPrint('💾 UI: Cache error: $msg');
              return msg;
            },
            unknown: (msg) {
              // debugPrint('❓ UI: Unknown error: $msg');
              return msg;
            },
            invalidOtp: (msg, _) {
              // debugPrint('🔢 UI: Invalid OTP error: $msg');
              return msg;
            },
            otpExpired: (msg) {
              // debugPrint('⏰ UI: OTP expired error: $msg');
              return msg;
            },
            phoneNumberAlreadyExists: (msg) {
              // debugPrint('📱 UI: Phone number already exists error: $msg');
              return msg;
            },
            invalidCredentials: (msg) {
              // debugPrint('🔐 UI: Invalid credentials error: $msg');
              return msg;
            },
            sessionExpired: (msg) {
              // debugPrint('⏳ UI: Session expired error: $msg');
              return msg;
            },
            accountNotFound: (msg) {
              // debugPrint('👤 UI: Account not found error: $msg');
              return msg;
            },
            validation: (msg, _) {
              // debugPrint('✅ UI: Validation error: $msg');
              return msg;
            },
            parsing: (msg) => msg,
            unauthorized: (msg, _) => msg,
            notFound: (msg) => msg,
            permission: (msg) => msg,
            generic: (msg, _) => msg,
            locationPermissionDenied: (status, msg, _) => msg,
            locationServiceDisabled: (msg, _) => msg,
            locationFetch: (msg, _) => msg,
            bookingNotFound: (msg) => msg,
            bookingAlreadyCancelled: (msg) => msg,
            cancellationNotAllowed: (msg, _) => msg,
            bookingFetch: (msg) => msg,
            shopNotFound: (msg) => msg,
            noSlotsAvailable: (msg) => msg,
            bookingCreationFailed: (msg) => msg,
            slotNoLongerAvailable: (msg) => msg,
            invalidPromoCode: (msg) => msg,
            noConnection: (msg) => msg,
          );

          // debugPrint(
          //   '📢 UI: Showing error snackbar with message: $errorMessage',
          // );

          // Show error snackbar
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(errorMessage), backgroundColor: Colors.red),
          );
        },
      );
    });

    // Listen to register state
    ref.listen<RegisterState>(registerStateProvider, (previous, next) {
      next.whenOrNull(
        success: (session) {
          // debugPrint('🎉 UI: Registration successful! Navigating to home...');
          // Add a small delay to ensure session is persisted to secure storage
          // before navigating away
          Future.delayed(const Duration(milliseconds: 500), () {
            if (context.mounted) {
              const HomeRoute().go(context);
            }
          });
        },
        error: (failure) {
          // debugPrint(
          //   '❌ UI: Registration failed with error: ${failure.userMessage}',
          // );
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                failure.when(
                  network: (msg) => msg,
                  server: (msg, _) => msg,
                  cache: (msg) => msg,
                  unknown: (msg) => msg,
                  invalidOtp: (msg, _) => msg,
                  otpExpired: (msg) => msg,
                  phoneNumberAlreadyExists: (msg) => msg,
                  invalidCredentials: (msg) => msg,
                  sessionExpired: (msg) => msg,
                  accountNotFound: (msg) => msg,
                  validation: (msg, _) => msg,
                  parsing: (msg) => msg,
                  unauthorized: (msg, _) => msg,
                  notFound: (msg) => msg,
                  permission: (msg) => msg,
                  generic: (msg, _) => msg,
                  locationPermissionDenied: (status, msg, _) => msg,
                  locationServiceDisabled: (msg, _) => msg,
                  locationFetch: (msg, _) => msg,
                  bookingNotFound: (msg) => msg,
                  bookingAlreadyCancelled: (msg) => msg,
                  cancellationNotAllowed: (msg, _) => msg,
                  bookingFetch: (msg) => msg,
                  shopNotFound: (msg) => msg,
                  noSlotsAvailable: (msg) => msg,
                  bookingCreationFailed: (msg) => msg,
                  slotNoLongerAvailable: (msg) => msg,
                  invalidPromoCode: (msg) => msg,
                  noConnection: (msg) => msg,
                ),
              ),
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 5),
            ),
          );
        },
      );
    });

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 60.h),

              // App logo/branding
              _buildLogo(),

              SizedBox(height: 40.h),

              // Auth mode toggle
              AuthModeToggle(
                currentMode: _currentMode,
                onModeChanged: (mode) {
                  setState(() {
                    _currentMode = mode;
                  });
                  // Reset states when switching modes
                  ref.read(loginStateProvider.notifier).resetState();
                  ref.read(registerStateProvider.notifier).resetState();
                },
              ),

              SizedBox(height: 32.h),

              // Form content based on mode
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: _currentMode == AuthMode.login
                    ? const LoginFormSection(key: ValueKey('login'))
                    : const RegisterFormSection(key: ValueKey('register')),
              ),

              SizedBox(height: 32.h),

              // Social login section
              const SocialLoginSection(),

              SizedBox(height: 24.h),

              // "Already have an account?" text for register mode
              if (_currentMode == AuthMode.register)
                Center(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _currentMode = AuthMode.login;
                      });
                      // Reset states when switching modes
                      ref.read(loginStateProvider.notifier).resetState();
                      ref.read(registerStateProvider.notifier).resetState();
                    },
                    child: RichText(
                      text: TextSpan(
                        text: 'Already have an account? ',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey[600],
                        ),
                        children: [
                          TextSpan(
                            text: 'Log in',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Column(
      children: [
        SizedBox(height: 40.h),
        Text(
          'DriveTo',
          style: TextStyle(
            fontSize: 32.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
