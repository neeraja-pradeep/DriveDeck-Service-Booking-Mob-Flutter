import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider for the current bottom navigation tab index.
final currentTabIndexProvider = StateProvider<int>((ref) => 0);

/// Provider for checking if we're on the home tab.
final isHomeTabProvider = Provider<bool>((ref) {
  return ref.watch(currentTabIndexProvider) == 0;
});

/// Provider for checking if we're on the bookings tab.
final isBookingsTabProvider = Provider<bool>((ref) {
  return ref.watch(currentTabIndexProvider) == 1;
});

/// Provider for checking if we're on the profile tab.
final isProfileTabProvider = Provider<bool>((ref) {
  return ref.watch(currentTabIndexProvider) == 2;
});
