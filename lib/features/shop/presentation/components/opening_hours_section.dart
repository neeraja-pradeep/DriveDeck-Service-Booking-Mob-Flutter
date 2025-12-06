import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/opening_hours.dart';

/// Section displaying shop opening hours.
class OpeningHoursSection extends StatelessWidget {
  final OpeningHours hours;

  const OpeningHoursSection({
    super.key,
    required this.hours,
  });

  @override
  Widget build(BuildContext context) {
    final isOpen = hours.isOpenNow();
    final todayHours = hours.getTodayHours();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Open Hours',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 8.h),
          Row(
            children: [
              Icon(
                Icons.access_time,
                size: 18.sp,
                color: Colors.grey[600],
              ),
              SizedBox(width: 8.w),
              Text(
                todayHours,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                'Monday to Sunday',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: 6.h,
            ),
            decoration: BoxDecoration(
              color: isOpen
                  ? Colors.green.withOpacity(0.1)
                  : Colors.red.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Text(
              isOpen ? '4 Hours minimum' : 'Currently Closed',
              style: TextStyle(
                fontSize: 12.sp,
                color: isOpen ? Colors.green[700] : Colors.red[700],
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
