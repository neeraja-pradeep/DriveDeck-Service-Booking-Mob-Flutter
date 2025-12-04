import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../application/providers/bookings_providers.dart';
import '../components/bookings_app_bar.dart';
import '../components/bookings_list_section.dart';
import '../components/bookings_search_bar.dart';
import '../components/bookings_tab_bar.dart';

/// Main screen for displaying user bookings.
///
/// Shows upcoming and past bookings in two tabs with search functionality.
class BookingsScreen extends ConsumerStatefulWidget {
  /// Creates a new [BookingsScreen].
  const BookingsScreen({super.key});

  @override
  ConsumerState<BookingsScreen> createState() => _BookingsScreenState();
}

class _BookingsScreenState extends ConsumerState<BookingsScreen> {
  @override
  void initState() {
    super.initState();
    // Initialize bookings on first load
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(bookingsStateProvider.notifier).initialize();
    });
  }

  Future<void> _onRefresh() async {
    await ref.read(bookingsStateProvider.notifier).refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const BookingsAppBar(),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _onRefresh,
          color: const Color(0xFFFFB74D),
          child: Column(
            children: [
              SizedBox(height: 16.h),
              // Search bar (static placeholder)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: const BookingsSearchBar(),
              ),
              SizedBox(height: 16.h),
              // Tab bar
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: const BookingsTabBar(),
              ),
              SizedBox(height: 16.h),
              // Bookings list
              const Expanded(
                child: BookingsListSection(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
