import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/theme/colors.dart';
import '../../../../app/theme/typography.dart';

/// Help & Support screen.
class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  final List<_FaqItem> _faqItems = [
    _FaqItem(
      question: 'How do I book a service?',
      answer:
          'To book a service, go to the Home screen and select a service center. Choose your preferred services, pick a date and time, and confirm your booking.',
    ),
    _FaqItem(
      question: 'How can I cancel a booking?',
      answer:
          'You can cancel a booking by going to your Bookings screen, selecting the booking you want to cancel, and tapping the "Cancel Booking" button.',
    ),
    _FaqItem(
      question: 'How do I add a vehicle to my garage?',
      answer:
          'Go to Profile > My Garage > Add Vehicle. Fill in your vehicle details including make, model, year, and registration number.',
    ),
    _FaqItem(
      question: 'What payment methods are accepted?',
      answer:
          'We accept various payment methods including credit/debit cards, UPI, and digital wallets. Payment is usually collected at the service center.',
    ),
    _FaqItem(
      question: 'How do I contact customer support?',
      answer:
          'You can reach our customer support team through email at support@drivedeck.com or call us at +91 1800-XXX-XXXX.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.textPrimary,
            size: 24.sp,
          ),
        ),
        title: Text(
          'Help & Support',
          style: AppTypography.titleLarge.copyWith(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),

              // Contact options
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Text(
                  'Contact Us',
                  style: AppTypography.titleSmall.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              _buildContactOptions(),

              SizedBox(height: 32.h),

              // FAQ section
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Text(
                  'Frequently Asked Questions',
                  style: AppTypography.titleSmall.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              _buildFaqSection(),

              SizedBox(height: 32.h),

              // Quick actions
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Text(
                  'Quick Actions',
                  style: AppTypography.titleSmall.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
              SizedBox(height: 12.h),
              _buildQuickActions(),

              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactOptions() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        children: [
          Expanded(
            child: _buildContactCard(
              icon: Icons.email_outlined,
              title: 'Email',
              subtitle: 'support@drivedeck.com',
              onTap: () => _showComingSoon(),
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: _buildContactCard(
              icon: Icons.phone_outlined,
              title: 'Phone',
              subtitle: '1800-XXX-XXXX',
              onTap: () => _showComingSoon(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColors.grey200),
        ),
        child: Column(
          children: [
            Container(
              width: 48.w,
              height: 48.w,
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 24.sp,
                color: AppColors.primary,
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              title,
              style: AppTypography.bodyMedium.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              subtitle,
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFaqSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: _faqItems
            .map((item) => _buildFaqTile(item))
            .toList(),
      ),
    );
  }

  Widget _buildFaqTile(_FaqItem item) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.grey200),
      ),
      child: ExpansionTile(
        tilePadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
        childrenPadding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
        shape: const RoundedRectangleBorder(side: BorderSide.none),
        title: Text(
          item.question,
          style: AppTypography.bodyMedium.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.answer,
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.textSecondary,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActions() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          _buildQuickActionTile(
            icon: Icons.bug_report_outlined,
            title: 'Report a Problem',
            subtitle: 'Let us know if something is wrong',
            onTap: () => _showComingSoon(),
          ),
          SizedBox(height: 12.h),
          _buildQuickActionTile(
            icon: Icons.feedback_outlined,
            title: 'Send Feedback',
            subtitle: 'Help us improve the app',
            onTap: () => _showComingSoon(),
          ),
          SizedBox(height: 12.h),
          _buildQuickActionTile(
            icon: Icons.chat_outlined,
            title: 'Live Chat',
            subtitle: 'Chat with our support team',
            onTap: () => _showComingSoon(),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActionTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColors.grey200),
        ),
        child: Row(
          children: [
            Container(
              width: 44.w,
              height: 44.w,
              decoration: BoxDecoration(
                color: AppColors.grey100,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Icon(
                icon,
                size: 22.sp,
                color: AppColors.textPrimary,
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTypography.bodyMedium.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    subtitle,
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right,
              size: 24.sp,
              color: AppColors.textSecondary,
            ),
          ],
        ),
      ),
    );
  }

  void _showComingSoon() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('This feature is coming soon'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}

class _FaqItem {
  const _FaqItem({
    required this.question,
    required this.answer,
  });

  final String question;
  final String answer;
}
