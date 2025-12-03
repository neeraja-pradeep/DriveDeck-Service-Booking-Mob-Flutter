import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../app/theme/colors.dart';
import '../../../../app/theme/typography.dart';

/// Main section selector with Car Wash, Accessories, Marketplace tabs.
class MainSectionSelector extends ConsumerStatefulWidget {
  const MainSectionSelector({super.key});

  @override
  ConsumerState<MainSectionSelector> createState() =>
      _MainSectionSelectorState();
}

class _MainSectionSelectorState extends ConsumerState<MainSectionSelector> {
  int _selectedIndex = 0;

  final List<String> _sections = ['Car Wash', 'Accessories', 'Marketplace'];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(_sections.length, (index) {
                final isSelected = _selectedIndex == index;
                return _SectionTab(
                  title: _sections[index],
                  isSelected: isSelected,
                  onTap: () {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

/// Individual section tab with blue text and underline when selected.
class _SectionTab extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const _SectionTab({
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
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
}
