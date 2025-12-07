import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/theme/colors.dart';
import '../../../../core/error/failure.dart';
import '../../../auth/application/providers/auth_providers.dart';
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
    // Watch auth state to handle authentication
    final authState = ref.watch(authStateProvider);

    return authState.when(
      initial: () => _buildLoadingScreen(),
      loading: () => _buildLoadingScreen(),
      authenticated: (session) => _buildHomeContent(context, ref, session),
      unauthenticated: () => _buildUnauthenticatedScreen(context),
      sessionExpired: () => _buildUnauthenticatedScreen(context),
      error: (failure) => _buildErrorScreen(context, failure),
    );
  }

  /// Builds the loading screen while checking authentication.
  Widget _buildLoadingScreen() {
    return const Scaffold(
      backgroundColor: AppColors.background,
      body: Center(child: CircularProgressIndicator()),
    );
  }

  /// Builds the screen shown when user is not authenticated.
  Widget _buildUnauthenticatedScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.lock_outline,
                size: 64.sp,
                color: AppColors.textSecondary,
              ),
              SizedBox(height: 24.h),
              Text(
                'Authentication Required',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                'Please log in to access your home dashboard',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32.h),
              ElevatedButton(
                onPressed: () {
                  context.go('/login');
                },
                child: const Text('Go to Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the screen shown when an authentication error occurs.
  Widget _buildErrorScreen(BuildContext context, Failure failure) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline, size: 64.sp, color: AppColors.error),
              SizedBox(height: 24.h),
              Text(
                'Authentication Error',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              SizedBox(height: 12.h),
              Text(
                failure.toUserMessage(),
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32.h),
              ElevatedButton(
                onPressed: () {
                  context.go('/login');
                },
                child: const Text('Try Again'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the main home content when user is authenticated.
  Widget _buildHomeContent(BuildContext context, WidgetRef ref, session) {
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

  Widget _buildErrorBanner(BuildContext context, WidgetRef ref) {
    final error = ref.read(homeNotifierProvider).lastError;
    if (error == null) return const SizedBox.shrink();

    // Handle authentication errors specially
    final isAuthError =
        error.whenOrNull(
          unauthorized: (message, code) => true,
          sessionExpired: (message) => true,
        ) ??
        false;

    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: AppColors.errorLight,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.error.withValues(alpha: 0.3)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                isAuthError ? Icons.lock_outline : Icons.error_outline,
                color: AppColors.error,
                size: 20.sp,
              ),
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
          if (isAuthError) ...[
            SizedBox(height: 8.h),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  context.go('/login');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.error,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                ),
                child: Text('Go to Login', style: TextStyle(fontSize: 12.sp)),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
