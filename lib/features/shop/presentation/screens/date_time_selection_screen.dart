import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../application/providers/shop_providers.dart';
import '../components/calendar_section.dart';
import '../components/cancellation_policy_section.dart';
import '../components/next_floating_button.dart';
import '../components/pickup_delivery_toggle.dart';
import '../components/time_slots_section.dart';

/// Screen for selecting date and time for booking.
class DateTimeSelectionScreen extends ConsumerStatefulWidget {
  final String shopId;

  const DateTimeSelectionScreen({
    super.key,
    required this.shopId,
  });

  @override
  ConsumerState<DateTimeSelectionScreen> createState() =>
      _DateTimeSelectionScreenState();
}

class _DateTimeSelectionScreenState
    extends ConsumerState<DateTimeSelectionScreen> {
  @override
  void initState() {
    super.initState();
    // Initialize the booking date notifier
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(bookingDateStateProvider.notifier).initialize(widget.shopId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final dateState = ref.watch(bookingDateStateProvider);

    final canProceed = dateState.maybeMap(
      loaded: (s) => s.selectedSlot != null,
      orElse: () => false,
    );

    final selectedDate = dateState.maybeMap(
      loaded: (s) => s.selectedDate,
      orElse: () => DateTime.now(),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // App bar
            _buildAppBar(context),

            // Content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16.h),

                    // Calendar
                    CalendarSection(
                      selectedDate: selectedDate,
                      onDateSelected: (date) {
                        ref.read(bookingDateStateProvider.notifier).selectDate(date);
                      },
                    ),
                    SizedBox(height: 24.h),

                    // Time slots
                    const TimeSlotsSection(),
                    SizedBox(height: 24.h),

                    // Pickup & Delivery toggle
                    const PickupDeliveryToggle(),
                    SizedBox(height: 24.h),

                    // Cancellation policy
                    const CancellationPolicySection(),
                    SizedBox(height: 100.h), // Space for bottom button
                  ],
                ),
              ),
            ),

            // Bottom button
            SafeArea(
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: NextFloatingButton(
                  isEnabled: canProceed,
                  onPressed: () {
                    Navigator.pushNamed(context, '/booking/checkout');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8.w,
        vertical: 8.h,
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20.sp,
            ),
          ),
          Expanded(
            child: Text(
              'Select Date & Time',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(width: 48.w), // Balance the back button
        ],
      ),
    );
  }
}
