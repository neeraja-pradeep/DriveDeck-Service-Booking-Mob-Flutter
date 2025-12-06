import '../../../domain/entities/shop_details.dart';

/// Local data source for shop details - simulates API responses.
class ShopDetailsLocalDataSource {
  /// Simulates fetching shop details from an API.
  Future<ShopDetails> getShopDetails(String shopId) async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 800));

    return ShopDetails(
      id: int.tryParse(shopId) ?? 1,
      name: 'Ace Car Spa',
      category: 'Car Wash',
      rating: 4.9,
      reviewCount: 245,
      location: const ShopLocation(area: 'Downtown Area', distanceKm: 2.5),
      description:
          'Premium car wash and detailing services with eco-friendly products. We provide comprehensive car care solutions including exterior wash, interior cleaning, waxing, and polishing services.',
      openHours: '8:00 AM - 8:00 PM',
      minBookingDuration: '4 Hours minimum',
      images: [
        'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=800',
        'https://images.unsplash.com/photo-1607860108855-64acf2078ed9?w=800',
        'https://images.unsplash.com/photo-1619642751034-765dfdf7c58e?w=800',
        'https://images.unsplash.com/photo-1580273916550-e323be2ae537?w=800',
      ],
      vehicleTypes: [
        const VehicleType(id: '1', name: 'Sedan', icon: '🚗'),
        const VehicleType(id: '2', name: 'SUV', icon: '🚙'),
        const VehicleType(id: '3', name: 'Hatchback', icon: '🚘'),
        const VehicleType(id: '4', name: 'Truck', icon: '🚚'),
      ],
      services: [
        const Service(id: '1', name: 'Exterior', price: 299, isSelected: true),
        const Service(id: '2', name: 'Interior', price: 199, isSelected: false),
        const Service(id: '3', name: 'Polish', price: 399, isSelected: true),
        const Service(
          id: '4',
          name: 'Final Touch',
          price: 149,
          isSelected: true,
        ),
        const Service(
          id: '5',
          name: 'Engine Cleaning',
          price: 499,
          isSelected: false,
        ),
        const Service(
          id: '6',
          name: 'Wax Protection',
          price: 349,
          isSelected: false,
        ),
      ],
    );
  }
}
