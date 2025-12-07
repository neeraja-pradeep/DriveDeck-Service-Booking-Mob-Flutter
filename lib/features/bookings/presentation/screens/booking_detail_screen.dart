import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/theme/colors.dart';
import '../../../../app/theme/typography.dart';
import '../../../../core/error/error_view.dart';
import '../../../../core/error/failure.dart';
import '../../application/providers/bookings_providers.dart';
import '../../application/states/booking_detail_state.dart';
import '../../domain/entities/booking.dart';
import '../../domain/entities/booking_status.dart';

/// Screen for displaying booking details.
class BookingDetailScreen extends ConsumerStatefulWidget {
  const BookingDetailScreen({super.key, required this.bookingId});

  final String bookingId;

  @override
  ConsumerState<BookingDetailScreen> createState() =>
      _BookingDetailScreenState();
}

class _BookingDetailScreenState extends ConsumerState<BookingDetailScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  String _selectedVehicle = 'Sedan';
  final List<Map<String, dynamic>> _services = [
    {'name': 'Exterior Wash', 'price': 1500, 'selected': true},
    {'name': 'Interior Cleaning', 'price': 1500, 'selected': false},
    {'name': 'Polish & Protection', 'price': 1500, 'selected': true},
    {'name': 'Final Touch', 'price': 1500, 'selected': true},
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    // Load booking details when screen initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(bookingDetailStateProvider(widget.bookingId).notifier)
          .initialize();
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bookingDetailState = ref.watch(
      bookingDetailStateProvider(widget.bookingId),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildBody(bookingDetailState),
    );
  }

  Widget _buildBody(BookingDetailState bookingDetailState) {
    return switch (bookingDetailState) {
      BookingDetailStateInitial() => _buildLoadingState(),
      BookingDetailStateLoading() => _buildLoadingState(),
      BookingDetailStateCancelling() => _buildLoadingState(),
      BookingDetailStateLoaded(booking: final booking) => _buildLoadedState(
        booking,
      ),
      BookingDetailStateCancelled(booking: final booking) =>
        _buildCancelledState(booking),
      BookingDetailStateError(failure: final failure) => _buildErrorState(
        failure,
      ),
    };
  }

  Widget _buildLoadingState() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildLoadedState(Booking booking) {
    return Column(
      children: [
        // Shop header with image and navigation
        _buildShopHeader(booking),

        // Scrollable content
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildShopInfo(booking),
                  SizedBox(height: 20.h),
                  _buildOpenHours(),
                  SizedBox(height: 20.h),
                  _buildVehicleSelector(),
                  SizedBox(height: 20.h),
                  _buildServiceTabs(),
                  SizedBox(height: 20.h),
                  _buildServicesList(booking),
                  SizedBox(height: 100.h), // Space for button
                ],
              ),
            ),
          ),
        ),

        // Bottom button
        _buildBottomButton(),
      ],
    );
  }

  Widget _buildCancelledState(Booking booking) {
    return Column(
      children: [
        // Shop header with image and navigation
        _buildShopHeader(booking),

        // Cancelled message
        Container(
          margin: EdgeInsets.all(20.w),
          width: double.infinity,
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: AppColors.errorLight,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: AppColors.error),
          ),
          child: Column(
            children: [
              Icon(Icons.cancel, size: 48.sp, color: AppColors.error),
              SizedBox(height: 12.h),
              Text(
                'Booking Cancelled',
                style: AppTypography.titleMedium.copyWith(
                  color: AppColors.error,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'Your booking has been successfully cancelled.',
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.error,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),

        // Scrollable content
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildShopInfo(booking),
                  SizedBox(height: 20.h),
                  _buildOpenHours(),
                  SizedBox(height: 20.h),
                  _buildVehicleSelector(),
                  SizedBox(height: 20.h),
                  _buildServiceTabs(),
                  SizedBox(height: 20.h),
                  _buildServicesList(booking),
                  SizedBox(height: 100.h),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildShopHeader(Booking booking) {
    return Container(
      height: 280.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.r)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Background image
          ClipRRect(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.r)),
            child: Container(
              height: 280.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.grey200,
                image: booking.shopImageUrl.isNotEmpty
                    ? DecorationImage(
                        image: NetworkImage(booking.shopImageUrl),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: booking.shopImageUrl.isEmpty
                  ? Icon(
                      Icons.local_car_wash,
                      size: 60.sp,
                      color: AppColors.grey400,
                    )
                  : null,
            ),
          ),

          // Navigation overlay
          Positioned(
            top: 50.h,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      width: 40.w,
                      height: 40.w,
                      decoration: BoxDecoration(
                        color: const Color(0xFF4A90E2),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                        size: 20.sp,
                      ),
                    ),
                  ),
                  Text(
                    booking.shopName,
                    style: AppTypography.titleLarge.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      shadows: [
                        const Shadow(
                          offset: Offset(0, 1),
                          blurRadius: 3,
                          color: Colors.black26,
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 40.w,
                      height: 40.w,
                      decoration: BoxDecoration(
                        color: const Color(0xFF4A90E2),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 20.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Image indicators
          Positioned(
            bottom: 20.h,
            left: 20.w,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.camera_alt, color: Colors.white, size: 16.sp),
                  SizedBox(width: 4.w),
                  Text(
                    '1',
                    style: AppTypography.labelSmall.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            bottom: 20.h,
            right: 20.w,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.more_horiz, color: Colors.white, size: 16.sp),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShopInfo(Booking booking) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                'Car Wash',
                style: AppTypography.titleLarge.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 16.sp),
                SizedBox(width: 4.w),
                Text(
                  '4.5 (25 reviews)',
                  style: AppTypography.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ],
        ),

        SizedBox(height: 8.h),

        Text(
          'Dwarka, CA\$404 (4.8 km Away)',
          style: AppTypography.bodySmall.copyWith(
            color: AppColors.textSecondary,
          ),
        ),

        SizedBox(height: 12.h),

        Text(
          'Ace Car Spa is where exceptional car care meets uncompromised quality. We combine expert techniques, premium products.',
          style: AppTypography.bodyMedium.copyWith(
            color: AppColors.textSecondary,
            height: 1.4,
          ),
        ),
      ],
    );
  }

  Widget _buildOpenHours() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Open Hours',
          style: AppTypography.titleMedium.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),

        SizedBox(height: 8.h),

        Text(
          '6:00 AM to 11:00 PM - Monday to Sunday',
          style: AppTypography.bodyMedium.copyWith(
            color: AppColors.textSecondary,
          ),
        ),

        SizedBox(height: 8.h),

        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
          decoration: BoxDecoration(
            color: const Color(0xFFE3F2FD),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Text(
            '4 Hours minimum',
            style: AppTypography.labelSmall.copyWith(
              color: const Color(0xFF1976D2),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildVehicleSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.directions_car,
              size: 20.sp,
              color: AppColors.textSecondary,
            ),
            SizedBox(width: 8.w),
            Text(
              'Select Vehicle',
              style: AppTypography.titleMedium.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            Icon(
              Icons.keyboard_arrow_down,
              size: 20.sp,
              color: AppColors.textSecondary,
            ),
          ],
        ),

        SizedBox(height: 8.h),

        Text(
          'Compare prices for different vehicles you own',
          style: AppTypography.bodySmall.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildServiceTabs() {
    return Container(
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.grey200, width: 1)),
      ),
      child: TabBar(
        controller: _tabController,
        labelColor: const Color(0xFF4A90E2),
        unselectedLabelColor: AppColors.textSecondary,
        indicatorColor: const Color(0xFF4A90E2),
        indicatorWeight: 2,
        labelStyle: AppTypography.bodyMedium.copyWith(
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: AppTypography.bodyMedium,
        tabs: const [
          Tab(text: 'Services'),
          Tab(text: 'Packages'),
          Tab(text: 'Accessories'),
        ],
      ),
    );
  }

  Widget _buildServicesList(Booking booking) {
    return SizedBox(
      height: 400.h,
      child: TabBarView(
        controller: _tabController,
        children: [
          _buildServicesTab(booking),
          _buildPackagesTab(),
          _buildAccessoriesTab(),
        ],
      ),
    );
  }

  Widget _buildServicesTab(Booking booking) {
    return ListView.builder(
      padding: EdgeInsets.only(top: 16.h),
      itemCount: _services.length,
      itemBuilder: (context, index) {
        final service = _services[index];
        final isSelected = service['selected'] as bool;

        return Padding(
          padding: EdgeInsets.only(bottom: 16.h),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  service['name'] as String,
                  style: AppTypography.bodyMedium.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Text(
                '₹${service['price']}',
                style: AppTypography.bodyMedium.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: 12.w),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _services[index]['selected'] = !isSelected;
                  });
                },
                child: Container(
                  width: 24.w,
                  height: 24.w,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? const Color(0xFF4A90E2)
                        : Colors.transparent,
                    border: Border.all(
                      color: isSelected
                          ? const Color(0xFF4A90E2)
                          : AppColors.grey300,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: isSelected
                      ? Icon(Icons.check, color: Colors.white, size: 16.sp)
                      : null,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildPackagesTab() {
    return const Center(child: Text('Packages coming soon'));
  }

  Widget _buildAccessoriesTab() {
    return const Center(child: Text('Accessories coming soon'));
  }

  Widget _buildBottomButton() {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            // Handle next action
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF4A90E2),
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 16.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
          child: Text(
            'Next',
            style: AppTypography.bodyLarge.copyWith(
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildErrorState(Failure failure) {
    return ErrorView(
      failure: failure,
      onRetry: () {
        ref
            .read(bookingDetailStateProvider(widget.bookingId).notifier)
            .initialize();
      },
    );
  }

  Color _getStatusColor(BookingStatus status) {
    return switch (status) {
      BookingStatus.confirmed => AppColors.success,
      BookingStatus.cancelled => AppColors.error,
      BookingStatus.completed => AppColors.primary,
      BookingStatus.pending => Colors.orange,
      BookingStatus.inProgress => AppColors.primary,
      BookingStatus.noShow => AppColors.error,
    };
  }

  void _showCancelBookingDialog(BuildContext context, Booking booking) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Cancel Booking'),
        content: const Text(
          'Are you sure you want to cancel this booking? This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Keep Booking'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ref
                  .read(bookingDetailStateProvider(widget.bookingId).notifier)
                  .cancelBooking();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.error,
              foregroundColor: Colors.white,
            ),
            child: const Text('Cancel Booking'),
          ),
        ],
      ),
    );
  }
}
