import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_category.freezed.dart';

/// Service category entity for displaying service types.
@freezed
class ServiceCategory with _$ServiceCategory {
  const factory ServiceCategory({
    required int id,
    required String name,
    String? icon,
    String? image,
    String? description,
    @Default(true) bool isActive,
  }) = _ServiceCategory;

  const ServiceCategory._();
}
