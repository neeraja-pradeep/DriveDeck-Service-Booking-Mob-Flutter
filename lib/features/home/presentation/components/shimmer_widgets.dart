import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../app/theme/colors.dart';

/// Collection of shimmer loading widgets for the home screen.
class ShimmerWidgets {
  ShimmerWidgets._();

  /// Base shimmer widget wrapper.
  static Widget _shimmerWrapper({required Widget child}) {
    return Shimmer.fromColors(
      baseColor: AppColors.shimmerBase,
      highlightColor: AppColors.shimmerHighlight,
      child: child,
    );
  }

  /// Shimmer for text placeholder.
  static Widget text({
    required double width,
    required double height,
    double borderRadius = 4,
  }) {
    return _shimmerWrapper(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: AppColors.shimmerBase,
          borderRadius: BorderRadius.circular(borderRadius.r),
        ),
      ),
    );
  }

  /// Shimmer for category card.
  static Widget categoryCard() {
    return _shimmerWrapper(
      child: Container(
        width: 75.w,
        height: 75.h,
        decoration: BoxDecoration(
          color: AppColors.shimmerBase,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: AppColors.shimmerHighlight,
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            SizedBox(height: 6.h),
            Container(
              width: 50.w,
              height: 10.h,
              decoration: BoxDecoration(
                color: AppColors.shimmerHighlight,
                borderRadius: BorderRadius.circular(4.r),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Shimmer for shop card.
  static Widget shopCard() {
    return _shimmerWrapper(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.shimmerBase,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image placeholder
            Container(
              height: 140.h,
              decoration: BoxDecoration(
                color: AppColors.shimmerHighlight,
                borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
              ),
            ),

            // Content
            Padding(
              padding: EdgeInsets.all(12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Container(
                    width: 180.w,
                    height: 18.h,
                    decoration: BoxDecoration(
                      color: AppColors.shimmerHighlight,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),

                  SizedBox(height: 8.h),

                  // Subtitle
                  Container(
                    width: 220.w,
                    height: 14.h,
                    decoration: BoxDecoration(
                      color: AppColors.shimmerHighlight,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                  ),

                  SizedBox(height: 12.h),

                  // Rating and distance row
                  Row(
                    children: [
                      Container(
                        width: 60.w,
                        height: 14.h,
                        decoration: BoxDecoration(
                          color: AppColors.shimmerHighlight,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Container(
                        width: 50.w,
                        height: 14.h,
                        decoration: BoxDecoration(
                          color: AppColors.shimmerHighlight,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        width: 40.w,
                        height: 14.h,
                        decoration: BoxDecoration(
                          color: AppColors.shimmerHighlight,
                          borderRadius: BorderRadius.circular(4.r),
                        ),
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

  /// Shimmer for promo banner.
  static Widget promoBanner() {
    return _shimmerWrapper(
      child: Container(
        height: 150.h,
        margin: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          color: AppColors.shimmerBase,
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
    );
  }

  /// Shimmer for profile avatar.
  static Widget avatar({double size = 48}) {
    return _shimmerWrapper(
      child: Container(
        width: size.w,
        height: size.h,
        decoration: const BoxDecoration(
          color: AppColors.shimmerBase,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  /// Shimmer for icon placeholder.
  static Widget icon({double size = 24}) {
    return _shimmerWrapper(
      child: Container(
        width: size.w,
        height: size.h,
        decoration: BoxDecoration(
          color: AppColors.shimmerBase,
          borderRadius: BorderRadius.circular(4.r),
        ),
      ),
    );
  }

  /// Shimmer for button.
  static Widget button({double width = 100, double height = 40}) {
    return _shimmerWrapper(
      child: Container(
        width: width.w,
        height: height.h,
        decoration: BoxDecoration(
          color: AppColors.shimmerBase,
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
    );
  }
}
