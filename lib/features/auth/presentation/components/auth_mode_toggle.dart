import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Enum for auth mode.
enum AuthMode { login, register }

/// Toggle bar between Login and Register modes.
class AuthModeToggle extends StatelessWidget {
  const AuthModeToggle({
    super.key,
    required this.currentMode,
    required this.onModeChanged,
  });

  final AuthMode currentMode;
  final ValueChanged<AuthMode> onModeChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildTab(
              context,
              label: 'Login',
              isSelected: currentMode == AuthMode.login,
              onTap: () => onModeChanged(AuthMode.login),
            ),
          ),
          Expanded(
            child: _buildTab(
              context,
              label: 'Register',
              isSelected: currentMode == AuthMode.register,
              onTap: () => onModeChanged(AuthMode.register),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(
    BuildContext context, {
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: EdgeInsets.all(4.w),
        decoration: BoxDecoration(
          color: isSelected ? Theme.of(context).primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: isSelected ? Colors.white : Colors.grey[600],
            ),
          ),
        ),
      ),
    );
  }
}
