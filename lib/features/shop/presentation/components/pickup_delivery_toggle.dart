import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../application/providers/shop_providers.dart';

/// Toggle for pickup and delivery option.
class PickupDeliveryToggle extends ConsumerWidget {
  const PickupDeliveryToggle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookingFlow = ref.watch(bookingFlowStateProvider);
    final notifier = ref.read(bookingDateStateProvider.notifier);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Pick-up & Delivery',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    'our team will pick up your vehicle at the selected time and you will be notified when the car is washed and ready for delivery.',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey[600],
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 16.w),
            Switch(
              value: bookingFlow.pickupAndDelivery,
              onChanged: (value) {
                notifier.togglePickupDelivery(value);
              },
              activeColor: const Color(0xFF1E88E5),
            ),
          ],
        ),
      ),
    );
  }
}
