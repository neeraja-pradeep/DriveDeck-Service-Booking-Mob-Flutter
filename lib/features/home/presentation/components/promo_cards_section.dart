import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../app/theme/colors.dart';
import '../../../../app/theme/typography.dart';
import '../../domain/entities/promo_card.dart';

/// Section displaying promotional cards in a horizontal carousel.
class PromoCardsSection extends ConsumerStatefulWidget {
  const PromoCardsSection({super.key});

  @override
  ConsumerState<PromoCardsSection> createState() => _PromoCardsSectionState();
}

class _PromoCardsSectionState extends ConsumerState<PromoCardsSection> {
  final PageController _pageController = PageController();

  // Mock data for now - replace with actual provider later
  final List<PromoCard> _mockPromoCards = [
    const PromoCard(
      id: '1',
      title: 'Premium Car Wash',
      subtitle: 'Get 20% off on your first booking',
      imageUrl:
          'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=800&h=400&fit=crop',
    ),
    const PromoCard(
      id: '2',
      title: 'Express Service',
      subtitle: 'Quick wash in 15 minutes',
      imageUrl:
          'https://images.unsplash.com/photo-1449824913935-59a10b8d2000?w=800&h=400&fit=crop',
    ),
    const PromoCard(
      id: '3',
      title: 'Full Detail Package',
      subtitle: 'Complete interior & exterior cleaning',
      imageUrl:
          'https://images.unsplash.com/photo-1486262715619-67b85e0b08d3?w=800&h=400&fit=crop',
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Carousel
        SizedBox(
          height: 180.h,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              // Page indicator automatically updates via controller
            },
            itemCount: _mockPromoCards.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: _PromoCardItem(card: _mockPromoCards[index]),
              );
            },
          ),
        ),

        SizedBox(height: 12.h),

        // Page indicator
        if (_mockPromoCards.length > 1)
          SmoothPageIndicator(
            controller: _pageController,
            count: _mockPromoCards.length,
            effect: WormEffect(
              dotHeight: 8.h,
              dotWidth: 8.w,
              activeDotColor: AppColors.primary,
              dotColor: AppColors.grey300,
              spacing: 8.w,
            ),
          ),
      ],
    );
  }
}

/// Individual promo card item.
class _PromoCardItem extends StatelessWidget {
  final PromoCard card;

  const _PromoCardItem({required this.card});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // TODO: Handle promo card tap
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Tapped: ${card.title}')));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withValues(alpha: 0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Background image
              CachedNetworkImage(
                imageUrl: card.imageUrl,
                fit: BoxFit.cover,
                placeholder: (_, _) => _buildPlaceholder(),
                errorWidget: (_, _, _) => _buildPlaceholder(),
              ),

              // Gradient overlay
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      AppColors.black.withValues(alpha: 0.7),
                    ],
                  ),
                ),
              ),

              // Content
              Positioned(
                bottom: 20.h,
                left: 20.w,
                right: 20.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      card.title,
                      style: AppTypography.titleMedium.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (card.subtitle != null) ...[
                      SizedBox(height: 4.h),
                      Text(
                        card.subtitle!,
                        style: AppTypography.bodySmall.copyWith(
                          color: AppColors.white.withValues(alpha: 0.9),
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      color: AppColors.grey200,
      child: Icon(Icons.image, size: 48.sp, color: AppColors.grey400),
    );
  }
}
