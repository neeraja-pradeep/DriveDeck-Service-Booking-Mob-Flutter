import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/booking.dart';
import '../../domain/entities/booking_status.dart';
import '../components/booking_status_badge.dart';
import 'cancel_booking_dialog.dart';

/// Bottom sheet displaying detailed booking information.
class BookingDetailBottomSheet extends ConsumerWidget {
  /// Creates a new [BookingDetailBottomSheet].
  const BookingDetailBottomSheet({
    required this.booking,
    super.key,
  });

  /// The booking to display.
  final Booking booking;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.5,
      maxChildSize: 0.9,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
          ),
          child: Column(
            children: [
              // Handle bar
              Container(
                margin: EdgeInsets.symmetric(vertical: 12.h),
                width: 40.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
              // Content
              Expanded(
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Shop image and info
                      _ShopHeader(booking: booking),
                      SizedBox(height: 20.h),
                      // Booking details
                      _BookingInfoSection(booking: booking),
                      SizedBox(height: 20.h),
                      // Services
                      _ServicesSection(booking: booking),
                      SizedBox(height: 20.h),
                      // Price summary
                      _PriceSummarySection(booking: booking),
                      SizedBox(height: 24.h),
                      // Action buttons
                      if (booking.isUpcoming) _ActionButtons(booking: booking),
                      SizedBox(height: 24.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

/// Header section with shop image and name.
class _ShopHeader extends StatelessWidget {
  const _ShopHeader({required this.booking});

  final Booking booking;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: SizedBox(
            width: 80.w,
            height: 80.h,
            child: CachedNetworkImage(
              imageUrl: booking.shopImageUrl,
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
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                booking.shopName,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 4.h),
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 14.sp,
                    color: Colors.grey.shade600,
                  ),
                  SizedBox(width: 4.w),
                  Expanded(
                    child: Text(
                      booking.fullLocation,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey.shade600,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              BookingStatusBadge(status: booking.status),
            ],
          ),
        ),
      ],
    );
  }
}

/// Section displaying booking information.
class _BookingInfoSection extends StatelessWidget {
  const _BookingInfoSection({required this.booking});

  final Booking booking;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Booking Details',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 12.h),
        _DetailRow(
          label: 'Reference',
          value: booking.bookingReference,
          canCopy: true,
        ),
        SizedBox(height: 8.h),
        _DetailRow(
          label: 'Date',
          value: DateFormat('EEEE, d MMMM yyyy').format(booking.bookingDate),
        ),
        SizedBox(height: 8.h),
        _DetailRow(
          label: 'Time',
          value: booking.timeSlot.displayTime,
        ),
        SizedBox(height: 8.h),
        _DetailRow(
          label: 'Vehicle Type',
          value: booking.vehicleType.displayName,
        ),
        SizedBox(height: 8.h),
        _DetailRow(
          label: 'Pickup & Delivery',
          value: booking.pickupAndDelivery ? 'Yes' : 'No',
        ),
      ],
    );
  }
}

/// Single detail row.
class _DetailRow extends StatelessWidget {
  const _DetailRow({
    required this.label,
    required this.value,
    this.canCopy = false,
  });

  final String label;
  final String value;
  final bool canCopy;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.grey.shade600,
          ),
        ),
        Row(
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            if (canCopy) ...[
              SizedBox(width: 8.w),
              GestureDetector(
                onTap: () {
                  Clipboard.setData(ClipboardData(text: value));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Copied to clipboard',
                        style: TextStyle(fontSize: 14.sp),
                      ),
                      behavior: SnackBarBehavior.floating,
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
                child: Icon(
                  Icons.copy,
                  size: 16.sp,
                  color: Colors.grey.shade500,
                ),
              ),
            ],
          ],
        ),
      ],
    );
  }
}

/// Section displaying booked services.
class _ServicesSection extends StatelessWidget {
  const _ServicesSection({required this.booking});

  final Booking booking;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Services',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 12.h),
        ...booking.services.map(
          (service) => Padding(
            padding: EdgeInsets.only(bottom: 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        service.name,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.black87,
                        ),
                      ),
                      Text(
                        service.formattedDuration,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  service.formattedPrice,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// Section displaying price summary.
class _PriceSummarySection extends StatelessWidget {
  const _PriceSummarySection({required this.booking});

  final Booking booking;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              Text(
                booking.formattedTotalAmount,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFFFB74D),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Action buttons for the booking.
class _ActionButtons extends StatelessWidget {
  const _ActionButtons({required this.booking});

  final Booking booking;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () => _showCancelDialog(context),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.red,
              side: const BorderSide(color: Colors.red),
              padding: EdgeInsets.symmetric(vertical: 12.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            child: Text(
              'Cancel Booking',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: ElevatedButton(
            onPressed: () => _showComingSoon(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFFB74D),
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 12.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              elevation: 0,
            ),
            child: Text(
              'Contact Shop',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showCancelDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (context) => CancelBookingDialog(
        booking: booking,
        onConfirm: () {
          Navigator.pop(context); // Close dialog
          Navigator.pop(context); // Close bottom sheet
        },
        onCancel: () => Navigator.pop(context),
      ),
    );
  }

  void _showComingSoon(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Contact shop coming soon',
          style: TextStyle(fontSize: 14.sp),
        ),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
