import 'package:flutter/material.dart';

class Design {
  static double get appBarHeight => 80.0;

  static double getMatirialHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double getMatirialWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static ThemeData getThemeData() {
    return ThemeData(
      primaryColor: const Color(0xFF3D5A80),
      backgroundColor: const Color(0xFF293241),
      colorScheme: const ColorScheme.light(
        primary: Color(0xFF3D5A80),
        secondary: Color(0xFFEE6C4D),
        background: Color(0xFF293241),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: const Color(0xFF3D5A80),
        toolbarHeight: appBarHeight,
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: 40.0,
          color: Color(0xFFFFFFFF),
          fontWeight: FontWeight.bold,
        ),
        titleSmall: TextStyle(
          fontSize: 28.0,
          color: Color(0xFFFFFFFF),
          fontWeight: FontWeight.normal,
        ),
        bodyLarge: TextStyle(
          fontSize: 18.0,
          color: Color(0xFFFFFFFF),
          fontWeight: FontWeight.normal,
        ),
        bodySmall: TextStyle(
          fontSize: 16.0,
          color: Color(0xFFFFFFFF),
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
