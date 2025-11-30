import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../app/theme/colors.dart';
import '../../../../app/theme/typography.dart';
import '../../domain/entities/car_wash_shop.dart';

/// Card widget displaying a car wash shop.
class ShopCard extends StatelessWidget {
  final CarWashShop shop;
  final VoidCallback? onTap;
  final VoidCallback? onWishlistTap;

  const ShopCard({
    super.key,
    required this.shop,
    this.onTap,
    this.onWishlistTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadow,
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image with wishlist button
            _buildImageSection(),

            // Details
            Padding(
              padding: EdgeInsets.all(12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name and open status
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          shop.name,
                          style: AppTypography.cardTitle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      _buildOpenStatus(),
                    ],
                  ),

                  SizedBox(height: 4.h),

                  // Address
                  if (shop.address != null)
                    Text(
                      shop.address!,
                      style: AppTypography.cardSubtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),

                  SizedBox(height: 8.h),

                  // Rating, distance, and price
                  Row(
                    children: [
                      // Rating
                      _buildRating(),

                      SizedBox(width: 16.w),

                      // Distance
                      if (shop.distance != null) ...[
                        Icon(
                          Icons.location_on_outlined,
                          size: 14.sp,
                          color: AppColors.textSecondary,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          shop.formattedDistance,
                          style: AppTypography.distance,
                        ),
                      ],

                      const Spacer(),

                      // Price range
                      if (shop.priceRange != null)
                        Text(
                          shop.priceRange!,
                          style: AppTypography.price,
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageSection() {
    return Stack(
      children: [
        // Shop image
        ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
          child: shop.image != null
              ? CachedNetworkImage(
                  imageUrl: shop.image!,
                  height: 140.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: (_, __) => _buildPlaceholderImage(),
                  errorWidget: (_, __, ___) => _buildPlaceholderImage(),
                )
              : _buildPlaceholderImage(),
        ),

        // Wishlist button
        Positioned(
          top: 8.h,
          right: 8.w,
          child: GestureDetector(
            onTap: onWishlistTap,
            child: Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: AppColors.surface.withValues(alpha: 0.9),
                shape: BoxShape.circle,
              ),
              child: Icon(
                shop.isWishlisted ? Icons.favorite : Icons.favorite_border,
                size: 20.sp,
                color: shop.isWishlisted
                    ? AppColors.heartFilled
                    : AppColors.heartEmpty,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPlaceholderImage() {
    return Container(
      height: 140.h,
      width: double.infinity,
      color: AppColors.grey200,
      child: Icon(
        Icons.local_car_wash,
        size: 48.sp,
        color: AppColors.grey400,
      ),
    );
  }

  Widget _buildOpenStatus() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: shop.isOpen ? AppColors.successLight : AppColors.errorLight,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Text(
        shop.isOpen ? 'Open' : 'Closed',
        style: AppTypography.labelSmall.copyWith(
          color: shop.isOpen ? AppColors.success : AppColors.error,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildRating() {
    return Row(
      children: [
        Icon(
          Icons.star,
          size: 16.sp,
          color: AppColors.starFilled,
        ),
        SizedBox(width: 4.w),
        Text(
          shop.formattedRating,
          style: AppTypography.rating.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        if (shop.reviewCount != null) ...[
          SizedBox(width: 4.w),
          Text(
            '(${shop.reviewCount})',
            style: AppTypography.rating,
          ),
        ],
      ],
    );
  }
}
