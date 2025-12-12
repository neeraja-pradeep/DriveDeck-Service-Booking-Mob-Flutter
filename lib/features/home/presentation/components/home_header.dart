import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/theme/colors.dart';
import '../../../../app/theme/typography.dart';
import '../../../../core/utils/date_utils.dart';
import '../../application/providers/home_provider.dart';
import 'shimmer_widgets.dart';

/// Header widget displaying greeting, user name, and location.
class HomeHeader extends ConsumerWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileState = ref.watch(userProfileProvider);
    final locationState = ref.watch(userLocationProvider);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Profile image
        profileState.when(
          data: (profile) => _buildProfileImage(profile?.profilePicture),
          loading: () => _buildProfileImageShimmer(),
          error: (_, _) => _buildProfileImage(null),
        ),

        SizedBox(width: 12.w),

        // Greeting and location
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Greeting
              profileState.when(
                data: (profile) => Text(
                  '${AppDateUtils.getGreeting()}, ${profile?.displayName ?? 'Guest'}',
                  style: AppTypography.greeting,
                ),
                loading: () => ShimmerWidgets.text(width: 180.w, height: 24.h),
                error: (_, _) => Text(
                  '${AppDateUtils.getGreeting()}, Guest',
                  style: AppTypography.greeting,
                ),
              ),

              SizedBox(height: 4.h),

              // Location
              locationState.when(
                data: (location) => _buildLocationRow(
                  location?.shortAddress ?? 'Set your location',
                ),
                loading: () => ShimmerWidgets.text(width: 140.w, height: 16.h),
                error: (_, _) => _buildLocationRow('Tap to set location'),
              ),
            ],
          ),
        ),

        // Car wash icon
        GestureDetector(
          onTap: () {
            // TODO: Navigate to car wash services
          },
          child: Container(
            width: 40.w,
            height: 40.w,
            padding: EdgeInsets.all(8.w),

            child: Image.asset(
              'assets/icons/car.png',
              width: 24.w,
              height: 24.w,
              color: Colors.black,
              errorBuilder: (context, error, stackTrace) {
                // Fallback to icon if image not found
                return Icon(
                  Icons.local_car_wash,
                  size: 24.sp,
                  color: Colors.white,
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProfileImage(String? profileImageUrl) {
    return GestureDetector(
      onTap: () {
        // TODO: Navigate to profile
      },
      child: Container(
        width: 48.w,
        height: 48.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.grey200, width: 1.5),
        ),
        child: ClipOval(
          child: profileImageUrl != null && profileImageUrl.isNotEmpty
              ? Image.network(
                  profileImageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return _buildDefaultAvatar();
                  },
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return _buildDefaultAvatar();
                  },
                )
              : _buildDefaultAvatar(),
        ),
      ),
    );
  }

  Widget _buildDefaultAvatar() {
    return Container(
      color: AppColors.grey100,
      child: Icon(Icons.person, size: 24.sp, color: AppColors.grey400),
    );
  }

  Widget _buildProfileImageShimmer() {
    return ShimmerWidgets.avatar(size: 48);
  }

  Widget _buildLocationRow(String location) {
    return InkWell(
      onTap: () {
        // TODO: Open location picker
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.location_on_outlined,
            size: 16.sp,
            color: AppColors.primary,
          ),
          SizedBox(width: 4.w),
          Flexible(
            child: Text(
              location,
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.textSecondary,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Icon(
            Icons.keyboard_arrow_down,
            size: 16.sp,
            color: AppColors.textSecondary,
          ),
        ],
      ),
    );
  }
}
