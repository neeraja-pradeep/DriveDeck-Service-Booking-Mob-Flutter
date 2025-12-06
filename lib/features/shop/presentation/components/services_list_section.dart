import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../application/providers/shop_providers.dart';
import 'service_list_item.dart';

/// Section displaying the list of services.
class ServicesListSection extends ConsumerWidget {
  final String shopId;

  const ServicesListSection({
    super.key,
    required this.shopId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(shopDetailStateProvider(shopId));
    final notifier = ref.read(shopDetailStateProvider(shopId).notifier);

    return state.servicesState.when(
      initial: () => const SizedBox.shrink(),
      loading: () => _buildShimmer(),
      error: (failure) => _buildError(failure.message, () {
        notifier.refresh();
      }),
      loaded: (services) {
        if (services.isEmpty) {
          return _buildEmpty();
        }

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: services.length,
          padding: EdgeInsets.only(bottom: 100.h),
          itemBuilder: (context, index) {
            final service = services[index];
            final isSelected = state.selectedServiceIds.contains(service.id);

            return ServiceListItem(
              service: service,
              isSelected: isSelected,
              onToggle: () {
                notifier.toggleServiceSelection(service.id);
              },
            );
          },
        );
      },
    );
  }

  Widget _buildShimmer() {
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

  Widget _buildError(String message, VoidCallback onRetry) {
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
          SizedBox(height: 16.h),
          ElevatedButton(
            onPressed: onRetry,
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  Widget _buildEmpty() {
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
