import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// App bar for the bookings screen.
///
/// Displays the title and settings menu button.
class BookingsAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// Creates a new [BookingsAppBar].
  const BookingsAppBar({super.key});

  @override
  Size get preferredSize => Size.fromHeight(56.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      automaticallyImplyLeading: false,
      title: Text(
        'My Bookings',
        style: TextStyle(
          fontSize: 24.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () => _showSettingsMenu(context),
          icon: Icon(
            Icons.more_vert,
            color: Colors.black54,
            size: 24.sp,
          ),
          tooltip: 'Settings',
        ),
        SizedBox(width: 8.w),
      ],
    );
  }

  void _showSettingsMenu(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (context) => const _SettingsMenuContent(),
    );
  }
}

/// Content for the settings menu bottom sheet.
class _SettingsMenuContent extends StatelessWidget {
  const _SettingsMenuContent();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              'Settings',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 16.h),
            _SettingsMenuItem(
              icon: Icons.filter_list,
              title: 'Filter by date',
              onTap: () {
                Navigator.pop(context);
                _showComingSoon(context);
              },
            ),
            _SettingsMenuItem(
              icon: Icons.sort,
              title: 'Sort by',
              onTap: () {
                Navigator.pop(context);
                _showComingSoon(context);
              },
            ),
            _SettingsMenuItem(
              icon: Icons.download,
              title: 'Export bookings',
              onTap: () {
                Navigator.pop(context);
                _showComingSoon(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showComingSoon(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Coming soon',
          style: TextStyle(fontSize: 14.sp),
        ),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

/// Individual menu item in the settings menu.
class _SettingsMenuItem extends StatelessWidget {
  const _SettingsMenuItem({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.black54,
        size: 24.sp,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16.sp,
          color: Colors.black87,
        ),
      ),
      onTap: onTap,
    );
  }
}
