import 'package:freezed_annotation/freezed_annotation.dart';

part 'promo_card.freezed.dart';

/// Promo card entity for promotional content.
@freezed
class PromoCard with _$PromoCard {
  const factory PromoCard({
    required String id,
    required String title,
    String? subtitle,
    required String imageUrl,
    String? actionUrl,
  }) = _PromoCard;

  const PromoCard._();

  /// Factory for empty promo card.
  factory PromoCard.empty() => const PromoCard(id: '', title: '', imageUrl: '');
}
