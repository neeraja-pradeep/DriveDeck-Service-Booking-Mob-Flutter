/// Shop module barrel file.
///
/// Exports all public APIs for the shop feature.

// Domain - Entities
export 'domain/entities/shop.dart';
export 'domain/entities/opening_hours.dart';
export 'domain/entities/vehicle_type.dart';
export 'domain/entities/shop_tab.dart';
export 'domain/entities/booking_request.dart';
export 'domain/entities/booking_summary.dart';
export 'domain/entities/booking_confirmation.dart';

// Domain - Repositories
export 'domain/repositories/shop_repository.dart';

// Infrastructure - Models
export 'infrastructure/models/shop_model.dart';

// Infrastructure - Data Sources
export 'infrastructure/data_sources/remote/shop_api.dart';
export 'infrastructure/data_sources/local/shop_local_ds.dart';

// Infrastructure - Repositories
export 'infrastructure/repositories/shop_repository_impl.dart';

// Application - States
export 'application/states/shop_state.dart';

// Application - Providers
export 'application/providers/shop_providers.dart';

// Application - Use Cases
export 'application/usecases/get_shop_details_usecase.dart';
export 'application/usecases/get_shop_services_usecase.dart';
export 'application/usecases/get_available_slots_usecase.dart';
export 'application/usecases/create_booking_usecase.dart';

// Application - Services
export 'application/services/price_calculator.dart';
