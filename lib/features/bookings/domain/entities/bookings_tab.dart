/// Represents the tabs available in the My Bookings screen.
///
/// Used to switch between viewing upcoming bookings and booking history.
enum BookingsTab {
  /// Tab showing upcoming/active bookings (pending, confirmed).
  booked,

  /// Tab showing past bookings (completed, cancelled, no-show).
  history,
}

/// Extension methods for [BookingsTab] enum.
extension BookingsTabX on BookingsTab {
  /// Returns the display label for the tab.
  String get label => switch (this) {
        BookingsTab.booked => 'Booked',
        BookingsTab.history => 'History',
      };

  /// Returns the API query parameter value for the tab.
  String get apiValue => switch (this) {
        BookingsTab.booked => 'booked',
        BookingsTab.history => 'history',
      };

  /// Returns the index of the tab for TabController.
  int get index => switch (this) {
        BookingsTab.booked => 0,
        BookingsTab.history => 1,
      };

  /// Creates a [BookingsTab] from an index.
  static BookingsTab fromIndex(int index) => switch (index) {
        0 => BookingsTab.booked,
        1 => BookingsTab.history,
        _ => BookingsTab.booked,
      };
}
