import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/theme/colors.dart';
import '../../../../app/theme/typography.dart';
import '../../domain/entities/car_wash_shop.dart';

/// Section showing available services at the shop.
class ShopServicesSection extends StatelessWidget {
  const ShopServicesSection({required this.shop, super.key});

  final CarWashShop shop;

  @override
  Widget build(BuildContext context) {
    if (shop.services == null || shop.services!.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.grey200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Services',
            style: AppTypography.titleMedium.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),

          SizedBox(height: 12.h),

          // Services grid
          Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: shop.services!.map((service) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: AppColors.primaryLight,
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(
                    color: AppColors.primary.withValues(alpha: 0.3),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      _getServiceIcon(service),
                      size: 16.sp,
                      color: AppColors.primary,
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      service,
                      style: AppTypography.labelMedium.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  IconData _getServiceIcon(String service) {
    final serviceLower = service.toLowerCase();

    if (serviceLower.contains('wash')) {
      return Icons.local_car_wash;
    } else if (serviceLower.contains('interior') ||
        serviceLower.contains('clean')) {
      return Icons.cleaning_services;
    } else if (serviceLower.contains('wax') ||
        serviceLower.contains('polish')) {
      return Icons.auto_fix_high;
    } else if (serviceLower.contains('engine')) {
      return Icons.build;
    } else {
      return Icons.check_circle;
    }
  }
}
