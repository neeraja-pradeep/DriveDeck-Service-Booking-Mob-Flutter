import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Reusable phone number input field with country code.
class PhoneNumberField extends StatelessWidget {
  const PhoneNumberField({
    super.key,
    required this.controller,
    this.errorText,
    this.onChanged,
    this.enabled = true,
  });

  final TextEditingController controller;
  final String? errorText;
  final ValueChanged<String>? onChanged;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      enabled: enabled,
      keyboardType: TextInputType.phone,
      maxLength: 10,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(10),
      ],
      decoration: InputDecoration(
        hintText: 'number',
        errorText: errorText,
        counterText: '',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
      ),
      onChanged: onChanged,
    );
  }
}
