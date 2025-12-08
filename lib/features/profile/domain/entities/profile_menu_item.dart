import 'package:flutter/material.dart';

/// Profile menu item options.
enum ProfileMenuItem {
  myGarage,
  membership,
  history,
  settings,
  helpSupport,
  logout,
}

/// Extension for ProfileMenuItem to provide display properties.
extension ProfileMenuItemX on ProfileMenuItem {
  /// Get display title for menu item.
  String get title => switch (this) {
    ProfileMenuItem.myGarage => 'My Garage',
    ProfileMenuItem.membership => 'Membership',
    ProfileMenuItem.history => 'History',
    ProfileMenuItem.settings => 'Settings',
    ProfileMenuItem.helpSupport => 'Help & Support',
    ProfileMenuItem.logout => 'Logout',
  };

  /// Get icon for menu item.
  IconData get icon => switch (this) {
    ProfileMenuItem.myGarage => Icons.garage,
    ProfileMenuItem.membership => Icons.card_membership,
    ProfileMenuItem.history => Icons.history,
    ProfileMenuItem.settings => Icons.settings_outlined,
    ProfileMenuItem.helpSupport => Icons.help_outline,
    ProfileMenuItem.logout => Icons.logout,
  };

  /// Check if menu item is destructive action.
  bool get isDestructive => this == ProfileMenuItem.logout;
}
