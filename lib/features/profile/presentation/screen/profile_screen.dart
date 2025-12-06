import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/theme/colors.dart';
import '../../../profile/application/providers/profile_providers.dart';
import '../../../profile/application/states/profile_state.dart';
import '../../../profile/domain/entities/user_profile.dart';

/// Profile screen widget.
class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    // Load profile data when screen initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(profileStateProvider.notifier).initialize();
    });
  }

  @override
  Widget build(BuildContext context) {
    final profileState = ref.watch(profileStateProvider);
    final currentProfile = ref.watch(currentUserProfileProvider);
    final isLoading = ref.watch(isProfileLoadingProvider);

    // Debug logging removed for production

    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await ref.read(profileStateProvider.notifier).refresh();
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Profile title
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.h),
                    child: Text(
                      'Profile',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),

                  // Profile header with avatar and name
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: isLoading
                        ? Row(
                            children: [
                              Container(
                                width: 60.w,
                                height: 60.w,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.grey200,
                                ),
                                child: const CircularProgressIndicator(),
                              ),
                              SizedBox(width: 16.w),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 20.h,
                                      width: 120.w,
                                      decoration: BoxDecoration(
                                        color: AppColors.grey200,
                                        borderRadius: BorderRadius.circular(
                                          4.r,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 8.h),
                                    Container(
                                      height: 16.h,
                                      width: 80.w,
                                      decoration: BoxDecoration(
                                        color: AppColors.grey200,
                                        borderRadius: BorderRadius.circular(
                                          4.r,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        : Row(
                            children: [
                              // Profile avatar
                              Container(
                                width: 60.w,
                                height: 60.w,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.grey200,
                                ),
                                child: ClipOval(
                                  child:
                                      currentProfile != null &&
                                          currentProfile.initials.isNotEmpty
                                      ? Center(
                                          child: Text(
                                            currentProfile.initials,
                                            style: TextStyle(
                                              fontSize: 24.sp,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.primary,
                                            ),
                                          ),
                                        )
                                      : Icon(
                                          Icons.person,
                                          size: 32.sp,
                                          color: AppColors.textSecondary,
                                        ),
                                ),
                              ),

                              SizedBox(width: 16.w),

                              // Name and username - with flexible sizing
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      _getDisplayName(currentProfile),
                                      style: TextStyle(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.textPrimary,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                    SizedBox(height: 4.h),
                                    Text(
                                      _getUsername(currentProfile),
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: AppColors.textSecondary,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(width: 12.w),

                              // Edit icon
                              GestureDetector(
                                onTap: () {
                                  // Navigate to edit profile
                                },
                                child: Container(
                                  padding: EdgeInsets.all(8.w),
                                  child: Icon(
                                    Icons.edit_outlined,
                                    size: 20.sp,
                                    color: AppColors.textSecondary,
                                  ),
                                ),
                              ),
                            ],
                          ),
                  ),

                  SizedBox(height: 32.h),

                  // Error handling
                  if (profileState.dataState is ProfileError)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Container(
                        padding: EdgeInsets.all(16.w),
                        decoration: BoxDecoration(
                          color: AppColors.error.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(
                            color: AppColors.error.withValues(alpha: 0.3),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.error_outline,
                              color: AppColors.error,
                              size: 20.sp,
                            ),
                            SizedBox(width: 8.w),
                            Expanded(
                              child: Text(
                                'Failed to load profile. Tap to retry.',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: AppColors.error,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                ref
                                    .read(profileStateProvider.notifier)
                                    .initialize();
                              },
                              child: Icon(
                                Icons.refresh,
                                color: AppColors.error,
                                size: 20.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                  if (profileState.dataState is ProfileError)
                    SizedBox(height: 16.h),

                  // Menu items with dividers
                  Container(
                    width: double.infinity,
                    child: Column(
                      children: [
                        _buildMenuItem(
                          imagePath: 'assets/Wallet.png',
                          title: 'My Garage',
                          onTap: () {},
                        ),
                        _buildDivider(),

                        _buildMenuItem(
                          imagePath: 'assets/Membership.png',
                          title: 'Membership',
                          onTap: () {},
                        ),
                        _buildDivider(),

                        _buildMenuItem(
                          imagePath: 'assets/History.png',
                          title: 'History',
                          onTap: () {},
                        ),
                        _buildDivider(),

                        _buildMenuItem(
                          imagePath: 'assets/Settings.png',
                          title: 'Settings',
                          onTap: () {},
                        ),
                        _buildDivider(),

                        _buildMenuItem(
                          imagePath: 'assets/Help.png',
                          title: 'Help and Support',
                          onTap: () {},
                        ),

                        SizedBox(height: 60.h),

                        // Logout button
                        GestureDetector(
                          onTap: () {
                            _showLogoutDialog(context);
                          },
                          child: Text(
                            'Logout',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.error,
                            ),
                          ),
                        ),

                        SizedBox(height: 40.h),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String _getDisplayName(UserProfile? profile) {
    if (profile == null) return 'Loading...';

    // Use the fullName getter from UserProfile entity
    if (profile.fullName.isNotEmpty && profile.fullName != profile.username) {
      return profile.fullName;
    }

    // Fall back to username
    if (profile.username.isNotEmpty) {
      return profile.username;
    }

    // Fall back to phone number
    if (profile.phoneNumber.isNotEmpty) {
      return profile.phoneNumber;
    }

    return 'User';
  }

  String _getUsername(UserProfile? profile) {
    if (profile == null) return '';

    // Show username if available
    if (profile.username.isNotEmpty) {
      return '@${profile.username}';
    }

    // Show phone number as fallback
    if (profile.phoneNumber.isNotEmpty) {
      return profile.phoneNumber;
    }

    return '';
  }

  Widget _buildMenuItem({
    required String imagePath,
    required String title,
    required VoidCallback onTap,
  }) {
    // Map image paths to appropriate icons as fallback
    IconData getIconForPath(String path) {
      if (path.contains('Wallet') || path.contains('Garage')) {
        return Icons.garage_outlined;
      } else if (path.contains('Membership')) {
        return Icons.card_membership_outlined;
      } else if (path.contains('History')) {
        return Icons.history_outlined;
      } else if (path.contains('Settings')) {
        return Icons.settings_outlined;
      } else if (path.contains('Help')) {
        return Icons.help_outline;
      }
      return Icons.image_not_supported;
    }

    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 18.h),
        child: Row(
          children: [
            Container(
              width: 24.w,
              height: 24.h,
              child: Icon(
                getIconForPath(imagePath),
                size: 24.sp,
                color: AppColors.textSecondary,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textPrimary,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      width: double.infinity,
      height: 1.h,
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      color: AppColors.divider,
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Perform logout
                ref.read(profileStateProvider.notifier).logout();
              },
              child: const Text(
                'Logout',
                style: TextStyle(color: AppColors.error),
              ),
            ),
          ],
        );
      },
    );
  }
}
