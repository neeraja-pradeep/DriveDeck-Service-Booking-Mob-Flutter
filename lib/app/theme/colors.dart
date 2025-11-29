import 'package:flutter/material.dart';

/// Application color palette and theme colors.
/// Centralizes all color definitions for consistent theming.
class AppColors {
  AppColors._();

  // Primary colors
  static const Color primary = Color(0xFF4A90E2);
  static const Color primaryLight = Color(0xFF4FC3F7);
  static const Color primaryDark = Color(0xFF1976D2);

  // Secondary colors
  static const Color secondary = Color(0xFFFFB74D);
  static const Color secondaryLight = Color(0xFFFFE082);
  static const Color secondaryDark = Color(0xFFFF8F00);

  // Neutral colors
  static const Color background = Color(0xFFFFFFFF);
  static const Color surface = Color(0xFFF5F5F5);
  static const Color surfaceVariant = Color(0xFFE0E0E0);

  // Text colors
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color onSecondary = Color(0xFF000000);
  static const Color onBackground = Color(0xFF000000);
  static const Color onSurface = Color(0xFF000000);

  // Semantic colors
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFF9800);
  static const Color error = Color(0xFFF44336);
  static const Color info = Color(0xFF2196F3);

  // Border and divider colors
  static const Color border = Color(0xFFE0E0E0);
  static const Color borderFocused = primary;
  static const Color divider = Color(0xFFBDBDBD);

  // Input field colors
  static const Color inputFill = Color(0xFFF5F5F5);
  static const Color inputBorder = Color(0xFFE0E0E0);
  static const Color inputBorderFocused = primary;
  static const Color inputText = Color(0xFF000000);
  static const Color inputHint = Color(0xFF757575);

  // Button colors
  static const Color buttonPrimary = primary;
  static const Color buttonSecondary = secondary;
  static const Color buttonDisabled = Color(0xFFBDBDBD);
  static const Color buttonText = Color(0xFFFFFFFF);
  static const Color buttonTextSecondary = Color(0xFF000000);

  // Status colors
  static const Color online = Color(0xFF4CAF50);
  static const Color offline = Color(0xFF9E9E9E);
  static const Color pending = Color(0xFFFF9800);

  /// Create a ColorScheme for Material 3 theming
  static ColorScheme get lightColorScheme => const ColorScheme.light(
    primary: primary,
    onPrimary: onPrimary,
    secondary: secondary,
    onSecondary: onSecondary,
    surface: surface,
    onSurface: onSurface,
    background: background,
    onBackground: onBackground,
    error: error,
    onError: onPrimary,
  );

  /// Create a ColorScheme for Material 3 dark theming
  static ColorScheme get darkColorScheme => const ColorScheme.dark(
    primary: primaryLight,
    onPrimary: Color(0xFF000000),
    secondary: secondaryLight,
    onSecondary: Color(0xFF000000),
    surface: Color(0xFF121212),
    onSurface: Color(0xFFFFFFFF),
    background: Color(0xFF000000),
    onBackground: Color(0xFFFFFFFF),
    error: Color(0xFFCF6679),
    onError: Color(0xFF000000),
  );

  /// Get color by name for dynamic theming
  static Color getColor(String colorName) {
    switch (colorName.toLowerCase()) {
      case 'primary':
        return primary;
      case 'secondary':
        return secondary;
      case 'success':
        return success;
      case 'warning':
        return warning;
      case 'error':
        return error;
      case 'info':
        return info;
      default:
        return primary;
    }
  }
}
