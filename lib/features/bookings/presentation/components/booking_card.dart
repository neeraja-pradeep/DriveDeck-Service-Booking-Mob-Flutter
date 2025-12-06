import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/booking.dart';
import '../../domain/entities/booking_status.dart';
import 'booking_status_badge.dart';

/// Card displaying a booking summary.
///
/// Shows shop image, name, location, date, and service information.
class BookingCard extends StatelessWidget {
  /// Creates a new [BookingCard].
  const BookingCard({
    required this.booking,
    required this.onTap,
    super.key,
  });

  /// The booking to display.
  final Booking booking;

  /// Callback when the card is tapped.
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: Colors.grey.shade200,
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Shop image
            _ShopImage(imageUrl: booking.shopImageUrl),
            SizedBox(width: 12.w),
            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Shop name and status
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
                      if (booking.status != BookingStatus.confirmed) ...[
                        SizedBox(width: 8.w),
                        BookingStatusBadge(status: booking.status),
                      ],
                    ],
                  ),
                  SizedBox(height: 6.h),
                  // Location
                  _InfoRow(
                    icon: Icons.location_on_outlined,
                    text: booking.fullLocation,
                  ),
                  SizedBox(height: 4.h),
                  // Date
                  _InfoRow(
                    icon: Icons.calendar_today_outlined,
                    text: _formatDate(booking.bookingDate),
                  ),
                  SizedBox(height: 4.h),
                  // Time
                  _InfoRow(
                    icon: Icons.access_time_outlined,
                    text: booking.timeSlot.displayTime,
                  ),
                  SizedBox(height: 4.h),
                  // Service
                  _InfoRow(
                    icon: Icons.local_car_wash_outlined,
                    text: booking.primaryServiceName,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return DateFormat('EEE, d MMM yyyy').format(date);
  }
}

/// Shop image with placeholder and error handling.
class _ShopImage extends StatelessWidget {
  const _ShopImage({required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.r),
      child: SizedBox(
        width: 80.w,
        height: 80.h,
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          placeholder: (context, url) => Container(
            color: Colors.grey.shade200,
            child: Icon(
              Icons.local_car_wash,
              size: 32.sp,
              color: Colors.grey.shade400,
            ),
          ),
          errorWidget: (context, url, error) => Container(
            color: Colors.grey.shade200,
            child: Icon(
              Icons.local_car_wash,
              size: 32.sp,
              color: Colors.grey.shade400,
            ),
          ),
        ),
      ),
    );
  }
}

/// Info row with icon and text.
class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 14.sp,
          color: Colors.grey.shade500,
        ),
        SizedBox(width: 6.w),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.grey.shade600,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
