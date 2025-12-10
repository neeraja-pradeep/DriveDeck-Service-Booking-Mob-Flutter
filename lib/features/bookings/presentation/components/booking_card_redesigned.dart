import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../app/theme/colors.dart';
import '../../domain/entities/booking.dart';

/// Redesigned booking card component matching the UI design.
class BookingCardRedesigned extends StatelessWidget {
  const BookingCardRedesigned({
    required this.booking,
    required this.onTap,
    super.key,
  });

  final Booking booking;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.08),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(12.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Shop Image
              Container(
                width: 100.w,
                height: 100.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: Colors.grey.shade200,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: CachedNetworkImage(
                    imageUrl: booking.shopImageUrl,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      color: Colors.grey.shade200,
                      child: Icon(
                        Icons.local_car_wash,
                        color: Colors.grey.shade400,
                        size: 32.sp,
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      color: Colors.grey.shade200,
                      child: Icon(
                        Icons.local_car_wash,
                        color: Colors.grey.shade400,
                        size: 32.sp,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(width: 12.w),

              // Booking Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Shop Name and Rating
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            booking.shopName,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        // Rating
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 16.sp),
                            SizedBox(width: 2.w),
                            Text(
                              '4.7',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(height: 4.h),

                    // Location
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.grey.shade500,
                          size: 14.sp,
                        ),
                        SizedBox(width: 4.w),
                        Expanded(
                          child: Text(
                            booking.fullLocation,
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.grey.shade600,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 6.h),

                    // Pickup & Delivery Badge
                    if (booking.pickupAndDelivery) ...[
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primaryLight,
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        child: Text(
                          'Pickup & Delivery',
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                      SizedBox(height: 8.h),
                    ],

                    // Booking Details
                    _buildDetailRow(
                      icon: Icons.calendar_today_outlined,
                      label: 'Dates',
                      value: _formatDate(booking.bookingDate),
                    ),
                    SizedBox(height: 4.h),
                    _buildDetailRow(
                      icon: Icons.person_outline,
                      label: 'Service',
                      value: booking.primaryServiceName,
                    ),
                    SizedBox(height: 4.h),
                    _buildDetailRow(
                      icon: Icons.phone_outlined,
                      label: 'Contacts',
                      value: '+91 6525 65 45 45',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey.shade500, size: 14.sp),
        SizedBox(width: 6.w),
        Text(
          label,
          style: TextStyle(
            fontSize: 12.sp,
            color: Colors.grey.shade600,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.right,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  String _formatDate(DateTime date) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
    ];
    return '${date.day} ${months[date.month - 1]} ${date.year}';
  }
}
