import '../../models/shop_model.dart';

/// Local data source for shop data - provides mock data for development.
class ShopLocalDs {
  /// Get mock list of shops.
  Future<List<ShopModel>> getShops({
    int page = 1,
    int pageSize = 10,
    String? search,
  }) async {
    await Future.delayed(const Duration(milliseconds: 500));

    var shops = _mockShops;
    if (search != null && search.isNotEmpty) {
      shops = shops
          .where(
              (s) => s.name.toLowerCase().contains(search.toLowerCase()))
          .toList();
    }

    final start = (page - 1) * pageSize;
    final end = start + pageSize;
    return shops.sublist(
      start.clamp(0, shops.length),
      end.clamp(0, shops.length),
    );
  }

  /// Get mock nearby shops.
  Future<List<ShopModel>> getNearbyShops({
    required double latitude,
    required double longitude,
    double maxKm = 10,
    int limit = 10,
  }) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _mockShops.take(limit).toList();
  }

  /// Get mock shop details.
  Future<ShopModel> getShopDetails(int shopId) async {
    await Future.delayed(const Duration(milliseconds: 800));

    final shop = _mockShops.firstWhere(
      (s) => s.id == shopId,
      orElse: () => _detailedMockShop,
    );

    return shop;
  }

  /// Get mock shop availability.
  Future<List<ShopDateAvailabilityModel>> getShopAvailability({
    required int shopId,
    required DateTime startDate,
    int days = 7,
  }) async {
    await Future.delayed(const Duration(milliseconds: 500));

    return List.generate(days, (index) {
      final date = startDate.add(Duration(days: index));
      return ShopDateAvailabilityModel(
        date: date.toIso8601String().split('T').first,
        isOpen: date.weekday != DateTime.sunday,
        slots: _generateTimeSlots(date),
      );
    });
  }

  List<ShopTimeSlotModel> _generateTimeSlots(DateTime date) {
    return List.generate(16, (index) {
      final hour = 6 + index; // 6 AM to 10 PM
      return ShopTimeSlotModel(
        slotNumber: index + 1,
        startTime: '${hour.toString().padLeft(2, '0')}:00',
        endTime: '${(hour + 1).toString().padLeft(2, '0')}:00',
        isAvailable: index % 3 != 0, // Every 3rd slot unavailable
        availableCapacity: index % 3 != 0 ? 2 : 0,
      );
    });
  }

  /// Mock shop list.
  static final List<ShopModel> _mockShops = [
    const ShopModel(
      id: 1,
      name: 'Ace Car Spa',
      category: 'Car Wash',
      rating: 4.9,
      reviewCount: 25,
      address: '123 Main Street',
      area: 'Palazhi, Calicut',
      distanceKm: 4.0,
      description: 'Ace Car Spa is where exceptional car care meets uncompromised quality.',
      openHours: '6:00 AM to 11:00 PM',
      operatingDays: 'Monday to Sunday',
      minBookingDuration: '4 Hours minimum',
      images: [
        'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=800',
        'https://images.unsplash.com/photo-1607860108855-64acf2078ed9?w=800',
      ],
      isFavorite: false,
    ),
    const ShopModel(
      id: 2,
      name: 'Sparkle Auto Care',
      category: 'Car Wash',
      rating: 4.7,
      reviewCount: 42,
      address: '456 Oak Avenue',
      area: 'Kozhikode',
      distanceKm: 2.5,
      description: 'Premium car washing and detailing services.',
      openHours: '7:00 AM to 9:00 PM',
      operatingDays: 'Monday to Saturday',
      minBookingDuration: '2 Hours minimum',
      images: [
        'https://images.unsplash.com/photo-1619642751034-765dfdf7c58e?w=800',
      ],
      isFavorite: true,
    ),
    const ShopModel(
      id: 3,
      name: 'Crystal Clean Motors',
      category: 'Car Wash',
      rating: 4.5,
      reviewCount: 18,
      address: '789 Pine Road',
      area: 'Mavoor, Calicut',
      distanceKm: 6.2,
      description: 'Quality car wash with attention to detail.',
      openHours: '8:00 AM to 8:00 PM',
      operatingDays: 'Monday to Sunday',
      minBookingDuration: '3 Hours minimum',
      images: [
        'https://images.unsplash.com/photo-1580273916550-e323be2ae537?w=800',
      ],
      isFavorite: false,
    ),
  ];

  /// Detailed mock shop with full data.
  static const ShopModel _detailedMockShop = ShopModel(
    id: 1,
    name: 'Ace Car Spa',
    category: 'Car Wash',
    rating: 4.9,
    reviewCount: 25,
    address: '123 Main Street, Palazhi',
    area: 'Palazhi, Calicut',
    distanceKm: 4.0,
    description:
        'Ace Car Spa is where exceptional car care meets uncompromised quality. We combine expert techniques, premium products, and attention to detail to deliver a spotless finish every time.',
    openHours: '6:00 AM to 11:00 PM',
    operatingDays: 'Monday to Sunday',
    minBookingDuration: '4 Hours minimum',
    images: [
      'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=800',
      'https://images.unsplash.com/photo-1607860108855-64acf2078ed9?w=800',
      'https://images.unsplash.com/photo-1619642751034-765dfdf7c58e?w=800',
      'https://images.unsplash.com/photo-1580273916550-e323be2ae537?w=800',
    ],
    vehicleTypes: [
      ShopVehicleTypeModel(id: '1', name: 'Sedan', icon: 'car'),
      ShopVehicleTypeModel(id: '2', name: 'SUV', icon: 'suv'),
      ShopVehicleTypeModel(id: '3', name: 'Hatchback', icon: 'hatchback'),
      ShopVehicleTypeModel(id: '4', name: 'Truck', icon: 'truck'),
    ],
    services: [
      ShopServiceModel(id: '1', name: 'Exterior Wash', price: 1500, isPopular: true),
      ShopServiceModel(id: '2', name: 'Interior Cleaning', price: 1500),
      ShopServiceModel(id: '3', name: 'Polish & Protection', price: 1500, isPopular: true),
      ShopServiceModel(id: '4', name: 'Final Touch', price: 1500),
      ShopServiceModel(id: '5', name: 'Engine Cleaning', price: 2000),
      ShopServiceModel(id: '6', name: 'Tire Shine', price: 500),
    ],
    packages: [
      ShopPackageModel(
        id: '1',
        name: 'Basic Package',
        price: 2500,
        includedServiceIds: ['1', '2'],
        discountPercentage: 16.67,
      ),
      ShopPackageModel(
        id: '2',
        name: 'Premium Package',
        price: 4500,
        includedServiceIds: ['1', '2', '3'],
        discountPercentage: 20.0,
        isPopular: true,
      ),
      ShopPackageModel(
        id: '3',
        name: 'Complete Care',
        price: 6000,
        includedServiceIds: ['1', '2', '3', '4'],
        discountPercentage: 25.0,
      ),
    ],
    accessories: [
      ShopAccessoryModel(id: '1', name: 'Air Freshener', price: 250, description: 'Premium car air freshener'),
      ShopAccessoryModel(id: '2', name: 'Seat Cover', price: 1200, description: 'Leather seat cover set'),
      ShopAccessoryModel(id: '3', name: 'Floor Mat', price: 800, description: 'Premium rubber floor mats'),
      ShopAccessoryModel(id: '4', name: 'Dashboard Polish', price: 350, description: 'UV protection dashboard polish'),
    ],
    isFavorite: false,
    phoneNumber: '+91 9876543210',
    latitude: 11.2588,
    longitude: 75.7804,
  );
}
