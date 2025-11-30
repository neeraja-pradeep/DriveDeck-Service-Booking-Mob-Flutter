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
                error: (_, __) => Text(
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
                error: (_, __) => _buildLocationRow('Tap to set location'),
              ),
            ],
          ),
        ),

        // Notification icon
        IconButton(
          onPressed: () {
            // TODO: Navigate to notifications
          },
          icon: Badge(
            backgroundColor: AppColors.error,
            smallSize: 8.r,
            child: Icon(
              Icons.notifications_outlined,
              size: 28.sp,
              color: AppColors.textPrimary,
            ),
          ),
        ),
      ],
    );
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
