import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/validators.dart';
import '../../application/providers/auth_providers.dart';
import 'phone_number_field.dart';
import 'remember_me_checkbox.dart';

/// Login form content.
class LoginFormSection extends ConsumerStatefulWidget {
  const LoginFormSection({super.key});

  @override
  ConsumerState<LoginFormSection> createState() => _LoginFormSectionState();
}

class _LoginFormSectionState extends ConsumerState<LoginFormSection> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  bool _rememberMe = false;
  String? _phoneError;

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginState = ref.watch(loginStateProvider);
    final isLoading = loginState.isLoading;

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Phone number field with label
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Phone number',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: 8.h),
              PhoneNumberField(
                controller: _phoneController,
                errorText: _phoneError,
                enabled: !isLoading,
                onChanged: (_) {
                  if (_phoneError != null) {
                    setState(() {
                      _phoneError = null;
                    });
                  }
                },
              ),
            ],
          ),

          SizedBox(height: 16.h),

          // Remember me checkbox
          RememberMeCheckbox(
            value: _rememberMe,
            onChanged: (value) {
              setState(() {
                _rememberMe = value;
              });
            },
          ),

          SizedBox(height: 24.h),

          // Continue button
          SizedBox(
            height: 50.h,
            child: ElevatedButton(
              onPressed: isLoading ? null : _onContinue,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4FC3F7),
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
                      'Continue',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
            ),
          ),

          SizedBox(height: 24.h),

          // Divider with "Other sign in options" text
          Row(
            children: [
              Expanded(child: Divider(color: Colors.grey[300])),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Text(
                  'Other sign in options',
                  style: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
                ),
              ),
              Expanded(child: Divider(color: Colors.grey[300])),
            ],
          ),
        ],
      ),
    );
  }

  void _onContinue() {
    // debugPrint('🎯 UI: Continue button pressed on Sign In screen');

    final phoneNumber = _phoneController.text.trim();
    // debugPrint('📱 UI: Phone number entered: $phoneNumber');
    // debugPrint('✅ UI: Remember me checked: $_rememberMe');

    // Validate phone number
    final error = Validators.validatePhoneNumber(phoneNumber);
    if (error != null) {
      // debugPrint('❌ UI: Phone number validation failed: $error');
      setState(() {
        _phoneError = error;
      });
      return;
    }

    // debugPrint('✅ UI: Phone number validation passed');

    // Send only the 10-digit phone number (API expects exactly 10 digits)
    // debugPrint('🚀 UI: Requesting OTP for phone number: $phoneNumber');

    // Request OTP
    ref.read(loginStateProvider.notifier).requestOtp(phoneNumber);
  }
}
