import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Button for confirming booking.
class ConfirmBookingButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isLoading;
  final String? totalPrice;

  const ConfirmBookingButton({
    super.key,
    this.onPressed,
    this.isLoading = false,
    this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1E88E5),
          disabledBackgroundColor: const Color(0xFF1E88E5).withOpacity(0.5),
          padding: EdgeInsets.symmetric(vertical: 16.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          elevation: 0,
        ),
        child: isLoading
            ? SizedBox(
                height: 20.h,
                width: 20.w,
                child: const CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Text(
                totalPrice != null
                    ? 'Select Payment'
                    : 'Confirm Booking',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
      ),
    );
  }
}
