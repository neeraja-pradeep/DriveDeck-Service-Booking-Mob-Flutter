/// Enum representing the tabs in the shop detail screen.
enum ShopTab {
  services,
  packages,
  accessories,
}

/// Extension providing display names for ShopTab.
extension ShopTabX on ShopTab {
  /// Returns the display name for the tab.
  String get displayName => switch (this) {
        ShopTab.services => 'Services',
        ShopTab.packages => 'Packages',
        ShopTab.accessories => 'Accessories',
      };
}
