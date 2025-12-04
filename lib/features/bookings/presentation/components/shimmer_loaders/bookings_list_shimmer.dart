import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'booking_card_shimmer.dart';

/// Shimmer loading placeholder for the bookings list.
class BookingsListShimmer extends StatelessWidget {
  /// Creates a new [BookingsListShimmer].
  const BookingsListShimmer({
    this.itemCount = 4,
    super.key,
  });

  /// Number of shimmer cards to display.
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: itemCount,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(bottom: 12.h),
        child: const BookingCardShimmer(),
      ),
    );
  }
}
