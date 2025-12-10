/// App configuration for different environments
class AppConfig {
  // ============================================================================
  // DEPLOYMENT CONFIGURATION
  // ============================================================================

  /// Set to false for production deployment
  /// Set to true for local testing with mock data
  static const bool useMockData = false;

  /// API Base URL
  static const String apiBaseUrl = 'http://156.67.104.149:8080';

  /// Mock user profile for testing
  static const mockUserProfile = {
    'id': 1,
    'firstName': 'John',
    'lastName': 'Doe',
    'email': 'john.doe@example.com',
    'phone': '+1234567890',
    'profileImage': 'https://via.placeholder.com/150',
    'isVerified': true,
    'createdAt': '2024-01-01T00:00:00Z',
  };

  /// Mock location for testing (San Francisco)
  static const mockLocation = {
    'latitude': 37.7749,
    'longitude': -122.4194,
    'address': '123 Market Street, San Francisco, CA',
    'city': 'San Francisco',
    'state': 'California',
    'country': 'United States',
    'postalCode': '94102',
  };

  /// Mock service categories for testing
  static const mockServiceCategories = [
    {
      'id': 1,
      'name': 'Basic Wash',
      'description': 'Exterior wash and dry',
      'icon': 'https://via.placeholder.com/64',
      'color': '#3498db',
      'isActive': true,
      'sortOrder': 1,
    },
    {
      'id': 2,
      'name': 'Premium Wash',
      'description': 'Exterior wash, wax, and interior cleaning',
      'icon': 'https://via.placeholder.com/64',
      'color': '#e74c3c',
      'isActive': true,
      'sortOrder': 2,
    },
    {
      'id': 3,
      'name': 'Full Detail',
      'description': 'Complete interior and exterior detailing',
      'icon': 'https://via.placeholder.com/64',
      'color': '#f39c12',
      'isActive': true,
      'sortOrder': 3,
    },
    {
      'id': 4,
      'name': 'Express Wash',
      'description': 'Quick 15-minute wash',
      'icon': 'https://via.placeholder.com/64',
      'color': '#27ae60',
      'isActive': true,
      'sortOrder': 4,
    },
  ];

  /// Mock car wash shops for testing
  static const mockCarWashShops = [
    {
      'id': 1,
      'name': 'Sparkle Car Wash',
      'description': 'Premium car wash services with eco-friendly products',
      'image': 'https://via.placeholder.com/300x200',
      'address': '456 Main Street, San Francisco, CA 94102',
      'phone': '+1-555-0123',
      'latitude': 37.7849,
      'longitude': -122.4094,
      'rating': 4.8,
      'reviewCount': 245,
      'distance': 0.5,
      'openingTime': '08:00',
      'closingTime': '20:00',
      'isOpen': true,
      'isWishlisted': false,
      'services': ['Basic Wash', 'Premium Wash', 'Full Detail'],
      'priceRange': '\$15 - \$50',
    },
    {
      'id': 2,
      'name': 'Quick Clean Auto',
      'description': 'Fast and affordable car wash solutions',
      'image': 'https://via.placeholder.com/300x200',
      'address': '789 Oak Avenue, San Francisco, CA 94103',
      'phone': '+1-555-0456',
      'latitude': 37.7649,
      'longitude': -122.4294,
      'rating': 4.5,
      'reviewCount': 189,
      'distance': 1.2,
      'openingTime': '07:00',
      'closingTime': '22:00',
      'isOpen': true,
      'isWishlisted': true,
      'services': ['Basic Wash', 'Express Wash'],
      'priceRange': '\$10 - \$25',
    },
    {
      'id': 3,
      'name': 'Elite Auto Spa',
      'description': 'Luxury car detailing and premium services',
      'image': 'https://via.placeholder.com/300x200',
      'address': '321 Pine Street, San Francisco, CA 94104',
      'phone': '+1-555-0789',
      'latitude': 37.7949,
      'longitude': -122.3994,
      'rating': 4.9,
      'reviewCount': 312,
      'distance': 2.1,
      'openingTime': '09:00',
      'closingTime': '18:00',
      'isOpen': false,
      'isWishlisted': false,
      'services': ['Premium Wash', 'Full Detail'],
      'priceRange': '\$30 - \$100',
    },
    {
      'id': 4,
      'name': 'Eco Wash Station',
      'description': 'Environmentally friendly car wash services',
      'image': 'https://via.placeholder.com/300x200',
      'address': '654 Green Street, San Francisco, CA 94105',
      'phone': '+1-555-0321',
      'latitude': 37.7549,
      'longitude': -122.4394,
      'rating': 4.6,
      'reviewCount': 156,
      'distance': 1.8,
      'openingTime': '08:30',
      'closingTime': '19:30',
      'isOpen': true,
      'isWishlisted': true,
      'services': ['Basic Wash', 'Premium Wash', 'Express Wash'],
      'priceRange': '\$12 - \$35',
    },
  ];
}
