import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newapp/app/theme/colors.dart';
import 'package:newapp/features/profile/domain/entities/profile_menu_item.dart';

/// Profile menu item tile widget using Image Assets.
class ProfileMenuItemTile extends StatelessWidget {
  const ProfileMenuItemTile({
    required this.item,
    required this.imagePath, // Added image path
    required this.onTap,
    super.key,
  });

  final ProfileMenuItem item;
  final String imagePath;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    // Determine text color based on destructive state (e.g. Logout)
    final textColor = item.isDestructive
        ? AppColors.error
        : AppColors.textPrimary;

    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 18.h),
        child: Row(
          children: [
            // Image Container
            Container(
              width: 24.w,
              height: 24.h,
              child: Image.asset(
                imagePath,
                width: 24.sp,
                height: 24.sp,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(width: 16.w),
            // Title Text
            Expanded(
              child: Text(
                item.title,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: textColor,
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
}
