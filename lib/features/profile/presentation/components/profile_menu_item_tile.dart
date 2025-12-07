import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newapp/app/theme/colors.dart';
import 'package:newapp/app/theme/typography.dart';
import 'package:newapp/features/profile/domain/entities/profile_menu_item.dart';

/// Profile menu item tile widget.
class ProfileMenuItemTile extends StatelessWidget {
  const ProfileMenuItemTile({
    required this.item,
    required this.onTap,
    super.key,
  });

  final ProfileMenuItem item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isDestructive = item.isDestructive;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 16.h,
        ),
        child: Row(
          children: [
            Container(
              width: 40.w,
              height: 40.w,
              decoration: BoxDecoration(
                color: isDestructive
                    ? AppColors.error.withValues(alpha: 0.1)
                    : AppColors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Icon(
                item.icon,
                size: 20.w,
                color: isDestructive ? AppColors.error : AppColors.primary,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                item.title,
                style: AppTypography.bodyLarge.copyWith(
                  color:
                      isDestructive ? AppColors.error : AppColors.textPrimary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Icon(
              Icons.chevron_right,
              size: 24.w,
              color: isDestructive ? AppColors.error : AppColors.grey400,
            ),
          ],
        ),
      ),
    );
  }
}
