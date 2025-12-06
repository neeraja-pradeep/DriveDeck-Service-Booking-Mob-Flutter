import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/booking_status.dart';

/// Badge displaying the booking status.
///
/// Uses different colors based on the status type.
class BookingStatusBadge extends StatelessWidget {
  /// Creates a new [BookingStatusBadge].
  const BookingStatusBadge({
    required this.status,
    super.key,
  });

  /// The booking status to display.
  final BookingStatus status;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8.w,
        vertical: 4.h,
      ),
      decoration: BoxDecoration(
        color: _backgroundColor,
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Text(
        status.displayName,
        style: TextStyle(
          fontSize: 10.sp,
          fontWeight: FontWeight.w600,
          color: _textColor,
        ),
      ),
    );
  }

  Color get _backgroundColor => switch (status) {
        BookingStatus.pending => const Color(0xFFFFF3E0),
        BookingStatus.confirmed => const Color(0xFFE8F5E9),
        BookingStatus.inProgress => const Color(0xFFE3F2FD),
        BookingStatus.completed => const Color(0xFFE8F5E9),
        BookingStatus.cancelled => const Color(0xFFFFEBEE),
        BookingStatus.noShow => const Color(0xFFEFEBE9),
      };

  Color get _textColor => switch (status) {
        BookingStatus.pending => const Color(0xFFE65100),
        BookingStatus.confirmed => const Color(0xFF2E7D32),
        BookingStatus.inProgress => const Color(0xFF1565C0),
        BookingStatus.completed => const Color(0xFF2E7D32),
        BookingStatus.cancelled => const Color(0xFFC62828),
        BookingStatus.noShow => const Color(0xFF5D4037),
      };
}
