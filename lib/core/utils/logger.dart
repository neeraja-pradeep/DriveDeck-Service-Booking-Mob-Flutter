import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';

import '../../app/config/env.dart';

/// Application logger utility.
/// Provides environment-aware logging with different levels and categories.
class Logger {
  Logger._();

  /// Whether logging is enabled based on environment configuration
  static bool get _isLoggingEnabled =>
      Env.config['enableLogging'] as bool? ?? kDebugMode;

  /// Log debug information
  static void debug(String message, {String? tag}) {
    if (_isLoggingEnabled) {
      developer.log(
        message,
        name: tag ?? 'DEBUG',
        level: 500, // Debug level
      );
    }
  }

  /// Log informational messages
  static void info(String message, {String? tag}) {
    if (_isLoggingEnabled) {
      developer.log(
        message,
        name: tag ?? 'INFO',
        level: 800, // Info level
      );
    }
  }

  /// Log warnings
  static void warning(String message, {String? tag}) {
    if (_isLoggingEnabled) {
      developer.log(
        message,
        name: tag ?? 'WARNING',
        level: 900, // Warning level
      );
    }
  }

  /// Log errors (always logged, even in production)
  static void error(
    String message, {
    String? tag,
    Object? error,
    StackTrace? stackTrace,
  }) {
    developer.log(
      message,
      name: tag ?? 'ERROR',
      level: 1000, // Error level
      error: error,
      stackTrace: stackTrace,
    );
  }

  /// Log authentication-related events
  static void auth(String message) {
    debug('🔐 $message', tag: 'AUTH');
  }

  /// Log network-related events
  static void network(String message) {
    debug('🌐 $message', tag: 'NETWORK');
  }

  /// Log UI-related events
  static void ui(String message) {
    debug('🎨 $message', tag: 'UI');
  }

  /// Log navigation events
  static void navigation(String message) {
    debug('🧭 $message', tag: 'NAVIGATION');
  }

  /// Log provider/state management events
  static void provider(String message) {
    debug('🔄 $message', tag: 'PROVIDER');
  }

  /// Log storage-related events
  static void storage(String message) {
    debug('💾 $message', tag: 'STORAGE');
  }

  /// Log timer-related events
  static void timer(String message) {
    debug('⏰ $message', tag: 'TIMER');
  }

  /// Log validation events
  static void validation(String message) {
    debug('✅ $message', tag: 'VALIDATION');
  }

  /// Log performance-related events
  static void performance(String message) {
    debug('⚡ $message', tag: 'PERFORMANCE');
  }

  /// Log security-related events (always logged)
  static void security(String message) {
    error('🔒 SECURITY: $message', tag: 'SECURITY');
  }
}
