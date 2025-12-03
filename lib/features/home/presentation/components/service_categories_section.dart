import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../../app/theme/colors.dart';
import '../../../../app/theme/typography.dart';
import '../../application/providers/home_provider.dart';
import '../../domain/entities/service_category.dart';
import 'shimmer_widgets.dart';

/// Section displaying service categories in a horizontal scrollable list.
class ServiceCategoriesSection extends ConsumerWidget {
  const ServiceCategoriesSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesState = ref.watch(serviceCategoriesProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section header (removed "See All")
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: const Text('Services', style: AppTypography.sectionTitle),
        ),

        SizedBox(height: 16.h),

        // Categories list
        categoriesState.when(
          data: (categories) => _buildCategoriesList(categories),
          loading: () => _buildShimmerList(),
          error: (error, _) => _buildErrorWidget(error, ref),
        ),
      ],
    );
  }

  Widget _buildCategoriesList(List<ServiceCategory> categories) {
    if (categories.isEmpty) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Text(
          'No services available',
          style: AppTypography.bodyMedium.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      );
    }

    return SizedBox(
      height: 110.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemCount: categories.length,
        separatorBuilder: (_, _) => SizedBox(width: 12.w),
        itemBuilder: (context, index) {
          return _CategoryCard(category: categories[index]);
        },
      ),
    );
  }

  Widget _buildShimmerList() {
    return SizedBox(
      height: 110.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemCount: 5,
        separatorBuilder: (_, _) => SizedBox(width: 12.w),
        itemBuilder: (context, index) {
          return ShimmerWidgets.categoryCard();
        },
      ),
    );
  }

  Widget _buildErrorWidget(Object error, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          Text(
            'Failed to load services',
            style: AppTypography.bodyMedium.copyWith(color: AppColors.error),
          ),
          SizedBox(height: 8.h),
          TextButton(
            onPressed: () {
              ref.read(homeNotifierProvider.notifier).loadServiceCategories();
            },
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}

/// Individual category card widget.
class _CategoryCard extends StatelessWidget {
  final ServiceCategory category;

  const _CategoryCard({required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO: Navigate to category detail
      },
      child: Container(
        width: 75.w,
        height: 75.h,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            const BoxShadow(
              color: AppColors.shadow,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image/Icon (prioritize image from API)
            Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: AppColors.primaryLight.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: category.image != null && category.image!.isNotEmpty
                    ? CachedNetworkImage(
                        imageUrl: category.image!,
                        fit: BoxFit.cover,
                        placeholder: (_, _) => Icon(
                          _getCategoryIcon(category.name),
                          size: 20.sp,
                          color: AppColors.primary,
                        ),
                        errorWidget: (_, _, _) => Icon(
                          _getCategoryIcon(category.name),
                          size: 20.sp,
                          color: AppColors.primary,
                        ),
                      )
                    : Icon(
                        _getCategoryIcon(category.name),
                        size: 20.sp,
                        color: AppColors.primary,
                      ),
              ),
            ),

            SizedBox(height: 6.h),

            // Name
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: Text(
                category.name,
                style: AppTypography.labelSmall.copyWith(
                  color: AppColors.textPrimary,
                  fontSize: 10.sp,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getCategoryIcon(String name) {
    final nameLower = name.toLowerCase();
    if (nameLower.contains('wash')) return Icons.local_car_wash;
    if (nameLower.contains('detail')) return Icons.auto_awesome;
    if (nameLower.contains('polish')) return Icons.auto_fix_high;
    if (nameLower.contains('interior')) {
      return Icons.airline_seat_recline_normal;
    }
    if (nameLower.contains('tire')) return Icons.trip_origin;
    if (nameLower.contains('wax')) return Icons.water_drop;
    return Icons.local_car_wash;
  }
}
