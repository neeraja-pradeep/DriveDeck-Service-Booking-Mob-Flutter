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
          // Phone number field
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

          SizedBox(height: 16.h),

          // Username field
          TextFormField(
            controller: _usernameController,
            enabled: !isLoading,
            decoration: InputDecoration(
              labelText: 'Username',
              errorText: _usernameError,
              prefixIcon: const Icon(Icons.person_outline),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            onChanged: (_) {
              if (_usernameError != null) {
                setState(() => _usernameError = null);
              }
            },
          ),

          SizedBox(height: 16.h),

          // Password field
          TextFormField(
            controller: _passwordController,
            enabled: !isLoading,
            obscureText: _obscurePassword,
            decoration: InputDecoration(
              labelText: 'Password',
              errorText: _passwordError,
              prefixIcon: const Icon(Icons.lock_outline),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() => _obscurePassword = !_obscurePassword);
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            onChanged: (_) {
              if (_passwordError != null) {
                setState(() => _passwordError = null);
              }
            },
          ),

          SizedBox(height: 16.h),

          // Confirm password field
          TextFormField(
            controller: _confirmPasswordController,
            enabled: !isLoading,
            obscureText: _obscureConfirmPassword,
            decoration: InputDecoration(
              labelText: 'Confirm Password',
              errorText: _confirmPasswordError,
              prefixIcon: const Icon(Icons.lock_outline),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureConfirmPassword
                      ? Icons.visibility_off
                      : Icons.visibility,
                ),
                onPressed: () {
                  setState(
                    () => _obscureConfirmPassword = !_obscureConfirmPassword,
                  );
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            onChanged: (_) {
              if (_confirmPasswordError != null) {
                setState(() => _confirmPasswordError = null);
              }
            },
          ),

          SizedBox(height: 24.h),

          // Register button
          SizedBox(
            height: 50.h,
            child: ElevatedButton(
              onPressed: isLoading ? null : _onRegister,
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
                      'Register',
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
    final passwordError = Validators.validatePassword(
      _passwordController.text,
    );
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

    // Register
    final credentials = RegisterCredentials(
      phoneNumber: _phoneController.text.trim(),
      username: _usernameController.text.trim(),
      password: _passwordController.text,
      confirmPassword: _confirmPasswordController.text,
    );

    ref.read(registerStateProvider.notifier).register(credentials);
  }
}
