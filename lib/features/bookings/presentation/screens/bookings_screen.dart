import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/theme/colors.dart';

import '../../../../app/router/routes.dart';
import '../../application/providers/bookings_providers.dart';
import '../../application/states/bookings_state.dart';
import '../../domain/entities/bookings_tab.dart';
import '../components/booking_card_redesigned.dart';
import '../components/bookings_empty_state.dart';
import '../components/shimmer_loaders/bookings_list_shimmer.dart';

/// Screen for displaying user bookings with modern UI design.
class BookingsScreen extends ConsumerStatefulWidget {
  const BookingsScreen({super.key});

  @override
  ConsumerState<BookingsScreen> createState() => _BookingsScreenState();
}

class _BookingsScreenState extends ConsumerState<BookingsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    // Load bookings when screen initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(bookingsStateProvider.notifier).initialize();
    });

    // Listen to tab changes and update the selected tab in state
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        final tab = _tabController.index == 0
            ? BookingsTab.booked
            : BookingsTab.history;
        ref.read(bookingsStateProvider.notifier).selectTab(tab);
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bookingsState = ref.watch(bookingsStateProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          'My Booking',
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black87),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black87),
            onPressed: () {
              // Handle menu action
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Search bar
          Container(
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 16.h),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 16.sp,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey.shade500,
                    size: 20.sp,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 12.h,
                  ),
                ),
                onChanged: (value) {
                  ref
                      .read(bookingsStateProvider.notifier)
                      .updateSearchQuery(value);
                },
              ),
            ),
          ),

          // Custom Tab Bar
          Container(
            color: Colors.white,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                labelColor: Colors.black87,
                unselectedLabelColor: Colors.grey.shade600,
                labelStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                ),
                unselectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.transparent,
                tabs: const [
                  Tab(text: 'Booked'),
                  Tab(text: 'History'),
                ],
              ),
            ),
          ),

          SizedBox(height: 16.h),

          // Tab Content
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                await ref.read(bookingsStateProvider.notifier).refresh();
              },
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildBookingsList(bookingsState, isUpcoming: true),
                  _buildBookingsList(bookingsState, isUpcoming: false),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBookingsList(
    BookingsState bookingsState, {
    required bool isUpcoming,
  }) {
    if (bookingsState.isLoading) {
      return const BookingsListShimmer();
    }

    if (bookingsState.hasError) {
      return _buildErrorState(bookingsState);
    }

    return _buildLoadedBookings(bookingsState, isUpcoming);
  }

  Widget _buildLoadedBookings(BookingsState bookingsState, bool isUpcoming) {
    final bookings = isUpcoming
        ? bookingsState.bookingsList?.upcomingBookings ?? []
        : bookingsState.bookingsList?.pastBookings ?? [];

    if (bookings.isEmpty) {
      return BookingsEmptyState(
        tab: isUpcoming ? BookingsTab.booked : BookingsTab.history,
      );
    }

    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      itemCount: bookings.length,
      itemBuilder: (context, index) {
        final booking = bookings[index];
        return Padding(
          padding: EdgeInsets.only(bottom: 16.h),
          child: BookingCardRedesigned(
            booking: booking,
            onTap: () {
              BookingDetailRoute(bookingId: booking.id).go(context);
            },
          ),
        );
      },
    );
  }

  Widget _buildErrorState(BookingsState bookingsState) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 64.sp, color: Colors.grey.shade400),
            SizedBox(height: 16.h),
            Text(
              'Something went wrong',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              bookingsState.errorMessage ?? 'Please try again',
              style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade600),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24.h),
            ElevatedButton(
              onPressed: () {
                ref.read(bookingsStateProvider.notifier).refresh();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 12.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              child: Text(
                'Retry',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
