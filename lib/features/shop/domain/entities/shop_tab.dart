/// Tabs available in shop details screen.
enum ShopTab {
  services,
  packages,
  accessories,
}

/// Extension for shop tab display properties.
extension ShopTabExtension on ShopTab {
  /// Get display name for the tab.
  String get displayName {
    switch (this) {
      case ShopTab.services:
        return 'Services';
      case ShopTab.packages:
        return 'Packages';
      case ShopTab.accessories:
        return 'Accessories';
    }
  }

  /// Get index for the tab.
  int get index {
    switch (this) {
      case ShopTab.services:
        return 0;
      case ShopTab.packages:
        return 1;
      case ShopTab.accessories:
        return 2;
    }
  }

  /// Get tab from index.
  static ShopTab fromIndex(int index) {
    switch (index) {
      case 0:
        return ShopTab.services;
      case 1:
        return ShopTab.packages;
      case 2:
        return ShopTab.accessories;
      default:
        return ShopTab.services;
    }
  }
}
