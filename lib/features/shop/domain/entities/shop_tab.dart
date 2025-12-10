import 'dart:ui';

/// Tabs available in shop details screen.
enum ShopTab {
  services,
  packages,
  accessories,
}

/// Extension for shop tab display properties.
extension ShopTabExtension on ShopTab {
  /// Get display name for the tab.
  String get displayName => switch (this) {
        ShopTab.services => 'Services',
        ShopTab.packages => 'Packages',
        ShopTab.accessories => 'Accessories',
      };

  /// Get color for the tab.
  Color get color => switch (this) {
        ShopTab.services => const Color(0xFF4CAF50),
        ShopTab.packages => const Color(0xFF2196F3),
        ShopTab.accessories => const Color(0xFFFF9800),
      };

  /// Get index for the tab.
  int get tabIndex => switch (this) {
        ShopTab.services => 0,
        ShopTab.packages => 1,
        ShopTab.accessories => 2,
      };

  /// Get tab from index.
  static ShopTab fromIndex(int index) => switch (index) {
        0 => ShopTab.services,
        1 => ShopTab.packages,
        2 => ShopTab.accessories,
        _ => ShopTab.services,
      };
}
