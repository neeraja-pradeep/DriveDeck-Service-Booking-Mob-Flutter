import 'package:flutter/material.dart';

/// Profile menu item options.
enum ProfileMenuItem {
  editProfile,
  myBookings,
  settings,
  helpSupport,
  logout,
}

/// Extension for ProfileMenuItem to provide display properties.
extension ProfileMenuItemX on ProfileMenuItem {
  /// Get display title for menu item.
  String get title => switch (this) {
        ProfileMenuItem.editProfile => 'Edit Profile',
        ProfileMenuItem.myBookings => 'My Bookings',
        ProfileMenuItem.settings => 'Settings',
        ProfileMenuItem.helpSupport => 'Help & Support',
        ProfileMenuItem.logout => 'Logout',
      };

  /// Get icon for menu item.
  IconData get icon => switch (this) {
        ProfileMenuItem.editProfile => Icons.person_outline,
        ProfileMenuItem.myBookings => Icons.calendar_today_outlined,
        ProfileMenuItem.settings => Icons.settings_outlined,
        ProfileMenuItem.helpSupport => Icons.help_outline,
        ProfileMenuItem.logout => Icons.logout,
      };

  /// Check if menu item is destructive action.
  bool get isDestructive => this == ProfileMenuItem.logout;
}
