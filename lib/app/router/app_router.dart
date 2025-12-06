import 'package:flutter/material.dart';

import '../../features/shop/presentation/screens/checkout_screen.dart';
import '../../features/shop/presentation/screens/date_time_selection_screen.dart';
import '../../features/shop/presentation/screens/shop_detail_screen.dart';

/// Application routes.
class AppRoutes {
  AppRoutes._();

  static const String home = '/';
  static const String shopDetail = '/shop';
  static const String dateTimeSelection = '/booking/date-time';
  static const String checkout = '/booking/checkout';
  static const String bookingSuccess = '/booking/success';

  /// Helper to build shop detail path.
  static String shopDetailPath(String shopId) => '/shop/$shopId';
}

/// Route generator for the application.
class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) => const ShopListScreen(),
        );

      case AppRoutes.shopDetail:
        final args = settings.arguments as ShopDetailScreenArgs;
        return MaterialPageRoute(
          builder: (_) => ShopDetailScreen(args: args),
        );

      case AppRoutes.dateTimeSelection:
        final shopId = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => DateTimeSelectionScreen(shopId: shopId),
        );

      case AppRoutes.checkout:
        return MaterialPageRoute(
          builder: (_) => const CheckoutScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}

/// Temporary shop list screen for testing.
class ShopListScreen extends StatelessWidget {
  const ShopListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Car Wash Shops'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildShopCard(
            context,
            shopId: '1',
            name: 'Ace Car Spa',
            rating: 4.9,
            reviews: 25,
            location: 'Palazhi, Calicut',
          ),
          const SizedBox(height: 16),
          _buildShopCard(
            context,
            shopId: '2',
            name: 'Premium Auto Care',
            rating: 4.7,
            reviews: 42,
            location: 'Mavoor Road, Calicut',
          ),
        ],
      ),
    );
  }

  Widget _buildShopCard(
    BuildContext context, {
    required String shopId,
    required String name,
    required double rating,
    required int reviews,
    required String location,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            AppRoutes.shopDetail,
            arguments: ShopDetailScreenArgs(
              shopId: shopId,
              shopName: name,
            ),
          );
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.car_repair,
                  size: 40,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          size: 16,
                          color: Colors.amber,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '$rating ($reviews reviews)',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          size: 16,
                          color: Colors.grey[500],
                        ),
                        const SizedBox(width: 4),
                        Text(
                          location,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.chevron_right,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
