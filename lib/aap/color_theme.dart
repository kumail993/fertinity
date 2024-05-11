import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFF0A3440);
  static const background = Color.fromRGBO(245,245,250,1);
  static const secondary = Color.fromRGBO(244, 146, 59, 1);
  static const customBlack = Color(0xFF222831);
  static const customWhite = Color(0xFFFBFBFB);
  static const customGrey = Color(0xFF959595);
  static const lightGrey = Color(0xFFE2E8F0);

  static const customLightGrey = Color(0xFFD9D5D5);

  static const MaterialColor primarySwatch = MaterialColor(
    0xFF0A3440,
    <int, Color>{
      50: primary,
      100: primary,
      200: primary,
      300: primary,
      400: primary,
      500: primary,
      600: primary,
      700: primary,
      800: primary,
      900: primary,
    },
  );
}