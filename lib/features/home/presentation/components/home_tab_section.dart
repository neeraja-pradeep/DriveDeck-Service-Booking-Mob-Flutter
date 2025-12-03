import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/theme/colors.dart';
import '../../../../app/theme/typography.dart';
import 'shops_near_you_section.dart';

/// Home tab types.
enum HomeTab { carWash, accessories, marketplace }

/// Provider for selected home tab.
final selectedHomeTabProvider = StateProvider<HomeTab>(
  (ref) => HomeTab.carWash,
);

/// Tabbed content section with Car Wash, Accessories, and Marketplace.
class HomeTabSection extends ConsumerWidget {
  const HomeTabSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTab = ref.watch(selectedHomeTabProvider);

    return Column(
      children: [
        // Tab bar
        _buildTabBar(context, ref, selectedTab),

        SizedBox(height: 16.h),

        // Tab content
        _buildTabContent(selectedTab),
      ],
    );
  }

  Widget _buildTabBar(
    BuildContext context,
    WidgetRef ref,
    HomeTab selectedTab,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: HomeTab.values.map((tab) {
                final isSelected = tab == selectedTab;
                return _buildTabItem(
                  title: _getTabTitle(tab),
                  isSelected: isSelected,
                  onTap: () {
                    ref.read(selectedHomeTabProvider.notifier).state = tab;
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  /// Individual tab item with blue text and underline when selected.
  Widget _buildTabItem({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: AppTypography.labelMedium.copyWith(
                color: isSelected ? AppColors.primary : AppColors.textSecondary,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(height: 6.h),
            // Underline indicator
            Container(
              height: 2.h,
              width: _getUnderlineWidth(title),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : Colors.transparent,
                borderRadius: BorderRadius.circular(1.r),
              ),
            ),
          ],
        ),
      ),
    );
  }

  double _getUnderlineWidth(String text) {
    // Calculate approximate width based on text length
    switch (text) {
      case 'Car Wash':
        return 60.w;
      case 'Accessories':
        return 80.w;
      case 'Marketplace':
        return 85.w;
      default:
        return text.length * 8.0.w;
    }
  }

  Widget _buildTabContent(HomeTab selectedTab) {
    switch (selectedTab) {
      case HomeTab.carWash:
        return const ShopsNearYouSection();
      case HomeTab.accessories:
        return _buildComingSoon('Accessories');
      case HomeTab.marketplace:
        return _buildComingSoon('Marketplace');
    }
  }

  Widget _buildComingSoon(String tabName) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      padding: EdgeInsets.all(32.w),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.grey200),
      ),
      child: Column(
        children: [
          Icon(Icons.construction, size: 48.sp, color: AppColors.grey400),
          SizedBox(height: 16.h),
          Text(
            '$tabName Coming Soon',
            style: AppTypography.titleMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'We\'re working hard to bring you amazing $tabName services.',
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  String _getTabTitle(HomeTab tab) {
    switch (tab) {
      case HomeTab.carWash:
        return 'Car Wash';
      case HomeTab.accessories:
        return 'Accessories';
      case HomeTab.marketplace:
        return 'Marketplace';
    }
  }
}
