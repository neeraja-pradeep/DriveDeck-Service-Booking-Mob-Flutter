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
          // Phone number field
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
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  void _onContinue() {
    final phoneNumber = _phoneController.text.trim();

    // Validate phone number
    final error = Validators.validatePhoneNumber(phoneNumber);
    if (error != null) {
      setState(() {
        _phoneError = error;
      });
      return;
    }

    // Request OTP
    ref.read(loginStateProvider.notifier).requestOtp(phoneNumber);
  }
}
