import 'package:flutter/material.dart';

class AppColors {
  static const _primaryColor = 0xFF336699;
  static const primaryColor = Color(_primaryColor);
  // static const primaryColor = Color(0xFF1D4447);
  static const accentColor = Color(0xFF336699);
  // static const accentColor = Color(0xFFF50D50);
  static const blue = Color(0xFFAEC6CF);
  static const green = Color(0xFFB2D8B0);
  static const purple = Color(0xFFB19CD9);
  static const golden = Color(0xFFFBC02D);
  static const peach = Color(0xFFFFDAB9);
  static const lavender = Color(0xFFE6E6FA);
  static const coral = Color(0xFFFF7F50);
  static const lilac = Color(0xFFDCD0FF);
  static const turquoise = Color(0xFFAFEEEE);
  static const salmon = Color(0xFFFFA07A);
  static const peachyPink = Color(0xFFFFDAB9);
  static const skyBlue = Color(0xFF87CEEB);
  static const lemon = Color(0xFFFFFACD);
  static const grey = Color(0xFF9E9E9E);
  static const darkGrey = Color(0x8A000000);
  static const black = Color(0xDD000000);
  static const lightGrey = Color(0xFFF5F5F5);
  static const white = Color(0xFFFFFFFF);
  static const scaffold = Color(0xFFFFFFFF);

  static const MaterialColor primary = MaterialColor(
    _primaryColor,
    <int, Color>{
      50: Color(0xFFE6F2F8),
      100: Color(0xFFB3D9E9),
      200: Color(0xFF80C0DA),
      300: Color(0xFF4DA7CB),
      400: Color(0xFF268FBF),
      500: Color(0xFF0077B3),
      600: Color(0xFF006BA6),
      700: Color(0xFF005D98),
      800: Color(0xFF004F8B),
      900: Color(0xFF003D73),
    },
  );

  MaterialColor generateMaterialColor(Color color) {
    final shades = <Color>[
      color,
      color.withOpacity(0.8),
      color.withOpacity(0.6),
      color.withOpacity(0.4),
      color.withOpacity(0.2),
      color.withOpacity(0.1),
      color.withOpacity(0.05),
    ];

    return MaterialColor(color.value, {
      50: shades[6],
      100: shades[5],
      200: shades[4],
      300: shades[3],
      400: shades[2],
      500: shades[1],
      600: shades[0],
      700: shades[1],
      800: shades[2],
      900: shades[3],
    });
  }
}
