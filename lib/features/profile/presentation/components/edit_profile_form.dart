import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newapp/app/theme/colors.dart';
import 'package:newapp/app/theme/typography.dart';
import 'package:newapp/core/error/failure.dart';
import 'package:newapp/features/profile/application/providers/profile_providers.dart';
import 'package:newapp/features/profile/application/states/edit_profile_state.dart';
import 'package:newapp/features/profile/domain/entities/update_profile_request.dart';
import 'package:newapp/features/profile/domain/entities/user_profile.dart';

/// Edit profile form widget.
class EditProfileForm extends ConsumerStatefulWidget {
  const EditProfileForm({
    required this.profile,
    super.key,
  });

  final UserProfile profile;

  @override
  ConsumerState<EditProfileForm> createState() => _EditProfileFormState();
}

class _EditProfileFormState extends ConsumerState<EditProfileForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _firstNameController =
        TextEditingController(text: widget.profile.firstName);
    _lastNameController = TextEditingController(text: widget.profile.lastName);
    _emailController = TextEditingController(text: widget.profile.email ?? '');
    _phoneController =
        TextEditingController(text: widget.profile.phoneNumber);
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final editState = ref.watch(editProfileStateProvider);

    ref.listen<EditProfileState>(editProfileStateProvider, (previous, next) {
      if (next is EditProfileSaved) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Profile updated successfully')),
        );
        Navigator.of(context).pop();
      } else if (next is EditProfileError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.failure.toUserMessage())),
        );
      }
    });

    final isSaving = editState is EditProfileSaving;

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildTextField(
            controller: _firstNameController,
            label: 'First Name',
            hint: 'Enter your first name',
            enabled: !isSaving,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'First name is required';
              }
              if (value.length < 2) {
                return 'First name must be at least 2 characters';
              }
              return null;
            },
          ),
          SizedBox(height: 16.h),
          _buildTextField(
            controller: _lastNameController,
            label: 'Last Name',
            hint: 'Enter your last name',
            enabled: !isSaving,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Last name is required';
              }
              if (value.length < 2) {
                return 'Last name must be at least 2 characters';
              }
              return null;
            },
          ),
          SizedBox(height: 16.h),
          _buildTextField(
            controller: _emailController,
            label: 'Email',
            hint: 'Enter your email (optional)',
            enabled: !isSaving,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value != null && value.isNotEmpty) {
                final emailRegex = RegExp(
                  r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                );
                if (!emailRegex.hasMatch(value)) {
                  return 'Please enter a valid email';
                }
              }
              return null;
            },
          ),
          SizedBox(height: 16.h),
          _buildTextField(
            controller: _phoneController,
            label: 'Phone Number',
            hint: 'Phone number',
            enabled: false, // Read-only
            keyboardType: TextInputType.phone,
          ),
          SizedBox(height: 8.h),
          Text(
            'Phone number cannot be changed',
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.textHint,
            ),
          ),
          SizedBox(height: 32.h),
          SizedBox(
            height: 52.h,
            child: ElevatedButton(
              onPressed: isSaving ? null : _saveProfile,
              child: isSaving
                  ? SizedBox(
                      width: 24.w,
                      height: 24.w,
                      child: const CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(AppColors.white),
                      ),
                    )
                  : Text(
                      'Save Changes',
                      style: AppTypography.labelLarge.copyWith(
                        color: AppColors.white,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    bool enabled = true,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTypography.labelMedium.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        SizedBox(height: 8.h),
        TextFormField(
          controller: controller,
          enabled: enabled,
          keyboardType: keyboardType,
          validator: validator,
          style: AppTypography.bodyLarge,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: enabled ? AppColors.grey100 : AppColors.grey200,
          ),
        ),
      ],
    );
  }

  Future<void> _saveProfile() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final request = UpdateProfileRequest(
      firstName: _firstNameController.text.trim(),
      lastName: _lastNameController.text.trim(),
      email: _emailController.text.trim().isNotEmpty
          ? _emailController.text.trim()
          : null,
    );

    await ref.read(editProfileStateProvider.notifier).saveProfile(request);
  }
}
