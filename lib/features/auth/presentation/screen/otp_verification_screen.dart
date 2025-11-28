import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../application/providers/auth_providers.dart';
import '../../application/states/login_state.dart';
import '../components/otp_input_section.dart';
import '../components/resend_otp_section.dart';

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
  String _otp = '';

  @override
  Widget build(BuildContext context) {
    final loginState = ref.watch(loginStateProvider);
    final isLoading = loginState.isLoading;

    // Listen for success/error
    ref.listen<LoginState>(loginStateProvider, (previous, next) {
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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () {
            ref.read(loginStateProvider.notifier).goBackToPhoneEntry();
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 40.h),

              // Header
              Text(
                'Enter verification code',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 12.h),

              // Subtitle
              Text(
                'Code sent to +91 ${_maskPhoneNumber(widget.phoneNumber)}',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 40.h),

              // OTP input
              OtpInputSection(
                enabled: !isLoading,
                onCompleted: (otp) {
                  setState(() {
                    _otp = otp;
                  });
                  _verifyOtp();
                },
                onChanged: (otp) {
                  setState(() {
                    _otp = otp;
                  });
                },
              ),

              SizedBox(height: 24.h),

              // Resend OTP section
              ResendOtpSection(
                onResend: () {
                  ref.read(loginStateProvider.notifier).requestOtp(
                        widget.phoneNumber,
                      );
                },
              ),

              SizedBox(height: 40.h),

              // Verify button
              SizedBox(
                height: 50.h,
                child: ElevatedButton(
                  onPressed: isLoading || _otp.length != 6 ? null : _verifyOtp,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
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
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _verifyOtp() {
    if (_otp.length == 6) {
      ref.read(loginStateProvider.notifier).verifyOtp(
            _otp,
            rememberMe: widget.rememberMe,
          );
    }
  }

  String _maskPhoneNumber(String phone) {
    if (phone.length >= 10) {
      return '${phone.substring(0, 2)}XXXX${phone.substring(phone.length - 4)}';
    }
    return phone;
  }
}
