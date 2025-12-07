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
      reviewCount: 25,
      location: const ShopLocation(area: 'Palazhi, Calicut', distanceKm: 4),
      description:
          'Ace Car Spa is where exceptional car care meets uncompromised quality. We combine expert techniques, premium products,',
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
        const VehicleType(id: '1', name: 'Sedan', icon: 'car'),
        const VehicleType(id: '2', name: 'SUV', icon: 'suv'),
        const VehicleType(id: '3', name: 'Hatchback', icon: 'hatchback'),
        const VehicleType(id: '4', name: 'Truck', icon: 'truck'),
      ],
      services: [
        const Service(
          id: '1',
          name: 'Exterior Wash',
          price: 1500,
          isSelected: true,
        ),
        const Service(
          id: '2',
          name: 'Interior Cleaning',
          price: 1500,
          isSelected: false,
        ),
        const Service(
          id: '3',
          name: 'Polish & Protection',
          price: 1500,
          isSelected: true,
        ),
        const Service(
          id: '4',
          name: 'Final Touch',
          price: 1500,
          isSelected: false,
        ),
      ],
      packages: [
        const Package(
          id: '1',
          name: 'Basic Package',
          price: 2500,
          includedServices: ['Exterior Wash', 'Interior Cleaning'],
        ),
        const Package(
          id: '2',
          name: 'Premium Package',
          price: 4500,
          includedServices: [
            'Exterior Wash',
            'Interior Cleaning',
            'Polish & Protection',
          ],
        ),
        const Package(
          id: '3',
          name: 'Complete Care',
          price: 6000,
          includedServices: [
            'Exterior Wash',
            'Interior Cleaning',
            'Polish & Protection',
            'Final Touch',
          ],
        ),
      ],
      accessories: [
        const Accessory(
          id: '1',
          name: 'Air Freshener',
          price: 250,
          description: 'Premium car air freshener',
        ),
        const Accessory(
          id: '2',
          name: 'Seat Cover',
          price: 1200,
          description: 'Leather seat cover set',
        ),
        const Accessory(
          id: '3',
          name: 'Floor Mat',
          price: 800,
          description: 'Premium rubber floor mats',
        ),
        const Accessory(
          id: '4',
          name: 'Dashboard Polish',
          price: 350,
          description: 'UV protection dashboard polish',
        ),
      ],
    );
  }
}
