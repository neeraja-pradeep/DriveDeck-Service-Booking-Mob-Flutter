import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/theme/colors.dart';
import '../../application/providers/home_provider.dart';
import '../components/home_header.dart';
import '../components/service_categories_section.dart';
import '../components/promo_cards_section.dart';
import '../components/home_tab_section.dart';

/// Home screen widget.
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homeNotifierProvider);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await ref.read(homeNotifierProvider.notifier).refresh();
          },
          color: AppColors.primary,
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              // Header with greeting and location
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 0),
                  child: const HomeHeader(),
                ),
              ),

              // Search bar

              // Promo cards carousel
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(top: 24.h),
                  child: const PromoCardsSection(),
                ),
              ),

              // Service categories section
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(top: 24.h),
                  child: const ServiceCategoriesSection(),
                ),
              ),

              // Tabbed content section (Car Wash, Accessories, Marketplace)
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(top: 24.h, bottom: 24.h),
                  child: const HomeTabSection(),
                ),
              ),

              // Error message if any
              if (homeState.lastError != null)
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(16.w),
                    child: _buildErrorBanner(context, ref),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  /// 🔴 DEV: Profile update button to add location to user profile
  Widget _buildProfileUpdateButton(BuildContext context, WidgetRef ref) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: ElevatedButton(
        onPressed: () async {
          // Update profile with the location coordinates from the logs
          await ref
              .read(homeNotifierProvider.notifier)
              .updateUserProfileWithLocation(
                latitude: 9.5140783,
                longitude: 76.33026,
              );

          // Show success message
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                '✅ Profile updated with location! Shops should load now.',
              ),
              backgroundColor: Colors.green,
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 12.h),
        ),
        child: Text(
          '🔧 DEV: Update Profile with Location',
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildErrorBanner(BuildContext context, WidgetRef ref) {
    final error = ref.read(homeNotifierProvider).lastError;
    if (error == null) return const SizedBox.shrink();

    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: AppColors.errorLight,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.error.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          Icon(Icons.error_outline, color: AppColors.error, size: 20.sp),
          SizedBox(width: 8.w),
          Expanded(
            child: Text(
              error.toUserMessage(),
              style: TextStyle(fontSize: 12.sp, color: AppColors.error),
            ),
          ),
          IconButton(
            icon: Icon(Icons.close, size: 18.sp, color: AppColors.error),
            onPressed: () {
              ref.read(homeNotifierProvider.notifier).clearError();
            },
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
        ],
      ),
    );
  }
}
