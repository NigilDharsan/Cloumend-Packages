import 'dart:ui';

class CvsColors {
  static const Color _defaultPrimaryColor = Color(0xFF6200EE);

  static Color? _primaryColor;

  /// Call this from your project to override the primary color
  static void setPrimaryColor(Color color) {
    _primaryColor = color;
  }

  /// Always safe to access, falls back if not set
  static Color get primaryColor => _primaryColor ?? _defaultPrimaryColor;
}
