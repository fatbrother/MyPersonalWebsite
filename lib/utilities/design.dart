import 'package:flutter/material.dart';

class ColorSet {
  static const Color primary = Color.fromARGB(255, 63, 130, 255);
  static const Color secondary = Color.fromARGB(255, 155, 218, 255);
  static const Color background = Color.fromARGB(255, 255, 255, 255);
  static const Color text = Color.fromARGB(255, 0, 0, 0);
}

class Design {
  static double get appBarHeight => 70.0;
  static double get bottomBarHeight => 100.0;

  static double getMatirialHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double getMatirialWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static ThemeData getThemeData() {
    return ThemeData(
      colorScheme: const ColorScheme.light(
        primary: ColorSet.primary,
        secondary: ColorSet.secondary,
        background: ColorSet.background,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: ColorSet.secondary,
        toolbarHeight: appBarHeight,
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: 40.0,
          color: ColorSet.text,
          fontWeight: FontWeight.bold,
        ),
        titleSmall: TextStyle(
          fontSize: 28.0,
          color: ColorSet.text,
          fontWeight: FontWeight.bold,
        ),
        bodyLarge: TextStyle(
          fontSize: 24.0,
          color: ColorSet.text,
          fontWeight: FontWeight.bold,
        ),
        bodySmall: TextStyle(
          fontSize: 16.0,
          color: ColorSet.text,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
