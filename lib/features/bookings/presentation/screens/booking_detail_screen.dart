import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/theme/colors.dart';
import '../../../../app/theme/typography.dart';
import '../../../../core/error/error_view.dart';
import '../../../../core/error/failure.dart';
import '../../application/providers/bookings_providers.dart';
import '../../application/states/booking_detail_state.dart';
import '../../domain/entities/booking.dart';
import '../../domain/entities/booking_status.dart';

/// Screen for displaying booking details matching the design.
class BookingDetailScreen extends ConsumerStatefulWidget {
  const BookingDetailScreen({super.key, required this.bookingId});

  final String bookingId;

  @override
  ConsumerState<BookingDetailScreen> createState() =>
      _BookingDetailScreenState();
}

class _BookingDetailScreenState extends ConsumerState<BookingDetailScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(bookingDetailStateProvider(widget.bookingId).notifier)
          .initialize();
    });
  }

  @override
  Widget build(BuildContext context) {
    final bookingDetailState = ref.watch(
      bookingDetailStateProvider(widget.bookingId),
    );

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.textPrimary,
            size: 24.sp,
          ),
        ),
        title: Text(
          'Details',
          style: AppTypography.titleLarge.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              // Menu action
            },
            icon: Icon(
              Icons.more_vert,
              color: AppColors.textPrimary,
              size: 24.sp,
            ),
          ),
        ],
      ),
      body: _buildBody(bookingDetailState),
    );
  }

  Widget _buildBody(BookingDetailState state) {
    return switch (state) {
      BookingDetailStateInitial() => _buildLoadingState(),
      BookingDetailStateLoading() => _buildLoadingState(),
      BookingDetailStateCancelling() => _buildLoadingState(),
      BookingDetailStateLoaded(booking: final booking) =>
        _buildLoadedState(booking),
      BookingDetailStateCancelled(booking: final booking) =>
        _buildLoadedState(booking),
      BookingDetailStateError(failure: final failure) =>
        _buildErrorState(failure),
    };
  }

  Widget _buildLoadingState() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildLoadedState(Booking booking) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Center Section
          _buildCenterSection(booking),

          SizedBox(height: 12.h),

          // Location Section
          _buildLocationSection(booking),

          SizedBox(height: 12.h),

          // Your Booking Section
          _buildYourBookingSection(booking),

          SizedBox(height: 16.h),

          // Progress Tracker
          _buildProgressTracker(booking),

          SizedBox(height: 32.h),
        ],
      ),
    );
  }

  Widget _buildCenterSection(Booking booking) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Center',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.textSecondary,
            ),
          ),
          SizedBox(height: 12.h),
          // Shop Card
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: AppColors.grey200),
            ),
            child: Row(
              children: [
                // Shop Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: SizedBox(
                    width: 70.w,
                    height: 70.h,
                    child: CachedNetworkImage(
                      imageUrl: booking.shopImageUrl,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Container(
                        color: AppColors.grey200,
                        child: Icon(
                          Icons.local_car_wash,
                          color: AppColors.grey400,
                          size: 24.sp,
                        ),
                      ),
                      errorWidget: (context, url, error) => Container(
                        color: AppColors.grey200,
                        child: Icon(
                          Icons.local_car_wash,
                          color: AppColors.grey400,
                          size: 24.sp,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                // Shop Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              booking.shopName,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textPrimary,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.amber, size: 16.sp),
                              SizedBox(width: 4.w),
                              Text(
                                '4.7',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: AppColors.textSecondary,
                            size: 14.sp,
                          ),
                          SizedBox(width: 4.w),
                          Expanded(
                            child: Text(
                              booking.fullLocation,
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: AppColors.textSecondary,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      if (booking.pickupAndDelivery) ...[
                        SizedBox(height: 6.h),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primaryLight,
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                          child: Text(
                            'Pickup & Delivery',
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLocationSection(Booking booking) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Location',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textSecondary,
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Open map
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Open Map coming soon'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
                child: Text(
                  'Open Map',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          // Map Preview
          Container(
            height: 120.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.grey100,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: AppColors.grey200),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Stack(
                children: [
                  // Map placeholder with grid pattern
                  CustomPaint(
                    size: Size(double.infinity, 120.h),
                    painter: _MapPlaceholderPainter(),
                  ),
                  // Location pin
                  Center(
                    child: Container(
                      width: 36.w,
                      height: 36.h,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primary.withValues(alpha: 0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.location_on,
                        color: Colors.white,
                        size: 18.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildYourBookingSection(Booking booking) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your Booking',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
            ),
          ),
          SizedBox(height: 16.h),
          _buildBookingDetailRow(
            icon: Icons.calendar_today_outlined,
            label: 'Date',
            value: _formatDate(booking.bookingDate),
          ),
          SizedBox(height: 12.h),
          _buildBookingDetailRow(
            icon: Icons.person_outline,
            label: 'Guest',
            value: booking.timeSlot.displayTime,
          ),
          SizedBox(height: 12.h),
          _buildBookingDetailRow(
            icon: Icons.local_car_wash_outlined,
            label: 'Room type',
            value: booking.primaryServiceName,
          ),
          SizedBox(height: 12.h),
          _buildBookingDetailRow(
            icon: Icons.phone_outlined,
            label: 'Phone',
            value: '+91 6525 65 45 45',
          ),
        ],
      ),
    );
  }

  Widget _buildBookingDetailRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Icon(icon, color: AppColors.textSecondary, size: 20.sp),
        SizedBox(width: 12.w),
        Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            color: AppColors.textSecondary,
          ),
        ),
        const Spacer(),
        Text(
          value,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }

  Widget _buildProgressTracker(Booking booking) {
    final currentStep = _getStatusStep(booking.status);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          _buildProgressStep(
            stepNumber: 1,
            label: 'Booking\nConfirmed',
            isCompleted: currentStep >= 1,
            isActive: currentStep == 1,
          ),
          _buildProgressLine(isCompleted: currentStep >= 2),
          _buildProgressStep(
            stepNumber: 2,
            label: 'Vehicle\nPicked Up',
            isCompleted: currentStep >= 2,
            isActive: currentStep == 2,
          ),
          _buildProgressLine(isCompleted: currentStep >= 3),
          _buildProgressStep(
            stepNumber: 3,
            label: 'Service in\nProgress',
            isCompleted: currentStep >= 3,
            isActive: currentStep == 3,
          ),
          _buildProgressLine(isCompleted: currentStep >= 4),
          _buildProgressStep(
            stepNumber: 4,
            label: 'Delivered\nSuccessfully',
            isCompleted: currentStep >= 4,
            isActive: currentStep == 4,
          ),
        ],
      ),
    );
  }

  Widget _buildProgressStep({
    required int stepNumber,
    required String label,
    required bool isCompleted,
    required bool isActive,
  }) {
    return Expanded(
      child: Column(
        children: [
          Container(
            width: 26.w,
            height: 26.h,
            decoration: BoxDecoration(
              color: isCompleted ? Colors.white : Colors.white.withValues(alpha: 0.3),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: isCompleted && stepNumber == 1
                  ? Icon(Icons.check, color: AppColors.primary, size: 14.sp)
                  : Text(
                      stepNumber.toString(),
                      style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w600,
                        color: isCompleted ? AppColors.primary : Colors.white,
                      ),
                    ),
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            label,
            style: TextStyle(
              fontSize: 8.sp,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildProgressLine({required bool isCompleted}) {
    return Container(
      width: 16.w,
      height: 2.h,
      color: isCompleted ? Colors.white : Colors.white.withValues(alpha: 0.3),
    );
  }

  int _getStatusStep(BookingStatus status) {
    return switch (status) {
      BookingStatus.pending => 0,
      BookingStatus.confirmed => 1,
      BookingStatus.inProgress => 3,
      BookingStatus.completed => 4,
      BookingStatus.cancelled => 0,
      BookingStatus.noShow => 0,
    };
  }

  String _formatDate(DateTime date) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
    ];
    return '${date.day} - ${months[date.month - 1]} ${date.year}';
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
}

/// Custom painter for map placeholder
class _MapPlaceholderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFD8D8D8)
      ..strokeWidth = 1;

    final bgPaint = Paint()..color = const Color(0xFFEEEEEE);
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), bgPaint);

    // Draw horizontal lines
    for (var i = 0.0; i < size.height; i += 25) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }

    // Draw vertical lines
    for (var i = 0.0; i < size.width; i += 35) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
