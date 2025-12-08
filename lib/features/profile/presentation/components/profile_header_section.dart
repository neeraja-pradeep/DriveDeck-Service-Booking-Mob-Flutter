import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:newapp/app/theme/colors.dart';
import 'package:newapp/features/profile/domain/entities/user_profile.dart';
import 'package:newapp/features/profile/presentation/components/profile_avatar.dart';
import 'package:newapp/features/profile/application/providers/profile_providers.dart';

/// Profile header section displaying avatar, name, and edit button.
///
/// This component is responsible for displaying:
/// - Profile avatar with initials or fallback icon
/// - Full name
/// - Username or phone number as secondary text
/// - Edit icon for profile editing (future navigation)
///
/// It watches the [currentUserProfileProvider] to automatically update when
/// the user profile changes.
class ProfileHeaderSection extends ConsumerWidget {
  const ProfileHeaderSection({this.isLoading = false, super.key});

  /// Whether the profile data is currently loading.
  final bool isLoading;

  /// Get display name from profile, with fallbacks.
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

  /// Get username display, with fallbacks.
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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentProfile = ref.watch(currentUserProfileProvider);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: isLoading
          ? _buildLoadingSkeleton()
          : Row(
              children: [
                // Profile avatar
                ProfileAvatar(
                  initials: currentProfile?.initials ?? '?',
                  imageUrl: currentProfile?.profilePicture,
                  size: 60.w,
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

                // Edit icon - navigates to edit profile screen
                GestureDetector(
                  onTap: () {
                    context.push('/edit-profile');
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
    );
  }

  /// Build loading skeleton while data is fetching.
  Widget _buildLoadingSkeleton() {
    return Row(
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
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
              SizedBox(height: 8.h),
              Container(
                height: 16.h,
                width: 80.w,
                decoration: BoxDecoration(
                  color: AppColors.grey200,
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
