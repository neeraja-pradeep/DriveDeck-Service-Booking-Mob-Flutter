/// Shop module barrel file.
///
/// Exports all public APIs for the shop feature.

// Domain
export 'domain/entities/shop.dart';
export 'domain/repositories/shop_repository.dart';

// Infrastructure
export 'infrastructure/models/shop_model.dart';
export 'infrastructure/data_sources/remote/shop_api.dart';
export 'infrastructure/data_sources/local/shop_local_ds.dart';
export 'infrastructure/repositories/shop_repository_impl.dart';

// Application
export 'application/states/shop_state.dart';
export 'application/providers/shop_providers.dart';
