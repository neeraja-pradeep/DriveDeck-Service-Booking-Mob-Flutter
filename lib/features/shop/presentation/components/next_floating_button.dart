import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Floating action button for proceeding to next step.
class NextFloatingButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isEnabled;
  final int selectedCount;

  const NextFloatingButton({
    super.key,
    required this.onPressed,
    required this.isEnabled,
    this.selectedCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: ElevatedButton(
        onPressed: isEnabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1E88E5),
          disabledBackgroundColor: Colors.grey[300],
          padding: EdgeInsets.symmetric(vertical: 16.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          elevation: isEnabled ? 4 : 0,
        ),
        child: Text(
          selectedCount > 0 ? 'Next ($selectedCount selected)' : 'Next',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: isEnabled ? Colors.white : Colors.grey[500],
          ),
        ),
      ),
    );
  }
}
