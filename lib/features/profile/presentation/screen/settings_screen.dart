import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/theme/colors.dart';
import '../../../../app/theme/typography.dart';

/// Settings screen for app configuration.
class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;
  bool _locationEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.textPrimary,
            size: 24.sp,
          ),
        ),
        title: Text(
          'Settings',
          style: AppTypography.titleLarge.copyWith(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),

              // Notifications section
              _buildSectionHeader('Notifications'),
              _buildSettingsTile(
                icon: Icons.notifications_outlined,
                title: 'Push Notifications',
                subtitle: 'Receive booking updates and reminders',
                trailing: Switch(
                  value: _notificationsEnabled,
                  onChanged: (value) {
                    setState(() => _notificationsEnabled = value);
                    _showComingSoon();
                  },
                  activeColor: AppColors.primary,
                ),
              ),

              SizedBox(height: 24.h),

              // Appearance section
              _buildSectionHeader('Appearance'),
              _buildSettingsTile(
                icon: Icons.dark_mode_outlined,
                title: 'Dark Mode',
                subtitle: 'Switch to dark theme',
                trailing: Switch(
                  value: _darkModeEnabled,
                  onChanged: (value) {
                    setState(() => _darkModeEnabled = value);
                    _showComingSoon();
                  },
                  activeColor: AppColors.primary,
                ),
              ),

              SizedBox(height: 24.h),

              // Privacy section
              _buildSectionHeader('Privacy'),
              _buildSettingsTile(
                icon: Icons.location_on_outlined,
                title: 'Location Services',
                subtitle: 'Allow app to access your location',
                trailing: Switch(
                  value: _locationEnabled,
                  onChanged: (value) {
                    setState(() => _locationEnabled = value);
                    _showComingSoon();
                  },
                  activeColor: AppColors.primary,
                ),
              ),
              _buildSettingsTile(
                icon: Icons.privacy_tip_outlined,
                title: 'Privacy Policy',
                subtitle: 'Read our privacy policy',
                onTap: _showComingSoon,
              ),
              _buildSettingsTile(
                icon: Icons.description_outlined,
                title: 'Terms of Service',
                subtitle: 'Read our terms of service',
                onTap: _showComingSoon,
              ),

              SizedBox(height: 24.h),

              // About section
              _buildSectionHeader('About'),
              _buildSettingsTile(
                icon: Icons.info_outline,
                title: 'App Version',
                subtitle: '1.0.0',
              ),
              _buildSettingsTile(
                icon: Icons.star_outline,
                title: 'Rate App',
                subtitle: 'Rate us on the store',
                onTap: _showComingSoon,
              ),
              _buildSettingsTile(
                icon: Icons.share_outlined,
                title: 'Share App',
                subtitle: 'Share with friends',
                onTap: _showComingSoon,
              ),

              SizedBox(height: 24.h),

              // Data section
              _buildSectionHeader('Data'),
              _buildSettingsTile(
                icon: Icons.delete_outline,
                title: 'Clear Cache',
                subtitle: 'Free up storage space',
                onTap: _showComingSoon,
              ),
              _buildSettingsTile(
                icon: Icons.account_circle_outlined,
                title: 'Delete Account',
                subtitle: 'Permanently delete your account',
                titleColor: AppColors.error,
                onTap: _showDeleteAccountDialog,
              ),

              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
      child: Text(
        title,
        style: AppTypography.titleSmall.copyWith(
          color: AppColors.textSecondary,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildSettingsTile({
    required IconData icon,
    required String title,
    required String subtitle,
    Widget? trailing,
    VoidCallback? onTap,
    Color? titleColor,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 4.h),
      leading: Container(
        width: 40.w,
        height: 40.w,
        decoration: BoxDecoration(
          color: AppColors.grey100,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Icon(
          icon,
          size: 22.sp,
          color: titleColor ?? AppColors.textPrimary,
        ),
      ),
      title: Text(
        title,
        style: AppTypography.bodyLarge.copyWith(
          fontWeight: FontWeight.w500,
          color: titleColor,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: AppTypography.bodySmall.copyWith(
          color: AppColors.textSecondary,
        ),
      ),
      trailing: trailing ??
          (onTap != null
              ? Icon(
                  Icons.chevron_right,
                  size: 24.sp,
                  color: AppColors.textSecondary,
                )
              : null),
      onTap: onTap,
    );
  }

  void _showComingSoon() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('This feature is coming soon'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _showDeleteAccountDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Account'),
        content: const Text(
          'Are you sure you want to delete your account? This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _showComingSoon();
            },
            child: Text(
              'Delete',
              style: TextStyle(color: AppColors.error),
            ),
          ),
        ],
      ),
    );
  }
}
