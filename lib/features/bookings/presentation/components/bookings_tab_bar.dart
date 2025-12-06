import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../application/providers/bookings_providers.dart';
import '../../domain/entities/bookings_tab.dart';

/// Tab bar for switching between Booked and History tabs.
class BookingsTabBar extends ConsumerWidget {
  /// Creates a new [BookingsTabBar].
  const BookingsTabBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTab = ref.watch(selectedBookingsTabProvider);
    final upcomingCount = ref.watch(upcomingBookingsCountProvider);
    final historyCount = ref.watch(historyBookingsCountProvider);

    return Container(
      height: 48.h,
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: _TabButton(
              label: 'Booked',
              count: upcomingCount,
              isSelected: selectedTab == BookingsTab.booked,
              onTap: () {
                ref
                    .read(bookingsStateProvider.notifier)
                    .selectTab(BookingsTab.booked);
              },
            ),
          ),
          Expanded(
            child: _TabButton(
              label: 'History',
              count: historyCount,
              isSelected: selectedTab == BookingsTab.history,
              onTap: () {
                ref
                    .read(bookingsStateProvider.notifier)
                    .selectTab(BookingsTab.history);
              },
            ),
          ),
        ],
      ),
    );
  }
}

/// Individual tab button in the tab bar.
class _TabButton extends StatelessWidget {
  const _TabButton({
    required this.label,
    required this.count,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final int count;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                  color: isSelected ? Colors.black87 : Colors.grey.shade600,
                ),
              ),
              if (count > 0) ...[
                SizedBox(width: 6.w),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.w,
                    vertical: 2.h,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? const Color(0xFFFFB74D)
                        : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Text(
                    count.toString(),
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: isSelected ? Colors.white : Colors.grey.shade600,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
