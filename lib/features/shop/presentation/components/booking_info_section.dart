import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/booking_summary.dart';

/// Section displaying booking info in checkout.
class BookingInfoSection extends StatelessWidget {
  final BookingSummary summary;

  const BookingInfoSection({
    super.key,
    required this.summary,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your Booking',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF1E88E5),
            ),
          ),
          SizedBox(height: 16.h),

          // Date
          _buildInfoRow(
            icon: Icons.calendar_today_outlined,
            label: 'Dates',
            value: DateFormat('d MMM yyyy').format(summary.date),
          ),
          SizedBox(height: 12.h),

          // Time slot
          _buildInfoRow(
            icon: Icons.access_time,
            label: 'Slot',
            value: summary.formattedTimeSlot,
          ),
          SizedBox(height: 12.h),

          // Service type
          _buildInfoRow(
            icon: Icons.directions_car_outlined,
            label: 'Service type',
            value: summary.vehicleType.displayName,
          ),
          SizedBox(height: 12.h),

          // Phone (static placeholder)
          _buildInfoRow(
            icon: Icons.phone_outlined,
            label: 'Phone',
            value: '0214345646',
          ),

          // Pickup & Delivery badge
          if (summary.pickupAndDelivery) ...[
            SizedBox(height: 12.h),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 6.h,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFF1E88E5).withOpacity(0.1),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.local_shipping_outlined,
                    size: 14.sp,
                    color: const Color(0xFF1E88E5),
                  ),
                  SizedBox(width: 6.w),
                  Text(
                    'Pickup & Delivery',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: const Color(0xFF1E88E5),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          size: 18.sp,
          color: Colors.grey[500],
        ),
        SizedBox(width: 12.w),
        SizedBox(
          width: 100.w,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey[600],
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}
