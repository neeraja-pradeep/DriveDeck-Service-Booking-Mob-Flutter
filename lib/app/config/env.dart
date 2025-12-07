/// Environment configuration for the application.
/// Handles different environments (dev, staging, prod) and their configurations.
class Env {
  Env._();

  /// Current environment
  static Environment get environment => _environment;
  static Environment _environment = Environment.development;

  /// API base URL based on current environment
  static String get apiBaseUrl {
    switch (_environment) {
      case Environment.development:
        // TODO: Replace with HTTPS URL when available
        // For now using existing server for development
        return 'http://156.67.104.149:8110';
      case Environment.staging:
        return 'https://staging-api.drivedeck.com';
      case Environment.production:
        return 'https://api.drivedeck.com';
    }
  }

  /// Initialize environment from build configuration or environment variables
  static void initialize({Environment? env}) {
    // Use provided environment or detect from build mode
    _environment = env ?? _detectEnvironment();

    // debugPrint('🌍 Environment: Initialized as ${_environment.name}');
    // debugPrint('🌍 API Base URL: $apiBaseUrl');
  }

  /// Detect environment based on build configuration
  static Environment _detectEnvironment() {
    // In a real app, you might check:
    // - Environment variables: String.fromEnvironment('ENV')
    // - Build flavors: kDebugMode, kProfileMode, kReleaseMode
    // - Package info: PackageInfo.fromPlatform()

    // For now, using a simple approach based on build mode
    const env = String.fromEnvironment('ENV', defaultValue: 'dev');

    switch (env.toLowerCase()) {
      case 'prod':
      case 'production':
        return Environment.production;
      case 'staging':
      case 'stage':
        return Environment.staging;
      case 'dev':
      case 'development':
      default:
        return Environment.development;
    }
  }

  /// Check if current environment is development
  static bool get isDevelopment => _environment == Environment.development;

  /// Check if current environment is staging
  static bool get isStaging => _environment == Environment.staging;

  /// Check if current environment is production
  static bool get isProduction => _environment == Environment.production;

  /// Get environment-specific configuration values
  static Map<String, dynamic> get config {
    switch (_environment) {
      case Environment.development:
        return {
          'apiTimeout': 30000, // 30 seconds
          'enableLogging': true,
          'enableDebugMode': true,
          'maxRetries': 3,
        };
      case Environment.staging:
        return {
          'apiTimeout': 30000,
          'enableLogging': true,
          'enableDebugMode': false,
          'maxRetries': 3,
        };
      case Environment.production:
        return {
          'apiTimeout': 15000, // 15 seconds for production
          'enableLogging': false,
          'enableDebugMode': false,
          'maxRetries': 2,
        };
    }
  }
}

/// Available environments
enum Environment {
  development,
  staging,
  production;

  /// Display name for the environment
  String get displayName {
    switch (this) {
      case Environment.development:
        return 'Development';
      case Environment.staging:
        return 'Staging';
      case Environment.production:
        return 'Production';
    }
  }
}
