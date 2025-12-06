import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/bookings_tab.dart';

/// Empty state widget for when there are no bookings.
///
/// Shows different content based on the selected tab.
class BookingsEmptyState extends StatelessWidget {
  /// Creates a new [BookingsEmptyState].
  const BookingsEmptyState({
    required this.tab,
    this.onAction,
    super.key,
  });

  /// The current tab.
  final BookingsTab tab;

  /// Callback for the action button (optional).
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(32.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Illustration
            Container(
              width: 120.w,
              height: 120.h,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                shape: BoxShape.circle,
              ),
              child: Icon(
                tab == BookingsTab.booked
                    ? Icons.calendar_today_outlined
                    : Icons.history_outlined,
                size: 56.sp,
                color: Colors.grey.shade400,
              ),
            ),
            SizedBox(height: 24.h),
            // Title
            Text(
              tab == BookingsTab.booked
                  ? 'No upcoming bookings'
                  : 'No booking history',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.h),
            // Subtitle
            Text(
              tab == BookingsTab.booked
                  ? 'Book a car wash service to see your appointments here'
                  : 'Your completed bookings will appear here',
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey.shade600,
              ),
              textAlign: TextAlign.center,
            ),
            if (tab == BookingsTab.booked) ...[
              SizedBox(height: 24.h),
              // Action button
              ElevatedButton(
                onPressed: onAction ?? () => _navigateToHome(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFB74D),
                  foregroundColor: Colors.white,
                  minimumSize: Size(200.w, 48.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Browse Services',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  void _navigateToHome(BuildContext context) {
    // Navigate to home/shop listing
    // This would typically use the router to navigate
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Navigate to services',
          style: TextStyle(fontSize: 14.sp),
        ),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
