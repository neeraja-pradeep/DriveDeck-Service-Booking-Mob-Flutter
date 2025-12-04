import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Search bar for the bookings screen.
///
/// Currently a static placeholder - search functionality to be implemented.
class BookingsSearchBar extends StatelessWidget {
  /// Creates a new [BookingsSearchBar].
  const BookingsSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showComingSoon(context),
      child: Container(
        height: 48.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: Colors.grey.shade200,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Icon(
              Icons.search,
              color: Colors.grey.shade500,
              size: 22.sp,
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                'Search bookings...',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey.shade500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showComingSoon(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Search coming soon',
          style: TextStyle(fontSize: 14.sp),
        ),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
