import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          // Navigate to OTP screen
          Navigator.of(context).pushNamed(
            '/otp-verification',
            arguments: {
              'phoneNumber': otpState.otpSentTo,
              'rememberMe': false,
            },
          );
        },
        error: (failure) {
          // Show error snackbar
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(failure.when(
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
              )),
              backgroundColor: Colors.red,
            ),
          );
        },
      );
    });

    // Listen to register state
    ref.listen<RegisterState>(registerStateProvider, (previous, next) {
      next.whenOrNull(
        success: (session) {
          // Navigate to home
          Navigator.of(context).pushNamedAndRemoveUntil(
            '/home',
            (route) => false,
          );
        },
        error: (failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(failure.when(
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
              )),
              backgroundColor: Colors.red,
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Column(
      children: [
        // App icon/logo placeholder
        Container(
          width: 80.w,
          height: 80.w,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Icon(
            Icons.car_repair,
            size: 48.sp,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 16.h),
        Text(
          'DriveDeck',
          style: TextStyle(
            fontSize: 28.sp,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          'Car Wash Service Booking',
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}
