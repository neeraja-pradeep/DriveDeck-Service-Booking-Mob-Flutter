import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/theme/colors.dart';
import '../../../../app/theme/typography.dart';
import '../../domain/entities/car_wash_shop.dart';

/// Header section for shop detail screen showing name, rating, and basic info.
class ShopDetailHeader extends StatelessWidget {
  const ShopDetailHeader({required this.shop, super.key});

  final CarWashShop shop;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: const BoxDecoration(color: AppColors.surface),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Shop name
          Text(
            shop.name,
            style: AppTypography.titleLarge.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),

          SizedBox(height: 8.h),

          // Rating and reviews
          Row(
            children: [
              Icon(Icons.star, color: Colors.amber, size: 20.sp),
              SizedBox(width: 4.w),
              Text(
                shop.formattedRating,
                style: AppTypography.labelMedium.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: 4.w),
              Text(
                '(${shop.reviewCount ?? 0} reviews)',
                style: AppTypography.labelMedium.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const Spacer(),
              // Distance
              if (shop.distance != null) ...[
                Icon(
                  Icons.location_on,
                  color: AppColors.textSecondary,
                  size: 16.sp,
                ),
                SizedBox(width: 4.w),
                Text(
                  shop.formattedDistance,
                  style: AppTypography.labelMedium.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ],
          ),

          SizedBox(height: 12.h),

          // Status and price range
          Row(
            children: [
              // Open/Closed status
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: shop.isOpen ? AppColors.success : AppColors.error,
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: Text(
                  shop.isOpen ? 'Open' : 'Closed',
                  style: AppTypography.labelSmall.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              SizedBox(width: 12.w),

              // Price range
              if (shop.priceRange != null) ...[
                Text(
                  '•',
                  style: AppTypography.labelMedium.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                SizedBox(width: 8.w),
                Text(
                  shop.priceRange!,
                  style: AppTypography.labelMedium.copyWith(
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ],
          ),

          // Description
          if (shop.description != null) ...[
            SizedBox(height: 16.h),
            Text(
              shop.description!,
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.textSecondary,
                height: 1.5,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
