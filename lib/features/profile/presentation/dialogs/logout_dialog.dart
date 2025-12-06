import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newapp/app/theme/colors.dart';
import 'package:newapp/app/theme/typography.dart';
import 'package:newapp/features/profile/application/providers/profile_providers.dart';

/// Logout confirmation dialog.
class LogoutDialog extends ConsumerWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoggingOut = ref.watch(isLoggingOutProvider);

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      title: Text(
        'Logout',
        style: AppTypography.titleLarge,
        textAlign: TextAlign.center,
      ),
      content: Text(
        'Are you sure you want to logout?',
        style: AppTypography.bodyMedium.copyWith(
          color: AppColors.textSecondary,
        ),
        textAlign: TextAlign.center,
      ),
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      actions: [
        TextButton(
          onPressed: isLoggingOut ? null : () => Navigator.of(context).pop(),
          child: Text(
            'Cancel',
            style: AppTypography.labelLarge.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: isLoggingOut ? null : () => _handleLogout(context, ref),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.error,
            minimumSize: Size(100.w, 44.h),
          ),
          child: isLoggingOut
              ? SizedBox(
                  width: 20.w,
                  height: 20.w,
                  child: const CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
                  ),
                )
              : Text(
                  'Logout',
                  style: AppTypography.labelLarge.copyWith(
                    color: AppColors.white,
                  ),
                ),
        ),
      ],
    );
  }

  Future<void> _handleLogout(BuildContext context, WidgetRef ref) async {
    final success = await ref.read(profileStateProvider.notifier).logout();

    if (success && context.mounted) {
      Navigator.of(context).pop(); // Close dialog
      // TODO: Navigate to login screen
      // For now, show a success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Logged out successfully')),
      );
    }
  }
}
