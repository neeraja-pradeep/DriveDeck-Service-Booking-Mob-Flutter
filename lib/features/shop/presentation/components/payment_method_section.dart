import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../dialogs/payment_method_bottom_sheet.dart';

/// Section for payment method selection (static placeholder).
class PaymentMethodSection extends StatelessWidget {
  final String? selectedMethod;
  final ValueChanged<String>? onMethodSelected;

  const PaymentMethodSection({
    super.key,
    this.selectedMethod,
    this.onMethodSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20.r),
            ),
          ),
          builder: (context) => PaymentMethodBottomSheet(
            selectedMethod: selectedMethod,
            onMethodSelected: (method) {
              onMethodSelected?.call(method);
              Navigator.pop(context);
            },
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              Icons.payment_outlined,
              size: 24.sp,
              color: const Color(0xFF1E88E5),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Payment Method',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    selectedMethod ?? 'Select Payment Method',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right,
              size: 24.sp,
              color: Colors.grey[400],
            ),
          ],
        ),
      ),
    );
  }
}
