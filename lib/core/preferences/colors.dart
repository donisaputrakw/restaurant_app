import 'package:flutter/material.dart';

class AppColors {
  const AppColors._();

  static final Color primaryColor = deepPurple[600]!;
  static final Color secondaryColor = black[200]!;

  static const MaterialColor red = MaterialColor(
    0xFFEB4755,
    {
      200: Color(0xFFF28C95),
      400: Color(0xFFED5E6A),
      500: Color(0xFFEB4755),
      600: Color(0xFFE83040),
      800: Color(0xFFCF1726),
    },
  );

  static const MaterialColor blue = MaterialColor(
    0xFF476BEB,
    {
      200: Color(0xFF8CA3F2),
      400: Color(0xFF5E7EED),
      500: Color(0xFF476BEB),
      600: Color(0xFF3059E8),
      800: Color(0xFF173FCF),
    },
  );

  static const MaterialColor black = MaterialColor(
    0xFF333333,
    {
      200: Color(0xFF999999),
      400: Color(0xFF808080),
      500: Color(0xFF666666),
      600: Color(0xFF4D4D4D),
      800: Color(0xFF333333),
    },
  );

  static const MaterialColor deepPurple = MaterialColor(
    0xFF2A2760,
    {
      200: Color(0xFF555280),
      400: Color(0xFF4A4778),
      500: Color(0xFF3F3D70),
      600: Color(0xFF353268),
      800: Color(0xFF28255B),
    },
  );
}
