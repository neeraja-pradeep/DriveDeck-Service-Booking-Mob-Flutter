import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../app/theme/colors.dart';
import '../../../../app/theme/typography.dart';
// 1. Import your app routes
import '../../../../app/router/routes.dart';
import '../../../shop/domain/entities/booking_confirmation.dart';
import '../../application/providers/booking_provider.dart';
import '../../domain/entities/booking_data.dart';

/// Checkout screen for reviewing and confirming booking.
class CheckoutScreen extends ConsumerStatefulWidget {
  const CheckoutScreen({super.key});

  @override
  ConsumerState<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends ConsumerState<CheckoutScreen> {
  @override
  void initState() {
    super.initState();
    // Reset booking creation state when entering checkout
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(bookingCreationProvider.notifier).reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    final bookingData = ref.watch(bookingDataProvider);
    final bookingCreationState = ref.watch(bookingCreationProvider);

    // Listen for booking creation state changes
    ref.listen<BookingCreationState>(bookingCreationProvider, (previous, next) {
      // 1. Handle Payment Success (Razorpay Flow)
      if (next is BookingPaymentSuccess) {
        final bookingId = next.verifyResponse.bookingId;

        // ✅ UPDATED: Use BookingDetailRoute type-safe navigation
        BookingDetailRoute(bookingId: bookingId.toString()).go(context);
      }
      // 2. Handle Standard Creation Success (Non-Payment Flow)
      else if (next is BookingCreationSuccess) {
        _showBookingSuccessDialog(context, next.confirmation);
      }
      // 3. Handle Errors
      else if (next is BookingCreationError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.failure.message ?? 'Booking failed'),
            backgroundColor: AppColors.error,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    });

    if (bookingData == null) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline, size: 48.sp, color: AppColors.error),
              SizedBox(height: 16.h),
              const Text(
                'No booking data found',
                style: AppTypography.bodyLarge,
              ),
              SizedBox(height: 16.h),
              ElevatedButton(
                onPressed: () => const HomeRoute().go(
                  context,
                ), // Updated to type-safe if available
                child: const Text('Go to Home'),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            _buildHeader(context),

            // Content
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Shop card
                    _buildShopCard(bookingData),

                    SizedBox(height: 16.h),

                    // Your booking section
                    _buildYourBookingSection(bookingData),

                    SizedBox(height: 16.h),

                    // Price details section
                    _buildPriceDetailsSection(bookingData),

                    SizedBox(height: 16.h),

                    // Promo section
                    _buildPromoSection(context, ref, bookingData),

                    SizedBox(height: 24.h),
                  ],
                ),
              ),
            ),

            // Select payment button
            _buildSelectPaymentButton(
              context,
              bookingData,
              bookingCreationState,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      color: AppColors.surface,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              if (context.canPop()) {
                context.pop();
              } else {
                const HomeRoute().go(context);
              }
            },
            child: Icon(
              Icons.arrow_back,
              size: 24.sp,
              color: AppColors.textPrimary,
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Text(
              'Checkout',
              style: AppTypography.titleLarge.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              // More options
            },
            icon: const Icon(Icons.more_vert, color: AppColors.textPrimary),
          ),
        ],
      ),
    );
  }

  // ... (Keep _buildShopCard, _buildYourBookingSection, _buildInfoRow, _buildPriceDetailsSection, _buildPriceRow as they were) ...

  // NOTE: I've omitted the middle UI widgets for brevity as they haven't changed.
  // Paste them back here if you are copying the full file.

  Widget _buildShopCard(BookingData bookingData) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Shop image
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: bookingData.shopImageUrl.isNotEmpty
                ? CachedNetworkImage(
                    imageUrl: bookingData.shopImageUrl,
                    width: 80.w,
                    height: 80.h,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      color: AppColors.grey200,
                      child: const Center(child: CircularProgressIndicator()),
                    ),
                    errorWidget: (context, url, error) => Container(
                      color: AppColors.grey200,
                      child: Icon(
                        Icons.local_car_wash,
                        size: 32.sp,
                        color: AppColors.grey400,
                      ),
                    ),
                  )
                : Container(
                    width: 80.w,
                    height: 80.h,
                    color: AppColors.grey200,
                    child: Icon(
                      Icons.local_car_wash,
                      size: 32.sp,
                      color: AppColors.grey400,
                    ),
                  ),
          ),

          SizedBox(width: 12.w),

          // Shop info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        bookingData.shopName,
                        style: AppTypography.titleMedium.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Icon(Icons.star, color: AppColors.starFilled, size: 16.sp),
                    SizedBox(width: 4.w),
                    Text(
                      '${bookingData.shopRating}',
                      style: AppTypography.labelMedium.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 14.sp,
                      color: AppColors.textSecondary,
                    ),
                    SizedBox(width: 4.w),
                    Expanded(
                      child: Text(
                        bookingData.shopAddress,
                        style: AppTypography.bodySmall.copyWith(
                          color: AppColors.textSecondary,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildYourBookingSection(BookingData bookingData) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your Booking',
            style: AppTypography.titleMedium.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 16.h),

          // Dates
          _buildInfoRow(
            icon: Icons.calendar_today_outlined,
            label: 'Dates',
            value: bookingData.formattedDate.isNotEmpty
                ? bookingData.formattedDate
                : 'Not selected',
          ),

          SizedBox(height: 12.h),

          // Slot
          _buildInfoRow(
            icon: Icons.access_time_outlined,
            label: 'Slot',
            value: bookingData.selectedTimeSlot ?? 'Not selected',
          ),

          SizedBox(height: 12.h),

          // Service type
          _buildInfoRow(
            icon: Icons.local_car_wash_outlined,
            label: 'Service type',
            value: bookingData.primaryServiceName,
          ),

          SizedBox(height: 12.h),

          // Phone
          _buildInfoRow(
            icon: Icons.phone_outlined,
            label: 'Phone',
            value: bookingData.phoneNumber ?? '0214345646',
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Icon(icon, size: 20.sp, color: AppColors.textSecondary),
        SizedBox(width: 12.w),
        Expanded(
          child: Text(
            label,
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ),
        Text(
          value,
          style: AppTypography.bodyMedium.copyWith(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _buildPriceDetailsSection(BookingData bookingData) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Price Details',
            style: AppTypography.titleMedium.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 16.h),

          // Price
          _buildPriceRow(
            'Price',
            '\$${bookingData.subtotal.toStringAsFixed(2)}',
          ),

          SizedBox(height: 12.h),

          // Admin fee
          _buildPriceRow(
            'Admin fee',
            '\$${bookingData.adminFee.toStringAsFixed(2)}',
          ),

          if (bookingData.discount > 0) ...[
            SizedBox(height: 12.h),
            _buildPriceRow(
              'Discount',
              '-\$${bookingData.discount.toStringAsFixed(2)}',
              isDiscount: true,
            ),
          ],

          SizedBox(height: 12.h),
          const Divider(color: AppColors.grey200),
          SizedBox(height: 12.h),

          // Total price
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total price',
                style: AppTypography.bodyMedium.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '\$${bookingData.totalPrice.toStringAsFixed(2)}',
                style: AppTypography.titleMedium.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPriceRow(String label, String value, {bool isDiscount = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTypography.bodyMedium.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        Text(
          value,
          style: AppTypography.bodyMedium.copyWith(
            fontWeight: FontWeight.w500,
            color: isDiscount ? AppColors.success : AppColors.textPrimary,
          ),
        ),
      ],
    );
  }

  Widget _buildPromoSection(
    BuildContext context,
    WidgetRef ref,
    BookingData bookingData,
  ) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Promo',
            style: AppTypography.titleMedium.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 12.h),
          GestureDetector(
            onTap: () {
              _showPromoCodeDialog(context, ref);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
              decoration: BoxDecoration(
                color: AppColors.grey50,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: AppColors.grey200),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.local_offer_outlined,
                    size: 20.sp,
                    color: AppColors.primary,
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Text(
                      bookingData.promoCode ?? 'Select',
                      style: AppTypography.bodyMedium.copyWith(
                        color: bookingData.promoCode != null
                            ? AppColors.textPrimary
                            : AppColors.textHint,
                      ),
                    ),
                  ),
                  const Icon(Icons.chevron_right, color: AppColors.primary),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showPromoCodeDialog(BuildContext context, WidgetRef ref) {
    final controller = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Enter Promo Code'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: 'Enter code',
            border: OutlineInputBorder(),
          ),
          textCapitalization: TextCapitalization.characters,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (controller.text.isNotEmpty) {
                // Apply promo code with mock discount
                ref
                    .read(bookingDataProvider.notifier)
                    .applyPromoCode(
                      controller.text.toUpperCase(),
                      10.0, // Mock discount
                    );
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Promo code applied!'),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              }
            },
            child: const Text('Apply'),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectPaymentButton(
    BuildContext context,
    BookingData bookingData,
    BookingCreationState bookingCreationState,
  ) {
    final isLoading = bookingCreationState is BookingCreationLoading;

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          width: double.infinity,
          height: 48.h,
          child: ElevatedButton(
            onPressed: isLoading
                ? null
                : () {
                    // Show payment methods or complete booking
                    _showPaymentOptions(context);
                  },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              disabledBackgroundColor: AppColors.primary.withValues(alpha: 0.6),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.r),
              ),
            ),
            child: isLoading
                ? SizedBox(
                    height: 24.h,
                    width: 24.w,
                    child: const CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  )
                : Text(
                    'Select Payment',
                    style: AppTypography.labelLarge.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  void _showPaymentOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (sheetContext) => Container(
        height: MediaQuery.of(context).size.height * 0.5,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        ),
        child: Column(
          children: [
            // Handle bar
            Container(
              margin: EdgeInsets.only(top: 12.h),
              width: 40.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: AppColors.grey300,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),

            // Header
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Select Payment Method',
                      style: AppTypography.titleMedium.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(sheetContext),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
            ),

            const Divider(height: 1, color: AppColors.grey200),

            // Payment options
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(16.w),
                children: [
                  _buildPaymentOption(
                    sheetContext,
                    icon: Icons.credit_card,
                    title: 'Credit/Debit Card',
                    subtitle: 'Pay with Visa, Mastercard, etc.',
                    paymentMethod: 'credit_card',
                  ),
                  SizedBox(height: 12.h),
                  _buildPaymentOption(
                    sheetContext,
                    icon: Icons.account_balance_wallet,
                    title: 'Digital Wallet',
                    subtitle: 'Google Pay, Apple Pay',
                    paymentMethod: 'digital_wallet',
                  ),
                  SizedBox(height: 12.h),
                  _buildPaymentOption(
                    sheetContext,
                    icon: Icons.money,
                    title: 'Cash on Delivery',
                    subtitle: 'Pay when service is completed',
                    paymentMethod: 'cash',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentOption(
    BuildContext sheetContext, {
    required IconData icon,
    required String title,
    required String subtitle,
    required String paymentMethod,
  }) {
    return InkWell(
      onTap: () async {
        // Close the bottom sheet
        Navigator.pop(sheetContext);

        // Create the booking via API
        await ref
            .read(bookingCreationProvider.notifier)
            .createBooking(paymentMethod: paymentMethod);
      },
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.grey200),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(icon, color: AppColors.primary),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTypography.bodyMedium.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    subtitle,
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: AppColors.textSecondary),
          ],
        ),
      ),
    );
  }

  /// Show success dialog after booking is created.
  void _showBookingSuccessDialog(
    BuildContext context,
    BookingConfirmation confirmation,
  ) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: AppColors.success.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.check_circle,
                color: AppColors.success,
                size: 48.sp,
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              'Booking Confirmed!',
              style: AppTypography.titleLarge.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Your booking has been successfully created.',
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.h),
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: AppColors.grey50,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Column(
                children: [
                  Text(
                    'Booking Reference',
                    style: AppTypography.labelSmall.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    confirmation.bookingReference,
                    style: AppTypography.titleMedium.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(dialogContext);
                      // ✅ UPDATED: Use type-safe HomeRoute
                      const HomeRoute().go(context);
                    },
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: AppColors.primary),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    child: Text(
                      'Home',
                      style: AppTypography.labelMedium.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(dialogContext);
                      // ✅ UPDATED: Use type-safe BookingsRoute (List)
                      const BookingsRoute().go(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    child: Text(
                      'View Bookings',
                      style: AppTypography.labelMedium.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
