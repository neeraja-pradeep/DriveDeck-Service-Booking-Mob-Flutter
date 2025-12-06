import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/theme/colors.dart';
import '../../../../app/theme/typography.dart';
import '../../domain/entities/car_wash_shop.dart';
import '../components/shop_detail_header.dart';
import '../components/shop_services_section.dart';
import '../components/shop_info_section.dart';

/// Screen for displaying detailed information about a car wash shop.
class ShopDetailScreen extends ConsumerWidget {
  const ShopDetailScreen({required this.shopId, super.key});

  final String shopId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // For now, we'll create a mock shop. In a real app, you'd fetch this from a provider
    final shop = _getMockShop(shopId);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          // App bar with shop image
          SliverAppBar(
            expandedHeight: 250.h,
            pinned: true,
            backgroundColor: AppColors.surface,
            leading: IconButton(
              icon: Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.3),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.arrow_back, color: Colors.white, size: 20.sp),
              ),
              onPressed: () => context.pop(),
            ),
            actions: [
              IconButton(
                icon: Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.3),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    shop.isWishlisted ? Icons.favorite : Icons.favorite_border,
                    color: shop.isWishlisted ? AppColors.error : Colors.white,
                    size: 20.sp,
                  ),
                ),
                onPressed: () {
                  // TODO: Toggle wishlist
                },
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: shop.image != null
                  ? Image.network(
                      shop.image!,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          _buildPlaceholderImage(),
                    )
                  : _buildPlaceholderImage(),
            ),
          ),

          // Shop details content
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Shop header with name, rating, etc.
                ShopDetailHeader(shop: shop),

                SizedBox(height: 24.h),

                // Services section
                ShopServicesSection(shop: shop),

                SizedBox(height: 24.h),

                // Shop info section (address, hours, contact)
                ShopInfoSection(shop: shop),

                SizedBox(height: 100.h), // Space for floating button
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          _showBookingBottomSheet(context, shop);
        },
        backgroundColor: AppColors.primary,
        label: const Text(
          'Book Now',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
        icon: const Icon(Icons.calendar_today, color: Colors.white),
      ),
    );
  }

  Widget _buildPlaceholderImage() {
    return Container(
      color: AppColors.grey200,
      child: Center(
        child: Icon(
          Icons.local_car_wash,
          size: 64.sp,
          color: AppColors.grey400,
        ),
      ),
    );
  }

  void _showBookingBottomSheet(BuildContext context, CarWashShop shop) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.7,
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
                      'Book Service at ${shop.name}',
                      style: AppTypography.titleMedium,
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
            ),

            // Booking form content
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    Text(
                      'Booking functionality coming soon!',
                      style: AppTypography.bodyLarge.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'You\'ll be able to select services, choose time slots, and complete your booking here.',
                      style: AppTypography.bodyMedium.copyWith(
                        color: AppColors.textSecondary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Mock shop data - in a real app, this would come from a provider/API
  CarWashShop _getMockShop(String shopId) {
    return CarWashShop(
      id: int.tryParse(shopId) ?? 1,
      name: 'Auto Car Spa',
      description:
          'Premium car wash and detailing services with eco-friendly products. We provide comprehensive car care solutions.',
      image: 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=800',
      address: '123 Main Street, Downtown Area',
      phone: '+1 (555) 123-4567',
      latitude: 37.7749,
      longitude: -122.4194,
      rating: 4.5,
      reviewCount: 128,
      distance: 0.8,
      openingTime: '08:00',
      closingTime: '18:00',
      isOpen: true,
      isWishlisted: false,
      services: [
        'Basic Wash',
        'Premium Wash',
        'Interior Cleaning',
        'Wax & Polish',
        'Engine Cleaning',
      ],
      priceRange: '\$15 - \$50',
    );
  }
}
