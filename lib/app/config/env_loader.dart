import 'dart:io';

import 'package:flutter/foundation.dart';

import 'env.dart';

/// Loads environment configuration from various sources.
class EnvLoader {
  EnvLoader._();

  /// Load environment configuration from multiple sources.
  /// Priority: Command line args > Environment variables > Build configuration > Default
  static Environment loadEnvironment() {
    // 1. Check command line arguments (for development)
    final args = _getCommandLineArgs();
    if (args.containsKey('env')) {
      final env = _parseEnvironment(args['env']!);
      if (env != null) {
        debugPrint('🌍 EnvLoader: Environment from command line: ${env.name}');
        return env;
      }
    }

    // 2. Check environment variables
    final envVar =
        _getEnvironmentVariable('ENV') ??
        _getEnvironmentVariable('ENVIRONMENT') ??
        _getEnvironmentVariable('FLUTTER_ENV');
    if (envVar != null) {
      final env = _parseEnvironment(envVar);
      if (env != null) {
        debugPrint('🌍 EnvLoader: Environment from env var: ${env.name}');
        return env;
      }
    }

    // 3. Check build configuration (compile-time constants)
    const buildEnv = String.fromEnvironment('ENV', defaultValue: '');
    if (buildEnv.isNotEmpty) {
      final env = _parseEnvironment(buildEnv);
      if (env != null) {
        debugPrint('🌍 EnvLoader: Environment from build config: ${env.name}');
        return env;
      }
    }

    // 4. Default based on build mode
    final defaultEnv = _getDefaultEnvironment();
    debugPrint('🌍 EnvLoader: Using default environment: ${defaultEnv.name}');
    return defaultEnv;
  }

  /// Get command line arguments (mainly for development/testing).
  static Map<String, String> _getCommandLineArgs() {
    // In Flutter, command line args are not directly accessible
    // This is a placeholder for potential future implementation
    return {};
  }

  /// Get environment variable value.
  static String? _getEnvironmentVariable(String key) {
    try {
      return Platform.environment[key];
    } catch (e) {
      // Platform.environment might not be available in some contexts
      return null;
    }
  }

  /// Parse environment string to Environment enum.
  static Environment? _parseEnvironment(String env) {
    switch (env.toLowerCase().trim()) {
      case 'dev':
      case 'development':
        return Environment.development;
      case 'staging':
      case 'stage':
        return Environment.staging;
      case 'prod':
      case 'production':
        return Environment.production;
      default:
        return null;
    }
  }

  /// Get default environment based on build mode.
  static Environment _getDefaultEnvironment() {
    if (kDebugMode) {
      return Environment.development;
    } else if (kProfileMode) {
      return Environment.staging;
    } else {
      return Environment.production;
    }
  }

  /// Load configuration from a config file (future enhancement).
  static Future<Map<String, dynamic>?> loadConfigFile(String path) async {
    // Placeholder for loading configuration from files
    // Could be implemented to read from assets or external files
    return null;
  }

  /// Validate environment configuration.
  static bool validateEnvironment(Environment env) {
    try {
      // Basic validation - ensure API URL is accessible
      final config = _getEnvironmentConfig(env);
      return config['apiBaseUrl'] != null &&
          config['apiBaseUrl'].toString().isNotEmpty;
    } catch (e) {
      return false;
    }
  }

  /// Get environment-specific configuration.
  static Map<String, dynamic> _getEnvironmentConfig(Environment env) {
    switch (env) {
      case Environment.development:
        return {
          'apiBaseUrl': 'http://156.67.104.149:8110',
          'apiTimeout': 30000,
          'enableLogging': true,
          'enableDebugMode': true,
          'maxRetries': 3,
        };
      case Environment.staging:
        return {
          'apiBaseUrl': 'https://staging-api.drivedeck.com',
          'apiTimeout': 30000,
          'enableLogging': true,
          'enableDebugMode': false,
          'maxRetries': 3,
        };
      case Environment.production:
        return {
          'apiBaseUrl': 'https://api.drivedeck.com',
          'apiTimeout': 15000,
          'enableLogging': false,
          'enableDebugMode': false,
          'maxRetries': 2,
        };
    }
  }
}
