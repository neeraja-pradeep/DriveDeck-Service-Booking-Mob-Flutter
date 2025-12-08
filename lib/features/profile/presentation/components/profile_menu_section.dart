import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:newapp/app/theme/colors.dart';
import 'package:newapp/features/profile/domain/entities/profile_menu_item.dart';
import 'package:newapp/features/profile/presentation/components/profile_menu_item_tile.dart';
import 'package:newapp/features/profile/presentation/dialogs/logout_dialog.dart';

class ProfileMenuSection extends ConsumerWidget {
  const ProfileMenuSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Updated list of items as requested
    final menuItems = [
      ProfileMenuItem.myGarage,
      ProfileMenuItem.membership,
      ProfileMenuItem.history,
      ProfileMenuItem.settings,
      ProfileMenuItem.helpSupport,
    ];

    return Column(
      children: [
        // 1. The Menu List with Dividers
        Column(
          children: [
            for (var i = 0; i < menuItems.length; i++) ...[
              ProfileMenuItemTile(
                item: menuItems[i],
                imagePath: _getAssetPath(menuItems[i]),
                onTap: () => _handleMenuTap(context, ref, menuItems[i]),
              ),
              // Add divider after every item
              _buildDivider(),
            ],
          ],
        ),

        // 2. Gap before Logout
        SizedBox(height: 40.h),

        // 3. Logout Button (Centered Red Text)
        TextButton(
          onPressed: () => _showLogoutDialog(context, ref),
          child: Text(
            'Logout',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.error,
            ),
          ),
        ),

        SizedBox(height: 20.h),
      ],
    );
  }

  /// Helper to map items to asset paths
  String _getAssetPath(ProfileMenuItem item) {
    switch (item) {
      case ProfileMenuItem.myGarage:
        return 'assets/Wallet.png';
      case ProfileMenuItem.membership:
        return 'assets/Membership.png';
      case ProfileMenuItem.history:
        return 'assets/History.png';
      case ProfileMenuItem.settings:
        return 'assets/Settings.png';
      case ProfileMenuItem.helpSupport:
        return 'assets/Help.png';
      case ProfileMenuItem.logout:
        return 'assets/logout.png';
    }
  }

  Widget _buildDivider() {
    return Divider(
      height: 1.h,
      thickness: 1,
      color: Colors.grey.shade200,
      indent: 24.w,
      endIndent: 24.w,
    );
  }

  void _handleMenuTap(
    BuildContext context,
    WidgetRef ref,
    ProfileMenuItem item,
  ) {
    switch (item) {
      case ProfileMenuItem.myGarage:
        context.push('/garage');
        break;
      case ProfileMenuItem.membership:
        _showComingSoonSnackBar(context, 'Membership');
        break;
      case ProfileMenuItem.history:
        _showComingSoonSnackBar(context, 'History');
        break;
      case ProfileMenuItem.settings:
        _showComingSoonSnackBar(context, 'Settings');
        break;
      case ProfileMenuItem.helpSupport:
        _showComingSoonSnackBar(context, 'Help & Support');
        break;
      case ProfileMenuItem.logout:
        _showLogoutDialog(context, ref);
        break;
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

  void _showLogoutDialog(BuildContext context, WidgetRef ref) {
    showDialog(context: context, builder: (context) => const LogoutDialog());
  }
}
