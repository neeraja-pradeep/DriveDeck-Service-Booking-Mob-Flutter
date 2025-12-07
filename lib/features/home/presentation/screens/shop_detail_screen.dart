import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../../../app/theme/colors.dart';
import '../../../../app/theme/typography.dart';
import '../../application/providers/shop_details_provider.dart';
import '../../domain/entities/shop_details.dart';
import '../../../booking/application/providers/booking_provider.dart';
import '../../../booking/domain/entities/booking_data.dart';

/// Screen for displaying detailed information about a car wash shop.
class ShopDetailScreen extends ConsumerStatefulWidget {
  const ShopDetailScreen({required this.shopId, super.key});

  final String shopId;

  @override
  ConsumerState<ShopDetailScreen> createState() => _ShopDetailScreenState();
}

class _ShopDetailScreenState extends ConsumerState<ShopDetailScreen> {
  int _currentImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final shopDetailsAsync = ref.watch(shopDetailsProvider(widget.shopId));
    final currentTab = ref.watch(shopDetailTabProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: shopDetailsAsync.when(
        data: (shop) => _buildContent(context, shop, currentTab),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline, size: 48.sp, color: AppColors.error),
              SizedBox(height: 16.h),
              const Text(
                'Failed to load shop details',
                style: AppTypography.bodyLarge,
              ),
              SizedBox(height: 8.h),
              ElevatedButton(
                onPressed: () =>
                    ref.refresh(shopDetailsProvider(widget.shopId)),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    ShopDetails shop,
    ShopDetailTab currentTab,
  ) {
    return Column(
      children: [
        // Top navigation bar with shop name
        _buildTopNavigationBar(shop),

        // Scrollable content
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image carousel
                _buildImageCarousel(shop),

                // Shop info section
                _buildShopInfoSection(shop),

                // Open hours section
                _buildOpenHoursSection(shop),

                // Vehicle selector
                _buildVehicleSelector(shop),

                // Tabs and content
                _buildTabSection(shop, currentTab),
              ],
            ),
          ),
        ),

        // Bottom button
        _buildNextButton(),
      ],
    );
  }

  Widget _buildTopNavigationBar(ShopDetails shop) {
    return Container(
      color: AppColors.grey800,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        left: 8.w,
        right: 8.w,
        bottom: 12.h,
      ),
      child: Row(
        children: [
          // Back button
          IconButton(
            onPressed: () {
              if (context.canPop()) {
                context.pop();
              } else {
                context.go('/home');
              }
            },
            icon: Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(Icons.chevron_left, color: Colors.white, size: 20.sp),
            ),
          ),

          // Shop name
          Expanded(
            child: Text(
              shop.name,
              style: AppTypography.titleMedium.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          // Forward button
          IconButton(
            onPressed: () {
              // Navigate to next shop or action
            },
            icon: Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: AppColors.grey600),
              ),
              child: Icon(
                Icons.chevron_right,
                color: Colors.white,
                size: 20.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageCarousel(ShopDetails shop) {
    if (shop.images.isEmpty) {
      return Container(
        height: 200.h,
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

    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 200.h,
            viewportFraction: 1.0,
            enableInfiniteScroll: shop.images.length > 1,
            autoPlay: shop.images.length > 1,
            autoPlayInterval: const Duration(seconds: 4),
            onPageChanged: (index, reason) {
              setState(() {
                _currentImageIndex = index;
              });
            },
          ),
          items: shop.images.map((imageUrl) {
            return CachedNetworkImage(
              imageUrl: imageUrl,
              width: double.infinity,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                color: AppColors.grey200,
                child: const Center(child: CircularProgressIndicator()),
              ),
              errorWidget: (context, url, error) => Container(
                color: AppColors.grey200,
                child: Icon(
                  Icons.local_car_wash,
                  size: 64.sp,
                  color: AppColors.grey400,
                ),
              ),
            );
          }).toList(),
        ),

        // Page indicator dots
        if (shop.images.length > 1)
          Positioned(
            bottom: 12.h,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                shop.images.length,
                (index) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 3.w),
                  width: _currentImageIndex == index ? 24.w : 8.w,
                  height: 8.h,
                  decoration: BoxDecoration(
                    color: _currentImageIndex == index
                        ? AppColors.primary
                        : Colors.white.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildShopInfoSection(ShopDetails shop) {
    return Container(
      padding: EdgeInsets.all(16.w),
      color: AppColors.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Category and rating row
          Row(
            children: [
              // Category name
              Text(
                shop.category,
                style: AppTypography.titleLarge.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              // Rating
              Icon(Icons.star, color: AppColors.starFilled, size: 18.sp),
              SizedBox(width: 4.w),
              Text(
                '${shop.rating}',
                style: AppTypography.labelMedium.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: 4.w),
              Text(
                '(${shop.reviewCount} reviews)',
                style: AppTypography.labelMedium.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),

          SizedBox(height: 4.h),

          // Location row
          Row(
            children: [
              Text(
                shop.location.area,
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              SizedBox(width: 8.w),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: AppColors.grey200,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  '${shop.location.distanceKm.toInt()} km away',
                  style: AppTypography.labelSmall.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 12.h),

          // Description
          Text(
            shop.description,
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.textSecondary,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOpenHoursSection(ShopDetails shop) {
    return Container(
      padding: EdgeInsets.all(16.w),
      color: AppColors.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Open Hours',
            style: AppTypography.titleMedium.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            '${shop.openHours}  -  ${shop.operatingDays}',
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          SizedBox(height: 12.h),
          // Minimum booking duration
          Text(
            shop.minBookingDuration,
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVehicleSelector(ShopDetails shop) {
    final selectedVehicle = ref.watch(selectedVehicleProvider);

    return Container(
      padding: EdgeInsets.all(16.w),
      color: AppColors.surface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Vehicle dropdown
          Row(
            children: [
              Icon(Icons.directions_car, size: 20.sp, color: AppColors.grey600),
              SizedBox(width: 8.w),
              Expanded(
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<VehicleType>(
                    value: selectedVehicle,
                    hint: const Text(
                      'Select Vehicle',
                      style: AppTypography.bodyMedium,
                    ),
                    icon: const Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColors.textSecondary,
                    ),
                    isExpanded: true,
                    items: shop.vehicleTypes.map((vehicle) {
                      return DropdownMenuItem<VehicleType>(
                        value: vehicle,
                        child: Text(vehicle.name),
                      );
                    }).toList(),
                    onChanged: (value) {
                      if (value != null) {
                        ref
                            .read(selectedVehicleProvider.notifier)
                            .selectVehicle(value);
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            'Compare prizes for different vehicles you own.',
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabSection(ShopDetails shop, ShopDetailTab currentTab) {
    return Container(
      color: AppColors.surface,
      child: Column(
        children: [
          // Tab bar
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                _buildTab('Services', ShopDetailTab.services, currentTab),
                SizedBox(width: 24.w),
                _buildTab('Packages', ShopDetailTab.packages, currentTab),
                SizedBox(width: 24.w),
                _buildTab('Accessories', ShopDetailTab.accessories, currentTab),
              ],
            ),
          ),

          // Divider
          const Divider(height: 1, color: AppColors.grey200),

          // Tab content
          _buildTabContent(shop, currentTab),
        ],
      ),
    );
  }

  Widget _buildTab(String label, ShopDetailTab tab, ShopDetailTab currentTab) {
    final isSelected = currentTab == tab;

    return GestureDetector(
      onTap: () => ref.read(shopDetailTabProvider.notifier).state = tab,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isSelected ? AppColors.primary : Colors.transparent,
              width: 2,
            ),
          ),
        ),
        child: Text(
          label,
          style: AppTypography.labelLarge.copyWith(
            color: isSelected ? AppColors.primary : AppColors.textSecondary,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ),
    );
  }

  Widget _buildTabContent(ShopDetails shop, ShopDetailTab currentTab) {
    switch (currentTab) {
      case ShopDetailTab.services:
        return _buildServicesList(shop.services);
      case ShopDetailTab.packages:
        return _buildPackagesList(shop.packages);
      case ShopDetailTab.accessories:
        return _buildAccessoriesList(shop.accessories);
    }
  }

  Widget _buildServicesList(List<Service> services) {
    final selectedServices = ref.watch(selectedServicesProvider);

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: 8.h),
      itemCount: services.length,
      separatorBuilder: (_, __) => Divider(
        height: 1,
        color: AppColors.grey200,
        indent: 16.w,
        endIndent: 16.w,
      ),
      itemBuilder: (context, index) {
        final service = services[index];
        final isSelected = selectedServices.containsKey(service.id);

        return _buildItemTile(
          name: service.name,
          price: service.price,
          isSelected: isSelected,
          onTap: () {
            ref.read(selectedServicesProvider.notifier).toggleService(service);
          },
        );
      },
    );
  }

  Widget _buildPackagesList(List<Package> packages) {
    final selectedPackages = ref.watch(selectedPackagesProvider);

    if (packages.isEmpty) {
      return Padding(
        padding: EdgeInsets.all(32.w),
        child: Center(
          child: Text(
            'No packages available',
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ),
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: 8.h),
      itemCount: packages.length,
      separatorBuilder: (_, __) => Divider(
        height: 1,
        color: AppColors.grey200,
        indent: 16.w,
        endIndent: 16.w,
      ),
      itemBuilder: (context, index) {
        final package = packages[index];
        final isSelected = selectedPackages.containsKey(package.id);

        return _buildItemTile(
          name: package.name,
          price: package.price,
          isSelected: isSelected,
          onTap: () {
            ref.read(selectedPackagesProvider.notifier).togglePackage(package);
          },
        );
      },
    );
  }

  Widget _buildAccessoriesList(List<Accessory> accessories) {
    final selectedAccessories = ref.watch(selectedAccessoriesProvider);

    if (accessories.isEmpty) {
      return Padding(
        padding: EdgeInsets.all(32.w),
        child: Center(
          child: Text(
            'No accessories available',
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ),
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(vertical: 8.h),
      itemCount: accessories.length,
      separatorBuilder: (_, __) => Divider(
        height: 1,
        color: AppColors.grey200,
        indent: 16.w,
        endIndent: 16.w,
      ),
      itemBuilder: (context, index) {
        final accessory = accessories[index];
        final isSelected = selectedAccessories.containsKey(accessory.id);

        return _buildItemTile(
          name: accessory.name,
          price: accessory.price,
          isSelected: isSelected,
          onTap: () {
            ref
                .read(selectedAccessoriesProvider.notifier)
                .toggleAccessory(accessory);
          },
        );
      },
    );
  }

  Widget _buildItemTile({
    required String name,
    required double price,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Row(
          children: [
            // Item name
            Expanded(
              child: Text(
                name,
                style: AppTypography.bodyMedium.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            // Price
            Text(
              '\u20B9${price.toInt()}',
              style: AppTypography.bodyMedium.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),

            SizedBox(width: 16.w),

            // Checkbox
            Container(
              width: 24.w,
              height: 24.h,
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : Colors.transparent,
                border: Border.all(
                  color: isSelected ? AppColors.primary : AppColors.grey400,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: isSelected
                  ? Icon(Icons.check, size: 16.sp, color: Colors.white)
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNextButton() {
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
              // Navigate to time selection screen
              _navigateToTimeSelection();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.r),
              ),
            ),
            child: Text(
              'Next',
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

  void _navigateToTimeSelection() {
    final totalCount = ref.read(totalSelectedCountProvider);
    final selectedServices = ref.read(selectedServicesProvider);
    final selectedPackages = ref.read(selectedPackagesProvider);
    final selectedAccessories = ref.read(selectedAccessoriesProvider);
    final selectedVehicle = ref.read(selectedVehicleProvider);
    final shopDetailsAsync = ref.read(shopDetailsProvider(widget.shopId));

    if (totalCount == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please select at least one service, package, or accessory',
          ),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    // Initialize booking data
    shopDetailsAsync.whenData((shop) {
      final bookingNotifier = ref.read(bookingDataProvider.notifier);

      // Convert selected items to SelectedItem format
      final services = selectedServices.values
          .map((s) => SelectedItem(id: s.id, name: s.name, price: s.price))
          .toList();

      final packages = selectedPackages.values
          .map((p) => SelectedItem(id: p.id, name: p.name, price: p.price))
          .toList();

      final accessories = selectedAccessories.values
          .map((a) => SelectedItem(id: a.id, name: a.name, price: a.price))
          .toList();

      bookingNotifier.initializeBooking(
        shopId: widget.shopId,
        shopName: shop.name,
        shopImageUrl: shop.images.isNotEmpty ? shop.images.first : '',
        shopAddress: shop.location.area,
        shopRating: shop.rating,
        selectedServices: services,
        selectedPackages: packages,
        selectedAccessories: accessories,
        vehicleType: selectedVehicle?.name,
        vehicleId: selectedVehicle?.id,
      );

      // Navigate to time selection screen
      context.push('/time-selection');
    });
  }
}
