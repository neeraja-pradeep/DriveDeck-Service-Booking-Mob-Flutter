import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/error/failure.dart';
import '../../application/providers/bookings_providers.dart';
import '../../application/states/bookings_list_state.dart';
import '../../application/states/bookings_state.dart';
import '../../domain/entities/booking.dart';
import '../dialogs/booking_detail_bottom_sheet.dart';
import 'booking_card.dart';
import 'bookings_empty_state.dart';
import 'shimmer_loaders/bookings_list_shimmer.dart';

/// Section displaying the list of bookings.
///
/// Handles loading, error, empty, and loaded states.
class BookingsListSection extends ConsumerWidget {
  /// Creates a new [BookingsListSection].
  const BookingsListSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(bookingsStateProvider);
    final listState = state.listState;

    return switch (listState) {
      BookingsListStateInitial() => const BookingsListShimmer(),
      BookingsListStateLoading() => const BookingsListShimmer(),
      BookingsListStateLoaded(:final bookings) => _buildLoadedState(
        context,
        ref,
        state.currentTabBookings,
        state.selectedTab,
      ),
      BookingsListStateRefreshing(:final currentBookings) => _buildLoadedState(
        context,
        ref,
        state.currentTabBookings,
        state.selectedTab,
        isRefreshing: true,
      ),
      BookingsListStateError(:final failure) => _buildErrorState(
        context,
        ref,
        failure.userMessage,
      ),
    };
  }

  Widget _buildLoadedState(
    BuildContext context,
    WidgetRef ref,
    List<Booking> bookings,
    dynamic selectedTab, {
    bool isRefreshing = false,
  }) {
    if (bookings.isEmpty) {
      return BookingsEmptyState(tab: selectedTab);
    }

    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      itemCount: bookings.length,
      itemBuilder: (context, index) {
        final booking = bookings[index];
        return Padding(
          padding: EdgeInsets.only(bottom: 12.h),
          child: BookingCard(
            booking: booking,
            onTap: () => _showBookingDetail(context, booking),
          ),
        );
      },
    );
  }

  Widget _buildErrorState(BuildContext context, WidgetRef ref, String message) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 64.sp, color: Colors.grey.shade400),
            SizedBox(height: 16.h),
            Text(
              'Something went wrong',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              message,
              style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade600),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24.h),
            ElevatedButton(
              onPressed: () {
                ref.read(bookingsStateProvider.notifier).refresh();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFB74D),
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 12.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              child: Text(
                'Retry',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showBookingDetail(BuildContext context, Booking booking) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => BookingDetailBottomSheet(booking: booking),
    );
  }
}
