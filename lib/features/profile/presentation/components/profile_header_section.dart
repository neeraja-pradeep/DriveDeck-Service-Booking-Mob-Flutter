import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newapp/app/theme/colors.dart';
import 'package:newapp/app/theme/typography.dart';
import 'package:newapp/features/profile/domain/entities/user_profile.dart';
import 'package:newapp/features/profile/presentation/components/profile_avatar.dart';

/// Profile header section with avatar and user info.
class ProfileHeaderSection extends StatelessWidget {
  const ProfileHeaderSection({
    required this.profile,
    super.key,
  });

  final UserProfile profile;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          ProfileAvatar(
            imageUrl: null,
            initials: profile.initials,
            size: 80.w,
            showEditBadge: true,
          ),
          SizedBox(height: 16.h),
          Text(
            profile.fullName,
            style: AppTypography.titleLarge.copyWith(
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 4.h),
          Text(
            profile.phoneNumber,
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          if (profile.email != null && profile.email!.isNotEmpty) ...[
            SizedBox(height: 4.h),
            Text(
              profile.email!,
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
