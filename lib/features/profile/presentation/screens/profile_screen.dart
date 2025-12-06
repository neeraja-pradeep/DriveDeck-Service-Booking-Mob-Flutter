import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newapp/app/theme/colors.dart';
import 'package:newapp/app/theme/typography.dart';
import 'package:newapp/core/error/error_view.dart';
import 'package:newapp/features/profile/application/providers/profile_providers.dart';
import 'package:newapp/features/profile/application/states/profile_state.dart';
import 'package:newapp/features/profile/presentation/components/profile_header_section.dart';
import 'package:newapp/features/profile/presentation/components/profile_menu_section.dart';
import 'package:newapp/features/profile/presentation/components/shimmer_loaders/profile_header_shimmer.dart';

/// Main profile screen (tab in bottom navigation).
class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    // Initialize profile on first load
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(profileStateProvider.notifier).initialize();
    });
  }

  @override
  Widget build(BuildContext context) {
    final profileState = ref.watch(profileStateProvider);

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        title: Text(
          'Profile',
          style: AppTypography.titleLarge,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.read(profileStateProvider.notifier).refresh(),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                SizedBox(height: 16.h),
                _buildContent(profileState),
                SizedBox(height: 16.h),
                const ProfileMenuSection(),
                SizedBox(height: 32.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(ProfileState profileState) {
    return switch (profileState.dataState) {
      ProfileInitial() => const ProfileHeaderShimmer(),
      ProfileLoading() => const ProfileHeaderShimmer(),
      ProfileLoaded(profile: final profile) => ProfileHeaderSection(
          profile: profile,
        ),
      ProfileError(failure: final failure) => ErrorView(
          failure: failure,
          onRetry: () => ref.read(profileStateProvider.notifier).initialize(),
        ),
    };
  }
}
