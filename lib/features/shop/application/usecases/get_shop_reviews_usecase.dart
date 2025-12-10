import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/shop.dart';
import '../../domain/repositories/shop_repository.dart';

class GetShopReviewsUseCase {
  const GetShopReviewsUseCase({required this.repository});

  final ShopRepository repository;

  Future<Either<Failure, List<Shop>>> call({
    int page = 1,
    int pageSize = 10,
  }) {
    return repository.getShopReviews(page: page, pageSize: pageSize);
  }
}

