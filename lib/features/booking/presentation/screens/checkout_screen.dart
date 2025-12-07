import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../app/theme/colors.dart';
import '../../../../app/theme/typography.dart';
import '../../application/providers/booking_provider.dart';
import '../../domain/entities/booking_data.dart';

/// Checkout screen for reviewing and confirming booking.
class CheckoutScreen extends ConsumerWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookingData = ref.watch(bookingDataProvider);

    if (bookingData == null) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline, size: 48.sp, color: AppColors.error),
              SizedBox(height: 16.h),
              Text('No booking data found', style: AppTypography.bodyLarge),
              SizedBox(height: 16.h),
              ElevatedButton(
                onPressed: () => context.go('/home'),
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
            _buildSelectPaymentButton(context, bookingData),
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
                context.go('/home');
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
            icon: Icon(Icons.more_vert, color: AppColors.textPrimary),
          ),
        ],
      ),
    );
  }

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
          Divider(color: AppColors.grey200),
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
                  Icon(Icons.chevron_right, color: AppColors.primary),
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
  ) {
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
            onPressed: () {
              // Show payment methods or complete booking
              _showPaymentOptions(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.r),
              ),
            ),
            child: Text(
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
      builder: (context) => Container(
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
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
            ),

            Divider(height: 1, color: AppColors.grey200),

            // Payment options
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(16.w),
                children: [
                  _buildPaymentOption(
                    context,
                    icon: Icons.credit_card,
                    title: 'Credit/Debit Card',
                    subtitle: 'Pay with Visa, Mastercard, etc.',
                  ),
                  SizedBox(height: 12.h),
                  _buildPaymentOption(
                    context,
                    icon: Icons.account_balance_wallet,
                    title: 'Digital Wallet',
                    subtitle: 'Google Pay, Apple Pay',
                  ),
                  SizedBox(height: 12.h),
                  _buildPaymentOption(
                    context,
                    icon: Icons.money,
                    title: 'Cash on Delivery',
                    subtitle: 'Pay when service is completed',
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
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Booking confirmed with $title!'),
            behavior: SnackBarBehavior.floating,
          ),
        );
        // Navigate to confirmation or home
        context.go('/home');
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
            Icon(Icons.chevron_right, color: AppColors.textSecondary),
          ],
        ),
      ),
    );
  }
}
