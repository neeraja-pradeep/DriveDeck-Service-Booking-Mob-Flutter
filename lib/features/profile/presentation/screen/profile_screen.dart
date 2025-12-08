import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newapp/app/theme/colors.dart';
import 'package:newapp/features/profile/application/providers/profile_providers.dart';
import 'package:newapp/features/profile/application/states/profile_state.dart';

// Modular components
import '../components/profile_header_section.dart';
import '../components/profile_menu_section.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(profileStateProvider.notifier).initialize();
    });
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(isProfileLoadingProvider);

    return Scaffold(
      // 1. Set background to white for full screen effect
      backgroundColor: Colors.white,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await ref.read(profileStateProvider.notifier).refresh();
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            // 2. Removed outer Padding and Container decoration
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24.h),

                // -- Header Title --
                Center(
                  child: Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),

                SizedBox(height: 20.h),

                // -- User Info Row (Modular) --
                ProfileHeaderSection(isLoading: isLoading),

                SizedBox(height: 30.h),

                // -- "Setting" Section Title --
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Text(
                    'Setting',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),

                SizedBox(height: 10.h),

                // -- Menu List (Modular) --
                const ProfileMenuSection(),

                SizedBox(height: 24.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
