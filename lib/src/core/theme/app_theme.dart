import 'package:flutter/material.dart';

// ثيم التطبيق بألوان مخصصة
class AppTheme {
  // الألوان الأساسية
  static const Color primaryColor = Color(0xFF2E7D32); // أخضر أساسي
  static const Color primaryDark = Color(0xFF1B5E20); // أخضر غامق
  static const Color primaryLight = Color(0xFF4CAF50); // أخضر فاتح
  static const Color secondaryColor = Color(0xFF607D8B); // أزرق رمادي
  static const Color accentColor = Color(0xFFFFC107); // أصفر مميز
  
  // ألوان النصوص
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textLight = Color(0xFFFFFFFF);
  
  // ألوان الخلفية
  static const Color background = Color(0xFFFAFAFA);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color error = Color(0xFFD32F2F);
  
  // ألوان الحالة
  static const Color success = Color(0xFF388E3C);
  static const Color warning = Color(0xFFFFA000);
  static const Color info = Color(0xFF1976D2);
  
  // الثيم الفاتح
  static final ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    primaryColorDark: primaryDark,
    primaryColorLight: primaryLight,
    colorScheme: const ColorScheme.light(
      primary: primaryColor,
      secondary: secondaryColor,
      surface: surface,
      background: background,
      error: error,
    ),
    scaffoldBackgroundColor: background,
    fontFamily: 'Tajawal',
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryColor,
      foregroundColor: textLight,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontFamily: 'Tajawal',
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: textLight,
      ),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontFamily: 'Tajawal', fontSize: 32, fontWeight: FontWeight.bold, color: textPrimary),
      displayMedium: TextStyle(fontFamily: 'Tajawal', fontSize: 28, fontWeight: FontWeight.bold, color: textPrimary),
      displaySmall: TextStyle(fontFamily: 'Tajawal', fontSize: 24, fontWeight: FontWeight.bold, color: textPrimary),
      headlineMedium: TextStyle(fontFamily: 'Tajawal', fontSize: 20, fontWeight: FontWeight.bold, color: textPrimary),
      headlineSmall: TextStyle(fontFamily: 'Tajawal', fontSize: 18, fontWeight: FontWeight.bold, color: textPrimary),
      titleLarge: TextStyle(fontFamily: 'Tajawal', fontSize: 16, fontWeight: FontWeight.bold, color: textPrimary),
      bodyLarge: TextStyle(fontFamily: 'Tajawal', fontSize: 16, color: textPrimary),
      bodyMedium: TextStyle(fontFamily: 'Tajawal', fontSize: 14, color: textPrimary),
      bodySmall: TextStyle(fontFamily: 'Tajawal', fontSize: 12, color: textSecondary),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: surface,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: primaryColor),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: error),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    ),
    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      buttonColor: primaryColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: textLight,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        textStyle: const TextStyle(fontFamily: 'Tajawal', fontWeight: FontWeight.bold),
      ),
    ),
    cardTheme: CardTheme(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.all(8),
    ),
  );
  
  // الثيم الداكن
  static final ThemeData darkTheme = ThemeData(
    primaryColor: primaryLight,
    brightness: Brightness.dark,
    fontFamily: 'Tajawal',
    // إعدادات الثيم الداكن...
  );
}