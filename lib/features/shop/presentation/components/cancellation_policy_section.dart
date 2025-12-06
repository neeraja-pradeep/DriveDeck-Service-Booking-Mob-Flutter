import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Static section displaying cancellation policy.
class CancellationPolicySection extends StatelessWidget {
  const CancellationPolicySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.orange.withOpacity(0.05),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: Colors.orange.withOpacity(0.2),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.info_outline,
                  size: 20.sp,
                  color: Colors.orange[700],
                ),
                SizedBox(width: 8.w),
                Text(
                  'Cancellation Policy',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.orange[700],
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Text(
              'In line with the company Cancellation Policy. Cancellation within 24 hours may incur charges up to 50% of the service value.',
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.grey[700],
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
