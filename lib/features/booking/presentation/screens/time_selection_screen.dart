import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/theme/colors.dart';
import '../../../../app/theme/typography.dart';
import '../../application/providers/booking_provider.dart';
import '../../domain/entities/time_slot.dart';

/// Screen for selecting date and time for booking.
class TimeSelectionScreen extends ConsumerStatefulWidget {
  const TimeSelectionScreen({super.key});

  @override
  ConsumerState<TimeSelectionScreen> createState() =>
      _TimeSelectionScreenState();
}

class _TimeSelectionScreenState extends ConsumerState<TimeSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    final currentMonth = ref.watch(currentCalendarMonthProvider);
    final selectedDate = ref.watch(selectedDateProvider);
    final selectedTimeSlot = ref.watch(selectedTimeSlotProvider);
    final pickupDelivery = ref.watch(pickupDeliveryProvider);
    final availableSlots = ref.watch(availableTimeSlotsProvider);

    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: Column(
          children: [
            // Back button
            _buildHeader(),

            // Scrollable content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Calendar section
                    _buildCalendarSection(currentMonth, selectedDate),

                    SizedBox(height: 16.h),

                    // Available time section
                    _buildAvailableTimeSection(
                      availableSlots,
                      selectedTimeSlot,
                    ),

                    SizedBox(height: 16.h),

                    // Minimum duration
                    _buildMinimumDuration(),

                    SizedBox(height: 16.h),

                    // Pickup and delivery
                    _buildPickupDeliverySection(pickupDelivery),

                    SizedBox(height: 16.h),

                    // Cancellation policy
                    _buildCancellationPolicy(),

                    SizedBox(height: 24.h),
                  ],
                ),
              ),
            ),

            // Next button
            _buildNextButton(selectedDate, selectedTimeSlot),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              if (context.canPop()) {
                context.pop();
              } else {
                context.go('/home');
              }
            },
            child: Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: AppColors.grey100,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(
                Icons.chevron_left,
                size: 24.sp,
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCalendarSection(DateTime currentMonth, DateTime? selectedDate) {
    final dates = getDatesForMonth(currentMonth);

    return Container(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Month navigation
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    getMonthName(currentMonth.month),
                    style: AppTypography.titleLarge.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    '${currentMonth.year}',
                    style: AppTypography.titleLarge.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      final newMonth = DateTime(
                        currentMonth.year,
                        currentMonth.month - 1,
                      );
                      ref.read(currentCalendarMonthProvider.notifier).state =
                          newMonth;
                    },
                    icon: Icon(
                      Icons.chevron_left,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      final newMonth = DateTime(
                        currentMonth.year,
                        currentMonth.month + 1,
                      );
                      ref.read(currentCalendarMonthProvider.notifier).state =
                          newMonth;
                    },
                    icon: Icon(
                      Icons.chevron_right,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: 16.h),

          // Week day headers
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
                .map(
                  (day) => SizedBox(
                    width: 40.w,
                    child: Text(
                      day,
                      textAlign: TextAlign.center,
                      style: AppTypography.labelMedium.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),

          SizedBox(height: 8.h),

          // Calendar grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              mainAxisSpacing: 8.h,
              crossAxisSpacing: 4.w,
            ),
            itemCount: dates.length,
            itemBuilder: (context, index) {
              final date = dates[index];
              final isCurrentMonth = date.month == currentMonth.month;
              final isPast = isDateInPast(date);
              final isSelected =
                  selectedDate != null &&
                  date.year == selectedDate.year &&
                  date.month == selectedDate.month &&
                  date.day == selectedDate.day;
              final isTodayDate = isToday(date);

              return GestureDetector(
                onTap: isPast || !isCurrentMonth
                    ? null
                    : () {
                        ref.read(selectedDateProvider.notifier).state = date;
                        ref.read(bookingDataProvider.notifier).selectDate(date);
                      },
                child: Container(
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.primary
                        : isTodayDate
                        ? AppColors.primary.withValues(alpha: 0.1)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Center(
                    child: Text(
                      '${date.day}',
                      style: AppTypography.bodyMedium.copyWith(
                        color: isSelected
                            ? Colors.white
                            : !isCurrentMonth || isPast
                            ? AppColors.textHint
                            : AppColors.textPrimary,
                        fontWeight: isSelected || isTodayDate
                            ? FontWeight.w600
                            : null,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAvailableTimeSection(
    List<TimeSlot> slots,
    TimeSlot? selectedSlot,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Available Time',
            style: AppTypography.titleMedium.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 12.h),
          Wrap(
            spacing: 12.w,
            runSpacing: 12.h,
            children: slots.map((slot) {
              final isSelected = selectedSlot?.id == slot.id;
              final isAvailable = slot.isAvailable;

              return GestureDetector(
                onTap: isAvailable
                    ? () {
                        ref.read(selectedTimeSlotProvider.notifier).state =
                            slot;
                        ref
                            .read(bookingDataProvider.notifier)
                            .selectTimeSlot(slot.id, slot.displayTime);
                      }
                    : null,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 10.h,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.primary
                        : isAvailable
                        ? Colors.transparent
                        : AppColors.grey100,
                    border: Border.all(
                      color: isSelected
                          ? AppColors.primary
                          : isAvailable
                          ? AppColors.grey300
                          : AppColors.grey200,
                    ),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    slot.displayTime,
                    style: AppTypography.labelMedium.copyWith(
                      color: isSelected
                          ? Colors.white
                          : isAvailable
                          ? AppColors.textPrimary
                          : AppColors.textHint,
                      fontWeight: isSelected ? FontWeight.w600 : null,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildMinimumDuration() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Text(
        '4 Hours minimum',
        style: AppTypography.bodyMedium.copyWith(
          color: AppColors.primary,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildPickupDeliverySection(bool isEnabled) {
    return Container(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Pick-up & Delivery',
                style: AppTypography.titleMedium.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Switch(
                value: isEnabled,
                onChanged: (value) {
                  ref.read(pickupDeliveryProvider.notifier).state = value;
                  ref
                      .read(bookingDataProvider.notifier)
                      .togglePickupAndDelivery(value);
                },
                activeColor: AppColors.primary,
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            'our team will pick up your vehicle at the selected time and you will be notified when the car is washed and ready for delivery.',
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.textSecondary,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCancellationPolicy() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Cancellation Policy',
            style: AppTypography.titleMedium.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 12.h),
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: AppColors.warning.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(
                color: AppColors.warning.withValues(alpha: 0.3),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.info_outline, color: AppColors.warning, size: 20.sp),
                SizedBox(width: 8.w),
                Expanded(
                  child: Text(
                    'Cancel free of charge up to 3 hours before pickup. Cancellation within 3 hours will incur a charge of 30 % of booking amount.',
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.textSecondary,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNextButton(DateTime? selectedDate, TimeSlot? selectedTimeSlot) {
    final isEnabled = selectedDate != null && selectedTimeSlot != null;

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          width: double.infinity,
          height: 48.h,
          child: ElevatedButton(
            onPressed: isEnabled
                ? () {
                    // Save selected date and time to booking data
                    ref
                        .read(bookingDataProvider.notifier)
                        .selectDate(selectedDate);
                    ref
                        .read(bookingDataProvider.notifier)
                        .selectTimeSlot(
                          selectedTimeSlot.id,
                          selectedTimeSlot.time,
                        );
                    // Navigate to checkout screen
                    context.push('/checkout');
                  }
                : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: isEnabled
                  ? AppColors.primary
                  : AppColors.grey300,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.r),
              ),
            ),
            child: Text(
              'Next',
              style: AppTypography.labelLarge.copyWith(
                color: isEnabled ? Colors.white : AppColors.textHint,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
