import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Profile screen displaying user information and settings.
class ProfileScreen extends StatelessWidget {
  /// Creates a new [ProfileScreen].
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        title: Text(
          'Profile',
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings_outlined,
              color: Colors.black54,
              size: 24.sp,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.w),
          child: Column(
            children: [
              // Profile header
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 72.w,
                      height: 72.h,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFB74D).withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.person,
                        size: 36.sp,
                        color: const Color(0xFFFFB74D),
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Guest User',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            'guest@example.com',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.edit_outlined,
                      size: 24.sp,
                      color: Colors.grey.shade500,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              // Menu items
              _ProfileMenuItem(
                icon: Icons.local_car_wash_outlined,
                title: 'My Vehicles',
                onTap: () {},
              ),
              _ProfileMenuItem(
                icon: Icons.location_on_outlined,
                title: 'Saved Addresses',
                onTap: () {},
              ),
              _ProfileMenuItem(
                icon: Icons.payment_outlined,
                title: 'Payment Methods',
                onTap: () {},
              ),
              _ProfileMenuItem(
                icon: Icons.notifications_outlined,
                title: 'Notifications',
                onTap: () {},
              ),
              _ProfileMenuItem(
                icon: Icons.help_outline,
                title: 'Help & Support',
                onTap: () {},
              ),
              _ProfileMenuItem(
                icon: Icons.info_outline,
                title: 'About',
                onTap: () {},
              ),
              SizedBox(height: 24.h),
              // Logout button
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.red,
                    side: const BorderSide(color: Colors.red),
                    padding: EdgeInsets.symmetric(vertical: 14.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  child: Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Individual menu item in the profile screen.
class _ProfileMenuItem extends StatelessWidget {
  const _ProfileMenuItem({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade100),
        ),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 4.h),
        leading: Icon(
          icon,
          color: Colors.grey.shade600,
          size: 24.sp,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16.sp,
            color: Colors.black87,
          ),
        ),
        trailing: Icon(
          Icons.chevron_right,
          color: Colors.grey.shade400,
          size: 24.sp,
        ),
        onTap: onTap,
      ),
    );
  }
}
