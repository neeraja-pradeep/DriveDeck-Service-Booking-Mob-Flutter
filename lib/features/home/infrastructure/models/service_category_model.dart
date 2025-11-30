import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../domain/entities/service_category.dart';

part 'service_category_model.freezed.dart';
part 'service_category_model.g.dart';

/// Service category model for API response parsing and Hive storage.
@freezed
@HiveType(typeId: 1)
class ServiceCategoryModel with _$ServiceCategoryModel {
  const factory ServiceCategoryModel({
    @HiveField(0) required int id,
    @HiveField(1) required String name,
    @HiveField(2) String? icon,
    @HiveField(3) String? image,
    @HiveField(4) String? description,
    @HiveField(5) @JsonKey(name: 'is_active') @Default(true) bool isActive,
  }) = _ServiceCategoryModel;

  const ServiceCategoryModel._();

  factory ServiceCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceCategoryModelFromJson(json);

  /// Converts the model to a domain entity.
  ServiceCategory toEntity() {
    return ServiceCategory(
      id: id,
      name: name,
      icon: icon,
      image: image,
      description: description,
      isActive: isActive,
    );
  }

  /// Creates a model from domain entity.
  factory ServiceCategoryModel.fromEntity(ServiceCategory entity) {
    return ServiceCategoryModel(
      id: entity.id,
      name: entity.name,
      icon: entity.icon,
      image: entity.image,
      description: entity.description,
      isActive: entity.isActive,
    );
  }
}

/// Response wrapper for service categories list.
@freezed
class ServiceCategoriesResponse with _$ServiceCategoriesResponse {
  const factory ServiceCategoriesResponse({
    required List<ServiceCategoryModel> results,
    int? count,
    String? next,
    String? previous,
  }) = _ServiceCategoriesResponse;

  factory ServiceCategoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$ServiceCategoriesResponseFromJson(json);
}
