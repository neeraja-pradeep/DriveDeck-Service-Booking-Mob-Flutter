import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/theme/colors.dart';

/// Individual OTP input field widget.
/// Extracted from OTP verification screen to reduce nesting and improve maintainability.
class OtpInputField extends StatelessWidget {
  const OtpInputField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.index,
    required this.onChanged,
    this.isEnabled = true,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final int index;
  final ValueChanged<String> onChanged;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45.w,
      height: 55.h,
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: focusNode.hasFocus
              ? AppColors.inputBorderFocused
              : controller.text.isNotEmpty
              ? AppColors.primary
              : AppColors.inputBorder,
          width: 1.5,
        ),
      ),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        enabled: isEnabled,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.inputText,
        ),
        decoration: const InputDecoration(
          counterText: '',
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          contentPadding: EdgeInsets.zero,
          filled: false,
          fillColor: Colors.transparent,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
