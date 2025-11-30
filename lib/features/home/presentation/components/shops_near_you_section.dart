import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/theme/colors.dart';
import '../../../../app/theme/typography.dart';
import '../../application/providers/home_provider.dart';
import '../../domain/entities/car_wash_shop.dart';
import 'shop_card.dart';
import 'shimmer_widgets.dart';

/// Section displaying car wash shops near the user.
class ShopsNearYouSection extends ConsumerWidget {
  const ShopsNearYouSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shopsState = ref.watch(shopsNearYouProvider);
    final searchQuery = ref.watch(searchQueryProvider);
    final searchResults = ref.watch(searchResultsProvider);

    // Show search results if there's a search query
    if (searchQuery.isNotEmpty) {
      return _buildSearchResults(searchResults, ref);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section header
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Car Wash Near You',
                style: AppTypography.sectionTitle,
              ),
              TextButton(
                onPressed: () {
                  // TODO: Navigate to all shops
                },
                child: Text(
                  'See All',
                  style: AppTypography.labelMedium.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: 12.h),

        // Shops list
        shopsState.when(
          data: (shops) => _buildShopsList(shops, ref),
          loading: () => _buildShimmerList(),
          error: (error, _) => _buildErrorWidget(error, ref),
        ),
      ],
    );
  }

  Widget _buildSearchResults(
    AsyncValue<List<CarWashShop>> searchResults,
    WidgetRef ref,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            'Search Results',
            style: AppTypography.sectionTitle,
          ),
        ),
        SizedBox(height: 12.h),
        searchResults.when(
          data: (shops) {
            if (shops.isEmpty) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    SizedBox(height: 24.h),
                    Icon(
                      Icons.search_off,
                      size: 48.sp,
                      color: AppColors.grey400,
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      'No results found',
                      style: AppTypography.bodyMedium.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    Text(
                      'Try a different search term',
                      style: AppTypography.bodySmall,
                    ),
                  ],
                ),
              );
            }
            return _buildShopsList(shops, ref);
          },
          loading: () => _buildShimmerList(),
          error: (error, _) => _buildErrorWidget(error, ref),
        ),
      ],
    );
  }

  Widget _buildShopsList(List<CarWashShop> shops, WidgetRef ref) {
    if (shops.isEmpty) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 24.h),
            Icon(
              Icons.location_off,
              size: 48.sp,
              color: AppColors.grey400,
            ),
            SizedBox(height: 12.h),
            Text(
              'No car wash shops nearby',
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            Text(
              'Try expanding your search area',
              style: AppTypography.bodySmall,
            ),
          ],
        ),
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      itemCount: shops.length,
      separatorBuilder: (_, __) => SizedBox(height: 12.h),
      itemBuilder: (context, index) {
        return ShopCard(
          shop: shops[index],
          onTap: () {
            // TODO: Navigate to shop detail
          },
          onWishlistTap: () {
            ref.read(homeNotifierProvider.notifier).toggleWishlist(
                  shops[index].id,
                );
          },
        );
      },
    );
  }

  Widget _buildShimmerList() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      itemCount: 3,
      separatorBuilder: (_, __) => SizedBox(height: 12.h),
      itemBuilder: (context, index) {
        return ShimmerWidgets.shopCard();
      },
    );
  }

  Widget _buildErrorWidget(Object error, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          SizedBox(height: 24.h),
          Icon(
            Icons.error_outline,
            size: 48.sp,
            color: AppColors.error,
          ),
          SizedBox(height: 12.h),
          Text(
            'Failed to load shops',
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.error,
            ),
          ),
          SizedBox(height: 8.h),
          TextButton(
            onPressed: () {
              ref.read(homeNotifierProvider.notifier).loadShopsNearYou();
            },
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}
