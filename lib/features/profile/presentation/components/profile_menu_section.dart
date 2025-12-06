import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newapp/app/theme/colors.dart';
import 'package:newapp/features/profile/domain/entities/profile_menu_item.dart';
import 'package:newapp/features/profile/presentation/components/profile_menu_item_tile.dart';
import 'package:newapp/features/profile/presentation/dialogs/logout_dialog.dart';
import 'package:newapp/features/profile/presentation/screens/edit_profile_screen.dart';

/// Profile menu section with navigation options.
class ProfileMenuSection extends ConsumerWidget {
  const ProfileMenuSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          ProfileMenuItemTile(
            item: ProfileMenuItem.editProfile,
            onTap: () => _handleMenuTap(context, ref, ProfileMenuItem.editProfile),
          ),
          const Divider(height: 1),
          ProfileMenuItemTile(
            item: ProfileMenuItem.myBookings,
            onTap: () => _handleMenuTap(context, ref, ProfileMenuItem.myBookings),
          ),
          const Divider(height: 1),
          ProfileMenuItemTile(
            item: ProfileMenuItem.settings,
            onTap: () => _handleMenuTap(context, ref, ProfileMenuItem.settings),
          ),
          const Divider(height: 1),
          ProfileMenuItemTile(
            item: ProfileMenuItem.helpSupport,
            onTap: () => _handleMenuTap(context, ref, ProfileMenuItem.helpSupport),
          ),
          const Divider(height: 1),
          ProfileMenuItemTile(
            item: ProfileMenuItem.logout,
            onTap: () => _handleMenuTap(context, ref, ProfileMenuItem.logout),
          ),
        ],
      ),
    );
  }

  void _handleMenuTap(
    BuildContext context,
    WidgetRef ref,
    ProfileMenuItem item,
  ) {
    switch (item) {
      case ProfileMenuItem.editProfile:
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (context) => const EditProfileScreen(),
          ),
        );
      case ProfileMenuItem.myBookings:
        _showComingSoonSnackBar(context, 'My Bookings');
      case ProfileMenuItem.settings:
        _showComingSoonSnackBar(context, 'Settings');
      case ProfileMenuItem.helpSupport:
        _showComingSoonSnackBar(context, 'Help & Support');
      case ProfileMenuItem.logout:
        showDialog<void>(
          context: context,
          builder: (context) => const LogoutDialog(),
        );
    }
  }

  void _showComingSoonSnackBar(BuildContext context, String feature) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$feature coming soon'),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
