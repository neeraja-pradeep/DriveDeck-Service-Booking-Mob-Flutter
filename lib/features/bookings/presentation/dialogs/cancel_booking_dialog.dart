import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../application/providers/bookings_providers.dart';
import '../../application/states/booking_detail_state.dart';
import '../../domain/entities/booking.dart';

/// Dialog for confirming booking cancellation.
class CancelBookingDialog extends ConsumerStatefulWidget {
  /// Creates a new [CancelBookingDialog].
  const CancelBookingDialog({
    required this.booking,
    required this.onConfirm,
    required this.onCancel,
    super.key,
  });

  /// The booking to cancel.
  final Booking booking;

  /// Callback when cancellation is confirmed.
  final VoidCallback onConfirm;

  /// Callback when cancellation is cancelled.
  final VoidCallback onCancel;

  @override
  ConsumerState<CancelBookingDialog> createState() =>
      _CancelBookingDialogState();
}

class _CancelBookingDialogState extends ConsumerState<CancelBookingDialog> {
  bool _isCancelling = false;

  @override
  Widget build(BuildContext context) {
    // Listen to booking detail state for cancellation progress
    ref.listen<BookingDetailState>(
      bookingDetailStateProvider(widget.booking.id),
      (previous, next) {
        if (next is BookingDetailStateCancelled) {
          widget.onConfirm();
        } else if (next is BookingDetailStateError) {
          setState(() => _isCancelling = false);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                next.failure.userMessage,
                style: TextStyle(fontSize: 14.sp),
              ),
              backgroundColor: Colors.red,
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      },
    );

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icon
            Container(
              width: 64.w,
              height: 64.h,
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.warning_amber_rounded,
                size: 32.sp,
                color: Colors.red,
              ),
            ),
            SizedBox(height: 16.h),
            // Title
            Text(
              'Cancel Booking?',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 12.h),
            // Content
            Text(
              'Are you sure you want to cancel your booking at ${widget.booking.shopName}?',
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey.shade600,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.h),
            // Booking summary
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    size: 16.sp,
                    color: Colors.grey.shade600,
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Text(
                      '${DateFormat('EEE, d MMM').format(widget.booking.bookingDate)} • ${widget.booking.timeSlot.displayTime}',
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            // Actions
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: _isCancelling ? null : widget.onCancel,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.black87,
                      side: BorderSide(color: Colors.grey.shade300),
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    child: Text(
                      'Keep Booking',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _isCancelling ? null : _handleCancel,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      elevation: 0,
                    ),
                    child: _isCancelling
                        ? SizedBox(
                            width: 20.w,
                            height: 20.h,
                            child: const CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          )
                        : Text(
                            'Cancel Booking',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _handleCancel() async {
    setState(() => _isCancelling = true);
    await ref
        .read(bookingDetailStateProvider(widget.booking.id).notifier)
        .cancelBooking();
  }
}
