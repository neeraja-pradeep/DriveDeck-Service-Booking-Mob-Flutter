import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:newapp/app/theme/colors.dart';
import 'package:newapp/app/theme/typography.dart';
import 'package:newapp/core/error/failure.dart';
import 'package:newapp/features/profile/application/providers/profile_providers.dart';
import 'package:newapp/features/profile/application/states/edit_profile_state.dart';
import 'package:newapp/features/profile/domain/entities/update_profile_request.dart';
import 'package:newapp/features/profile/domain/entities/user_profile.dart';
import 'package:newapp/features/profile/presentation/components/profile_avatar.dart';

/// Edit profile screen matching the Personal Info design.
class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({super.key});

  @override
  ConsumerState<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _lastNameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    final currentProfile = ref.read(currentUserProfileProvider);
    _nameController = TextEditingController(text: currentProfile?.firstName ?? '');
    _lastNameController = TextEditingController(text: currentProfile?.lastName ?? '');
    _emailController = TextEditingController(text: currentProfile?.email ?? '');
    _phoneController = TextEditingController(text: currentProfile?.phoneNumber ?? '');

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (currentProfile != null) {
        ref.read(editProfileStateProvider.notifier).initialize(currentProfile);
      }
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentProfile = ref.watch(currentUserProfileProvider) ?? UserProfile.empty();
    final editState = ref.watch(editProfileStateProvider);
    final isSaving = editState is EditProfileSaving;

    ref.listen<EditProfileState>(editProfileStateProvider, (previous, next) {
      if (next is EditProfileSaved) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Profile updated successfully')),
        );
        context.pop();
      } else if (next is EditProfileError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.failure.toUserMessage())),
        );
      }
    });

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.textPrimary,
            size: 24.sp,
          ),
        ),
        title: Text(
          'Personal Info',
          style: AppTypography.titleLarge.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              // Edit mode toggle or additional options
            },
            icon: Icon(
              Icons.edit_outlined,
              color: AppColors.textSecondary,
              size: 22.sp,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 24.h),

                  // Profile header with avatar
                  _buildProfileHeader(currentProfile),

                  SizedBox(height: 32.h),

                  // Name field
                  _buildFormField(
                    label: 'Name',
                    controller: _nameController,
                    enabled: !isSaving,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Name is required';
                      }
                      if (value.length < 2) {
                        return 'Name must be at least 2 characters';
                      }
                      return null;
                    },
                  ),

                  SizedBox(height: 20.h),

                  // Last name field
                  _buildFormField(
                    label: 'Last name',
                    controller: _lastNameController,
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

                  SizedBox(height: 20.h),

                  // Email field
                  _buildFormField(
                    label: 'Email',
                    controller: _emailController,
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

                  SizedBox(height: 20.h),

                  // Phone number field (read-only)
                  _buildFormField(
                    label: 'Phone number',
                    controller: _phoneController,
                    enabled: false,
                    keyboardType: TextInputType.phone,
                  ),

                  SizedBox(height: 48.h),

                  // Save Changes button
                  SizedBox(
                    width: double.infinity,
                    height: 52.h,
                    child: OutlinedButton(
                      onPressed: isSaving ? null : _saveProfile,
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: AppColors.grey300),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(26.r),
                        ),
                      ),
                      child: isSaving
                          ? SizedBox(
                              width: 24.w,
                              height: 24.w,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: AppColors.textPrimary,
                              ),
                            )
                          : Text(
                              'Save Changes',
                              style: AppTypography.labelLarge.copyWith(
                                color: AppColors.textPrimary,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                    ),
                  ),

                  SizedBox(height: 32.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader(UserProfile profile) {
    return Row(
      children: [
        ProfileAvatar(
          initials: profile.initials,
          imageUrl: profile.profilePicture,
          size: 56.w,
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                profile.fullName.isNotEmpty ? profile.fullName : profile.username,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                '@${profile.username}',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFormField({
    required String label,
    required TextEditingController controller,
    bool enabled = true,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 8.h),
        TextFormField(
          controller: controller,
          enabled: enabled,
          keyboardType: keyboardType,
          validator: validator,
          style: TextStyle(
            fontSize: 14.sp,
            color: enabled ? AppColors.textSecondary : AppColors.textHint,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 12.h),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.grey200),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.grey200),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.primary),
            ),
            disabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.grey200),
            ),
            filled: false,
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
      firstName: _nameController.text.trim(),
      lastName: _lastNameController.text.trim(),
      email: _emailController.text.trim().isNotEmpty
          ? _emailController.text.trim()
          : null,
    );

    await ref.read(editProfileStateProvider.notifier).saveProfile(request);
  }
}
