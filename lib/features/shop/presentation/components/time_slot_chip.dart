import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/time_slot.dart';

/// Chip widget for displaying a time slot.
class TimeSlotChip extends StatelessWidget {
  final TimeSlot slot;
  final bool isSelected;
  final bool isAvailable;
  final VoidCallback onTap;

  const TimeSlotChip({
    super.key,
    required this.slot,
    required this.isSelected,
    required this.isAvailable,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color textColor;
    Color borderColor;

    if (!isAvailable) {
      backgroundColor = Colors.grey[100]!;
      textColor = Colors.grey[400]!;
      borderColor = Colors.grey[200]!;
    } else if (isSelected) {
      backgroundColor = const Color(0xFF1E88E5);
      textColor = Colors.white;
      borderColor = const Color(0xFF1E88E5);
    } else {
      backgroundColor = Colors.white;
      textColor = Colors.black87;
      borderColor = Colors.grey[300]!;
    }

    return GestureDetector(
      onTap: isAvailable ? onTap : null,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 10.h,
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: borderColor),
        ),
        child: Text(
          slot.displayTime,
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
