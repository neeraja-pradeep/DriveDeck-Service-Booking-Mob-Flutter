import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../application/providers/shop_providers.dart';
import '../../domain/entities/shop_tab.dart';
import '../components/accessories_placeholder.dart';
import '../components/next_floating_button.dart';
import '../components/opening_hours_section.dart';
import '../components/packages_placeholder.dart';
import '../components/service_list_item.dart';
import '../components/shop_description_section.dart';
import '../components/shop_image_carousel.dart';
import '../components/shop_info_section.dart';
import '../components/shop_tab_bar.dart';
import '../components/vehicle_type_dropdown.dart';

/// Arguments for ShopDetailScreen.
class ShopDetailScreenArgs {
  final String shopId;
  final String shopName;

  const ShopDetailScreenArgs({
    required this.shopId,
    required this.shopName,
  });
}

/// Screen displaying shop details and service selection.
class ShopDetailScreen extends ConsumerStatefulWidget {
  final ShopDetailScreenArgs args;

  const ShopDetailScreen({
    super.key,
    required this.args,
  });

  @override
  ConsumerState<ShopDetailScreen> createState() => _ShopDetailScreenState();
}

class _ShopDetailScreenState extends ConsumerState<ShopDetailScreen> {
  @override
  void initState() {
    super.initState();
    // Initialize the shop detail notifier
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(currentShopIdProvider.notifier).state = widget.args.shopId;
      ref.read(shopDetailStateProvider(widget.args.shopId).notifier).initialize();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(shopDetailStateProvider(widget.args.shopId));
    final notifier = ref.read(shopDetailStateProvider(widget.args.shopId).notifier);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // App bar
            _buildAppBar(context, state),

            // Content
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  await notifier.refresh();
                },
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Shop state content
                      state.shopState.when(
                        initial: () => const SizedBox.shrink(),
                        loading: () => _buildShopShimmer(),
                        error: (failure) => _buildError(failure.message),
                        loaded: (shop, fromCache) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Image carousel
                            ShopImageCarousel(imageUrls: shop.images),
                            SizedBox(height: 16.h),

                            // Shop info
                            ShopInfoSection(shop: shop),
                            SizedBox(height: 16.h),

                            // Description
                            ShopDescriptionSection(description: shop.description),
                            SizedBox(height: 16.h),

                            // Opening hours
                            OpeningHoursSection(hours: shop.openingHours),
                            SizedBox(height: 16.h),

                            // Vehicle type dropdown
                            VehicleTypeDropdown(
                              selectedType: state.selectedVehicleType,
                              onChanged: notifier.selectVehicleType,
                            ),
                            SizedBox(height: 16.h),

                            // Divider
                            Divider(
                              color: Colors.grey[200],
                              thickness: 8.h,
                            ),
                            SizedBox(height: 16.h),

                            // Tab bar
                            ShopTabBar(
                              selectedTab: state.selectedTab,
                              onTabSelected: notifier.selectTab,
                            ),
                            SizedBox(height: 16.h),

                            // Tab content
                            _buildTabContent(state, notifier),
                          ],
                        ),
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
                child: NextFloatingButton(
                  isEnabled: state.canProceed,
                  selectedCount: state.selectedServicesCount,
                  onPressed: () {
                    notifier.proceedToDateSelection();
                    Navigator.pushNamed(
                      context,
                      '/booking/date-time',
                      arguments: widget.args.shopId,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context, state) {
    final shopName = state.shopState.maybeMap(
      loaded: (s) => s.shop.name,
      orElse: () => widget.args.shopName,
    );

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8.w,
        vertical: 8.h,
      ),
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
              shopName,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_forward_ios,
              size: 20.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabContent(state, notifier) {
    switch (state.selectedTab) {
      case ShopTab.services:
        return state.servicesState.when(
          initial: () => const SizedBox.shrink(),
          loading: () => _buildServicesShimmer(),
          error: (failure) => _buildError(failure.message),
          loaded: (services) {
            if (services.isEmpty) {
              return _buildEmptyServices();
            }
            return Column(
              children: services.map((service) {
                final isSelected = state.selectedServiceIds.contains(service.id);
                return ServiceListItem(
                  service: service,
                  isSelected: isSelected,
                  onToggle: () => notifier.toggleServiceSelection(service.id),
                );
              }).toList(),
            );
          },
        );
      case ShopTab.packages:
        return const PackagesPlaceholder();
      case ShopTab.accessories:
        return const AccessoriesPlaceholder();
    }
  }

  Widget _buildShopShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 250.h,
            width: double.infinity,
            color: Colors.white,
          ),
          SizedBox(height: 16.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 24.h,
                  width: 200.w,
                  color: Colors.white,
                ),
                SizedBox(height: 8.h),
                Container(
                  height: 16.h,
                  width: 150.w,
                  color: Colors.white,
                ),
                SizedBox(height: 8.h),
                Container(
                  height: 16.h,
                  width: 250.w,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServicesShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        children: List.generate(
          4,
          (index) => Container(
            margin: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 8.h,
            ),
            height: 80.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildError(String message) {
    return Padding(
      padding: EdgeInsets.all(32.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 48.sp,
            color: Colors.red[300],
          ),
          SizedBox(height: 16.h),
          Text(
            message,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyServices() {
    return Padding(
      padding: EdgeInsets.all(32.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.car_repair,
            size: 48.sp,
            color: Colors.grey[400],
          ),
          SizedBox(height: 16.h),
          Text(
            'No services available',
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
