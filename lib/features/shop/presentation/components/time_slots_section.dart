import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../application/providers/shop_providers.dart';
import '../../domain/entities/time_slot.dart';
import 'time_slot_chip.dart';

/// Section displaying available time slots.
class TimeSlotsSection extends ConsumerWidget {
  const TimeSlotsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(bookingDateStateProvider);
    final notifier = ref.read(bookingDateStateProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            'Available Time',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        ),
        SizedBox(height: 12.h),
        state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => _buildShimmer(),
          error: (failure) => _buildError(failure.message),
          loaded: (availableDates, selectedDate, selectedSlot) {
            final slots = availableDates.isNotEmpty
                ? availableDates.first.slots
                : <TimeSlot>[];

            if (slots.isEmpty) {
              return _buildEmpty();
            }

            return SizedBox(
              height: 44.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                itemCount: slots.length,
                separatorBuilder: (context, index) => SizedBox(width: 8.w),
                itemBuilder: (context, index) {
                  final slot = slots[index];
                  final isSelected = selectedSlot?.id == slot.id;

                  return TimeSlotChip(
                    slot: slot,
                    isSelected: isSelected,
                    isAvailable: slot.isAvailable,
                    onTap: () => notifier.selectTimeSlot(slot),
                  );
                },
              ),
            );
          },
        ),
        SizedBox(height: 8.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: 6.h,
            ),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Text(
              '4 Hours minimum',
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.grey[600],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildShimmer() {
    return SizedBox(
      height: 44.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemCount: 5,
        separatorBuilder: (context, index) => SizedBox(width: 8.w),
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: 80.w,
              height: 44.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildError(String message) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Text(
        message,
        style: TextStyle(
          fontSize: 14.sp,
          color: Colors.red[400],
        ),
      ),
    );
  }

  Widget _buildEmpty() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Text(
        'No slots available for this date',
        style: TextStyle(
          fontSize: 14.sp,
          color: Colors.grey[600],
        ),
      ),
    );
  }
}
