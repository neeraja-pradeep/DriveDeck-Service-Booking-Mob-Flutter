import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/routes.dart';
import '../../../../app/theme/colors.dart';
import '../../application/providers/auth_providers.dart';
import '../../application/states/login_state.dart';
import '../widgets/otp_input_field.dart';

/// OTP verification screen.
class OtpVerificationScreen extends ConsumerStatefulWidget {
  const OtpVerificationScreen({
    super.key,
    required this.phoneNumber,
    this.rememberMe = false,
  });

  final String phoneNumber;
  final bool rememberMe;

  @override
  ConsumerState<OtpVerificationScreen> createState() =>
      _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends ConsumerState<OtpVerificationScreen> {
  final List<TextEditingController> _controllers = List.generate(
    6,
    (_) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());

  // Timer variable for countdown
  Timer? _timer;

  // Use ValueNotifier for countdown to avoid unnecessary rebuilds
  late final ValueNotifier<int> _countdownNotifier;
  late final ValueNotifier<bool> _canResendNotifier;

  @override
  void initState() {
    super.initState();
    // Initialize ValueNotifiers
    _countdownNotifier = ValueNotifier<int>(30);
    _canResendNotifier = ValueNotifier<bool>(false);

    // debugPrint(
    //   '🚀 OTP Screen: initState - Phone: ${widget.phoneNumber}, RememberMe: ${widget.rememberMe}',
    // );
    _startCountdown();

    // Add focus listeners to trigger rebuilds for border color changes
    for (int i = 0; i < _focusNodes.length; i++) {
      _focusNodes[i].addListener(() {
        // debugPrint(
        //   '🎯 OTP Screen: Focus changed on field $i - hasFocus: ${_focusNodes[i].hasFocus}',
        // );
        setState(() {});
      });
    }

    // Auto-focus first field
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // debugPrint('📱 OTP Screen: Auto-focusing first field');
      _focusNodes[0].requestFocus();
    });
  }

  @override
  void dispose() {
    // debugPrint('🗑️ OTP Screen: dispose - Cleaning up resources');
    // Always cancel timers to prevent memory leaks
    _timer?.cancel();

    // Dispose ValueNotifiers
    _countdownNotifier.dispose();
    _canResendNotifier.dispose();

    for (final controller in _controllers) {
      controller.dispose();
    }
    for (final node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _startCountdown() {
    // debugPrint('⏰ OTP Screen: Starting countdown timer');
    // Reset state for a new countdown
    _countdownNotifier.value = 30;
    _canResendNotifier.value = false;

    // Cancel existing timer if running
    _timer?.cancel();

    // Start a new periodic timer
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_countdownNotifier.value == 0) {
        // Stop the timer when we reach 0
        // debugPrint('⏰ OTP Screen: Countdown finished - Enabling resend');
        timer.cancel();
        _canResendNotifier.value = true;
      } else {
        // Decrement
        _countdownNotifier.value--;
        if (_countdownNotifier.value % 10 == 0) {
          // debugPrint('⏰ OTP Screen: Countdown at ${_countdownNotifier.value} seconds');
        }
      }
    });
  }

  void _resendOtp() {
    // debugPrint('🔄 OTP Screen: Resending OTP for phone: ${widget.phoneNumber}');
    // debugPrint('🔄 OTP Screen: Current OTP state before resend: "$_otp"');
    ref.read(loginStateProvider.notifier).requestOtp(widget.phoneNumber);
    // Restart the timer logic
    _startCountdown();
  }

  String get _otp => _controllers.map((c) => c.text).join();

  @override
  Widget build(BuildContext context) {
    final loginState = ref.watch(loginStateProvider);
    final isLoading = loginState.isLoading;
    // debugPrint(
    //   '🔄 OTP Screen: build() - isLoading: $isLoading, canResend: $_canResend, countdown: $_countdown',
    // );

    // Listen for success/error
    ref.listen<LoginState>(loginStateProvider, (previous, next) {
      // debugPrint('🔄 OTP Screen: LoginState changed from $previous to $next');
      next.whenOrNull(
        success: (session) {
          // debugPrint(
          //   '🎉 OTP Screen: OTP verification successful! Session: $session',
          // );
          // debugPrint('🏠 OTP Screen: Navigating to home...');
          context.go(Routes.home);
        },
        error: (failure) {
          // debugPrint('❌ OTP Screen: OTP verification failed: $failure');
          final errorMessage = failure.when(
            network: (msg) => msg,
            server: (msg, statusCode) {
              // debugPrint(
              //   '🚨 OTP Screen: Server error - Status: $statusCode, Message: $msg',
              // );
              // debugPrint(
              //   '💡 OTP Screen: This is a backend issue, not a UI problem',
              // );
              return msg;
            },
            cache: (msg) => msg,
            unknown: (msg) => msg,
            invalidOtp: (msg, _) {
              // debugPrint('🔐 OTP Screen: Invalid OTP entered: "$_otp"');
              return msg;
            },
            otpExpired: (msg) {
              // debugPrint('⏰ OTP Screen: OTP has expired');
              return msg;
            },
            phoneNumberAlreadyExists: (msg) => msg,
            invalidCredentials: (msg) => msg,
            sessionExpired: (msg) => msg,
            accountNotFound: (msg) => msg,
            validation: (msg, _) => msg,
          );
          // debugPrint('📱 OTP Screen: Showing error snackbar: "$errorMessage"');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(errorMessage), backgroundColor: Colors.red),
          );
        },
      );
    });

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // debugPrint(
            //   '⬅️ OTP Screen: Back button pressed, returning to login',
            // );
            ref.read(loginStateProvider.notifier).goBackToPhoneEntry();
            context.go(Routes.login);
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60.h),

              // Main title
              Text(
                'Please enter the code',
                style: TextStyle(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primary,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 40.h),

              // Subtitle
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontSize: 16.sp, color: Colors.grey[600]),
                  children: [
                    const TextSpan(text: "We've sent a code to "),
                    TextSpan(
                      text: _formatPhoneNumber(widget.phoneNumber),
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 50.h),

              // OTP Input Fields
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(6, (index) {
                  return OtpInputField(
                    controller: _controllers[index],
                    focusNode: _focusNodes[index],
                    index: index,
                    isEnabled: !isLoading,
                    onChanged: (value) {
                      // debugPrint(
                      //   '📝 OTP Screen: Field $index changed to "$value"',
                      // );
                      if (value.isNotEmpty) {
                        if (index < 5) {
                          // debugPrint(
                          //   '➡️ OTP Screen: Moving focus to field ${index + 1}',
                          // );
                          _focusNodes[index + 1].requestFocus();
                        } else {
                          // debugPrint(
                          //   '✅ OTP Screen: Last field filled, unfocusing',
                          // );
                          _focusNodes[index].unfocus();
                          if (_otp.length == 6) {
                            // debugPrint(
                            //   '🎯 OTP Screen: All 6 digits entered, auto-verifying',
                            // );
                            _verifyOtp();
                          }
                        }
                      } else if (value.isEmpty && index > 0) {
                        // debugPrint(
                        //   '⬅️ OTP Screen: Field $index cleared, moving focus to field ${index - 1}',
                        // );
                        _focusNodes[index - 1].requestFocus();
                      }
                      setState(() {});
                    },
                  );
                }),
              ),

              SizedBox(height: 50.h),

              // Verify Button
              SizedBox(
                width: double.infinity,
                height: 55.h,
                child: ElevatedButton(
                  onPressed: isLoading || _otp.length != 6 ? null : _verifyOtp,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.onPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    elevation: 0,
                  ),
                  child: isLoading
                      ? SizedBox(
                          width: 24.w,
                          height: 24.w,
                          child: const CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : Text(
                          'Verify',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                ),
              ),

              SizedBox(height: 30.h),

              // Resend Code Section
              Center(
                child: ValueListenableBuilder<bool>(
                  valueListenable: _canResendNotifier,
                  builder: (context, canResend, child) {
                    return canResend
                        ? GestureDetector(
                            onTap: _resendOtp,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 24.w,
                                vertical: 12.h,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Text(
                                'Send code again',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          )
                        : ValueListenableBuilder<int>(
                            valueListenable: _countdownNotifier,
                            builder: (context, countdown, child) {
                              return Text(
                                'Send code again  00:${countdown.toString().padLeft(2, '0')}',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.grey[600],
                                ),
                              );
                            },
                          );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _verifyOtp() {
    // debugPrint('🔐 OTP Screen: _verifyOtp called');
    // debugPrint('🔐 OTP Screen: Current OTP: "$_otp" (length: ${_otp.length})');
    // debugPrint('🔐 OTP Screen: RememberMe: ${widget.rememberMe}');

    if (_otp.length == 6) {
      // debugPrint('✅ OTP Screen: OTP length valid, calling verifyOtp');
      ref
          .read(loginStateProvider.notifier)
          .verifyOtp(_otp, rememberMe: widget.rememberMe);
    } else {
      // debugPrint('❌ OTP Screen: OTP length invalid (${_otp.length}/6)');
    }
  }

  String _formatPhoneNumber(String phone) {
    // Remove any non-digit characters
    final cleanPhone = phone.replaceAll(RegExp(r'[^\d]'), '');

    // Format as +91 XXXXX XXXXX for display
    if (cleanPhone.length >= 10) {
      final phoneWithoutCountryCode =
          cleanPhone.length > 10 && cleanPhone.startsWith('91')
          ? cleanPhone.substring(2)
          : cleanPhone.substring(cleanPhone.length - 10);

      return '+91 ${phoneWithoutCountryCode.substring(0, 5)} ${phoneWithoutCountryCode.substring(5)}';
    }

    return phone; // Return original if formatting fails
  }
}
