import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../application/providers/shop_providers.dart';
import '../components/booking_info_section.dart';
import '../components/confirm_booking_button.dart';
import '../components/payment_method_section.dart';
import '../components/price_details_section.dart';
import '../components/promo_code_section.dart';
import '../components/shop_summary_card.dart';
import '../dialogs/booking_success_dialog.dart';

/// Screen for reviewing and confirming the booking.
class CheckoutScreen extends ConsumerStatefulWidget {
  const CheckoutScreen({super.key});

  @override
  ConsumerState<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends ConsumerState<CheckoutScreen> {
  String? _selectedPaymentMethod;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(checkoutStateProvider.notifier).initialize();
    });
  }

  @override
  Widget build(BuildContext context) {
    final checkoutState = ref.watch(checkoutStateProvider);

    // Handle success state
    ref.listen(checkoutStateProvider, (previous, next) {
      next.maybeWhen(
        success: (confirmation) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => BookingSuccessDialog(
              confirmation: confirmation,
              onViewBooking: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              onBackToHome: () {
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
            ),
          );
        },
        error: (failure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(failure.message),
              backgroundColor: Colors.red,
            ),
          );
        },
        orElse: () {},
      );
    });

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Column(
          children: [
            // App bar
            _buildAppBar(context),

            // Content
            Expanded(
              child: checkoutState.when(
                initial: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                ready: (summary) => SingleChildScrollView(
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    children: [
                      // Shop summary card
                      ShopSummaryCard(shop: summary.shop),
                      SizedBox(height: 16.h),

                      // Booking info
                      BookingInfoSection(summary: summary),
                      SizedBox(height: 16.h),

                      // Price details
                      PriceDetailsSection(summary: summary),
                      SizedBox(height: 16.h),

                      // Promo code
                      PromoCodeSection(
                        onApply: (code) {
                          ref.read(checkoutStateProvider.notifier).applyPromoCode(code);
                        },
                      ),
                      SizedBox(height: 16.h),

                      // Payment method
                      PaymentMethodSection(
                        selectedMethod: _selectedPaymentMethod,
                        onMethodSelected: (method) {
                          setState(() {
                            _selectedPaymentMethod = method;
                          });
                          ref.read(checkoutStateProvider.notifier).selectPaymentMethod(method);
                        },
                      ),
                      SizedBox(height: 100.h),
                    ],
                  ),
                ),
                processing: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                success: (confirmation) => const SizedBox.shrink(),
                error: (failure) => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error_outline,
                        size: 64.sp,
                        color: Colors.red[300],
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        failure.message,
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.grey[600],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 16.h),
                      ElevatedButton(
                        onPressed: () {
                          ref.read(checkoutStateProvider.notifier).refreshSummary();
                        },
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Bottom button
            SafeArea(
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: checkoutState.maybeWhen(
                  ready: (summary) => ConfirmBookingButton(
                    totalPrice: summary.formattedTotalPrice,
                    onPressed: () {
                      ref.read(checkoutStateProvider.notifier).processBooking();
                    },
                  ),
                  processing: () => const ConfirmBookingButton(
                    isLoading: true,
                  ),
                  orElse: () => const SizedBox.shrink(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8.w,
        vertical: 8.h,
      ),
      color: Colors.white,
      child: Row(
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20.sp,
            ),
          ),
          Expanded(
            child: Text(
              'Checkout',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert,
              size: 20.sp,
            ),
          ),
        ],
      ),
    );
  }
}
