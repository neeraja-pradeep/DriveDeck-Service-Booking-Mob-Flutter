import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Abstract class for checking network connectivity.
abstract class NetworkInfo {
  /// Check if the device is connected to the internet.
  Future<bool> get isConnected;
}

/// Implementation of NetworkInfo.
/// Currently returns true always for development.
/// TODO: Implement actual connectivity check using connectivity_plus package.
class NetworkInfoImpl implements NetworkInfo {
  @override
  Future<bool> get isConnected async {
    // For development, always return true
    // In production, use connectivity_plus package to check actual connectivity
    return true;
  }
}

/// Provider for network info.
final networkInfoProvider = Provider<NetworkInfo>((ref) {
  return NetworkInfoImpl();
});
