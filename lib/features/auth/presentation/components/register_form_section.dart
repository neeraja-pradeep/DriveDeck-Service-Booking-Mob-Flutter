import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/validators.dart';
import '../../application/providers/auth_providers.dart';
import '../../domain/entities/auth_credentials.dart';
import 'phone_number_field.dart';

/// Registration form content.
class RegisterFormSection extends ConsumerStatefulWidget {
  const RegisterFormSection({super.key});

  @override
  ConsumerState<RegisterFormSection> createState() =>
      _RegisterFormSectionState();
}

class _RegisterFormSectionState extends ConsumerState<RegisterFormSection> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  String? _phoneError;
  String? _usernameError;
  String? _passwordError;
  String? _confirmPasswordError;

  @override
  void dispose() {
    _phoneController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final registerState = ref.watch(registerStateProvider);
    final isLoading = registerState.isLoading;

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
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8.h),
              PhoneNumberField(
                controller: _phoneController,
                errorText: _phoneError,
                enabled: !isLoading,
                onChanged: (_) {
                  if (_phoneError != null) {
                    setState(() => _phoneError = null);
                  }
                },
              ),
            ],
          ),

          SizedBox(height: 16.h),

          // Name field with label
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8.h),
              TextFormField(
                controller: _usernameController,
                enabled: !isLoading,
                decoration: InputDecoration(
                  hintText: 'Name',
                  errorText: _usernameError,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(color: Colors.grey[300]!),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(color: Colors.grey[300]!),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                onChanged: (_) {
                  if (_usernameError != null) {
                    setState(() => _usernameError = null);
                  }
                },
              ),
            ],
          ),

          SizedBox(height: 16.h),

          // Password field with label
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Create a password',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8.h),
              TextFormField(
                controller: _passwordController,
                enabled: !isLoading,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  hintText: 'must be 8 characters',
                  errorText: _passwordError,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.grey[600],
                    ),
                    onPressed: () {
                      setState(() => _obscurePassword = !_obscurePassword);
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(color: Colors.grey[300]!),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(color: Colors.grey[300]!),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                onChanged: (_) {
                  if (_passwordError != null) {
                    setState(() => _passwordError = null);
                  }
                },
              ),
            ],
          ),

          SizedBox(height: 16.h),

          // Confirm password field with label
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Confirm password',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8.h),
              TextFormField(
                controller: _confirmPasswordController,
                enabled: !isLoading,
                obscureText: _obscureConfirmPassword,
                decoration: InputDecoration(
                  hintText: 'repeat password',
                  errorText: _confirmPasswordError,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureConfirmPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.grey[600],
                    ),
                    onPressed: () {
                      setState(
                        () =>
                            _obscureConfirmPassword = !_obscureConfirmPassword,
                      );
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(color: Colors.grey[300]!),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(color: Colors.grey[300]!),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                onChanged: (_) {
                  if (_confirmPasswordError != null) {
                    setState(() => _confirmPasswordError = null);
                  }
                },
              ),
            ],
          ),

          SizedBox(height: 24.h),

          // Register button
          SizedBox(
            height: 50.h,
            child: ElevatedButton(
              onPressed: isLoading ? null : _onRegister,
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
                      'Log in',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
            ),
          ),

          SizedBox(height: 24.h),

          // Divider with "Or Register with" text
          Row(
            children: [
              Expanded(child: Divider(color: Colors.grey[300])),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Text(
                  'Or Register with',
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

  void _onRegister() {
    // Reset errors
    setState(() {
      _phoneError = null;
      _usernameError = null;
      _passwordError = null;
      _confirmPasswordError = null;
    });

    bool hasError = false;

    // Validate phone
    final phoneError = Validators.validatePhoneNumber(
      _phoneController.text.trim(),
    );
    if (phoneError != null) {
      setState(() => _phoneError = phoneError);
      hasError = true;
    }

    // Validate username
    final usernameError = Validators.validateUsername(
      _usernameController.text.trim(),
    );
    if (usernameError != null) {
      setState(() => _usernameError = usernameError);
      hasError = true;
    }

    // Validate password
    final passwordError = Validators.validatePassword(_passwordController.text);
    if (passwordError != null) {
      setState(() => _passwordError = passwordError);
      hasError = true;
    }

    // Validate confirm password
    final confirmError = Validators.validateConfirmPassword(
      _passwordController.text,
      _confirmPasswordController.text,
    );
    if (confirmError != null) {
      setState(() => _confirmPasswordError = confirmError);
      hasError = true;
    }

    if (hasError) return;

    // Use only the 10-digit phone number (API expects exactly 10 digits)
    final phoneNumber = _phoneController.text.trim();

    // Register
    final credentials = RegisterCredentials(
      phoneNumber: phoneNumber,
      username: _usernameController.text.trim(),
      password: _passwordController.text,
      confirmPassword: _confirmPasswordController.text,
    );

    // debugPrint('🎯 UI: Starting registration with credentials:');
    // debugPrint('📱 Phone: ${credentials.phoneNumber}');
    // debugPrint('👤 Username: ${credentials.username}');
    // debugPrint('🔒 Password length: ${credentials.password.length}');
    // debugPrint(
    //   '🔒 Confirm password matches: ${credentials.password == credentials.confirmPassword}',
    // );

    ref.read(registerStateProvider.notifier).register(credentials);
  }
}
