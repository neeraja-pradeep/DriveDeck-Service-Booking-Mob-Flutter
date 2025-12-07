import 'package:flutter/material.dart';

/// Application color palette and theme colors.
/// Centralizes all color definitions for consistent theming.
/// Combines both auth and homepage color systems for comprehensive coverage.
class AppColors {
  AppColors._();

  // ========== PRIMARY COLORS ==========
  // Auth system primary (lighter blue)
  static const Color primary = Color(0xFF4A90E2);
  static const Color primaryLight = Color(0xFF4FC3F7);
  static const Color primaryDark = Color(0xFF1976D2);

  // Homepage system primary (darker blue) - alternative
  static const Color primaryHomepage = Color(0xFF1E88E5);
  static const Color primaryHomepageLight = Color(0xFF6AB7FF);
  static const Color primaryHomepageDark = Color(0xFF005CB2);

  // ========== SECONDARY COLORS ==========
  // Auth system secondary (lighter orange)
  static const Color secondary = Color(0xFFFFB74D);
  static const Color secondaryLight = Color(0xFFFFE082);
  static const Color secondaryDark = Color(0xFFFF8F00);

  // Homepage system secondary (darker orange) - alternative
  static const Color secondaryHomepage = Color(0xFFFF9800);
  static const Color secondaryHomepageLight = Color(0xFFFFCC02);
  static const Color secondaryHomepageDark = Color(0xFFC66900);

  // ========== NEUTRAL COLORS - COMPLETE GREY SCALE ==========
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color grey50 = Color(0xFFFAFAFA);
  static const Color grey100 = Color(0xFFF5F5F5);
  static const Color grey200 = Color(0xFFEEEEEE);
  static const Color grey300 = Color(0xFFE0E0E0);
  static const Color grey400 = Color(0xFFBDBDBD);
  static const Color grey500 = Color(0xFF9E9E9E);
  static const Color grey600 = Color(0xFF757575);
  static const Color grey700 = Color(0xFF616161);
  static const Color grey800 = Color(0xFF424242);
  static const Color grey900 = Color(0xFF212121);

  // ========== BACKGROUND & SURFACE ==========
  static const Color background = Color(0xFFF5F5F5);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceVariant = Color(0xFFE0E0E0);
  static const Color cardBackground = Color(0xFFFFFFFF);

  // ========== TEXT COLORS ==========
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textHint = Color(0xFFBDBDBD);
  static const Color textOnPrimary = Color(0xFFFFFFFF);
  static const Color textOnSecondary = Color(0xFF000000);

  // Material 3 text colors
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color onSecondary = Color(0xFF000000);
  static const Color onSurface = Color(0xFF000000);

  // ========== SEMANTIC COLORS ==========
  static const Color success = Color(0xFF4CAF50);
  static const Color successLight = Color(0xFFE8F5E9);
  static const Color error = Color(0xFFF44336);
  static const Color errorLight = Color(0xFFFFEBEE);
  static const Color warning = Color(0xFFFF9800);
  static const Color warningLight = Color(0xFFFFF3E0);
  static const Color info = Color(0xFF2196F3);
  static const Color infoLight = Color(0xFFE3F2FD);

  // ========== BORDERS & DIVIDERS ==========
  static const Color border = Color(0xFFE0E0E0);
  static const Color borderFocused = primary;
  static const Color divider = Color(0xFFE0E0E0);

  // ========== INPUT FIELD COLORS ==========
  static const Color inputFill = Color(0xFFF5F5F5);
  static const Color inputBorder = Color(0xFFE0E0E0);
  static const Color inputBorderFocused = primary;
  static const Color inputText = Color(0xFF000000);
  static const Color inputHint = Color(0xFF757575);

  // ========== BUTTON COLORS ==========
  static const Color buttonPrimary = primary;
  static const Color buttonSecondary = secondary;
  static const Color buttonDisabled = Color(0xFFBDBDBD);
  static const Color buttonText = Color(0xFFFFFFFF);
  static const Color buttonTextSecondary = Color(0xFF000000);

  // ========== STATUS COLORS ==========
  static const Color online = Color(0xFF4CAF50);
  static const Color offline = Color(0xFF9E9E9E);
  static const Color pending = Color(0xFFFF9800);

  // ========== UI COMPONENT COLORS ==========
  // Star rating colors
  static const Color starFilled = Color(0xFFFFB400);
  static const Color starEmpty = Color(0xFFE0E0E0);

  // Heart/wishlist colors
  static const Color heartFilled = Color(0xFFE91E63);
  static const Color heartEmpty = Color(0xFF9E9E9E);

  // Tab colors
  static const Color tabActive = Color(0xFF1E88E5);
  static const Color tabInactive = Color(0xFF9E9E9E);

  // Shimmer effect colors
  static const Color shimmerBase = Color(0xFFE0E0E0);
  static const Color shimmerHighlight = Color(0xFFF5F5F5);

  // ========== EFFECTS ==========
  static const Color shadow = Color(0x1A000000);

  /// Create a ColorScheme for Material 3 light theming
  static ColorScheme get lightColorScheme => const ColorScheme.light(
    primary: primary,
    onPrimary: onPrimary,
    secondary: secondary,
    onSecondary: onSecondary,
    surface: surface,
    onSurface: onSurface,
    error: error,
    onError: onPrimary,
    surfaceVariant: surfaceVariant,
    outline: border,
  );

  /// Create a ColorScheme for Material 3 dark theming
  static ColorScheme get darkColorScheme => const ColorScheme.dark(
    primary: primaryLight,
    onPrimary: black,
    secondary: secondaryLight,
    onSecondary: black,
    surface: grey800,
    onSurface: white,
    error: Color(0xFFCF6679),
    onError: black,
    surfaceVariant: grey700,
    outline: grey600,
  );

  /// Get color by name for dynamic theming
  static Color getColor(String colorName) {
    switch (colorName.toLowerCase()) {
      // Primary colors
      case 'primary':
        return primary;
      case 'primarylight':
        return primaryLight;
      case 'primarydark':
        return primaryDark;
      case 'primaryhomepage':
        return primaryHomepage;

      // Secondary colors
      case 'secondary':
        return secondary;
      case 'secondarylight':
        return secondaryLight;
      case 'secondarydark':
        return secondaryDark;
      case 'secondaryhomepage':
        return secondaryHomepage;

      // Semantic colors
      case 'success':
        return success;
      case 'error':
        return error;
      case 'warning':
        return warning;
      case 'info':
        return info;

      // Grey scale
      case 'grey50':
        return grey50;
      case 'grey100':
        return grey100;
      case 'grey200':
        return grey200;
      case 'grey300':
        return grey300;
      case 'grey400':
        return grey400;
      case 'grey500':
        return grey500;
      case 'grey600':
        return grey600;
      case 'grey700':
        return grey700;
      case 'grey800':
        return grey800;
      case 'grey900':
        return grey900;

      // Text colors
      case 'textprimary':
        return textPrimary;
      case 'textsecondary':
        return textSecondary;
      case 'texthint':
        return textHint;

      // UI components
      case 'starfilled':
        return starFilled;
      case 'starempty':
        return starEmpty;
      case 'heartfilled':
        return heartFilled;
      case 'heartempty':
        return heartEmpty;

      default:
        return primary;
    }
  }

  /// Get semantic color with light variant
  static Color getSemanticColor(String type, {bool isLight = false}) {
    switch (type.toLowerCase()) {
      case 'success':
        return isLight ? successLight : success;
      case 'error':
        return isLight ? errorLight : error;
      case 'warning':
        return isLight ? warningLight : warning;
      case 'info':
        return isLight ? infoLight : info;
      default:
        return primary;
    }
  }

  /// Get grey color by intensity (50-900)
  static Color getGrey(int intensity) {
    switch (intensity) {
      case 50:
        return grey50;
      case 100:
        return grey100;
      case 200:
        return grey200;
      case 300:
        return grey300;
      case 400:
        return grey400;
      case 500:
        return grey500;
      case 600:
        return grey600;
      case 700:
        return grey700;
      case 800:
        return grey800;
      case 900:
        return grey900;
      default:
        return grey500;
    }
  }
}
