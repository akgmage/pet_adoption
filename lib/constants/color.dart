import 'package:flutter/material.dart';

const MaterialColor primaryBlack = MaterialColor(
  blackPrimaryValue,
  <int, Color>{
    50: Color(0xFF000000),
    100: Color(0xFF000000),
    200: Color(0xFF000000),
    300: Color(0xFF000000),
    400: Color(0xFF000000),
    500: Color(blackPrimaryValue),
    600: Color(0xFF000000),
    700: Color(0xFF000000),
    800: Color(0xFF000000),
    900: Color(0xFF000000),
  },
);
const MaterialColor primaryWhite = MaterialColor(
  whitePrimaryValue,
  <int, Color>{
    50: Color(0xFFFFFFFF),
    100: Color(0xFFFFFFFF),
    200: Color(0xFFFFFFFF),
    300: Color(0xFFFFFFFF),
    400: Color(0xFFFFFFFF),
    500: Color(0xFFFFFFFF),
    600: Color(0xFFFFFFFF),
    700: Color(0xFFFFFFFF),
    800: Color(0xFFFFFFFF),
    900: Color(0xFFFFFFFF),
  },
);
const int blackPrimaryValue = 0xFF000000;
const int whitePrimaryValue = 0xFFFFFFFF;

class AppColors {
  static const Color lightBlue = Color(0xff7cb9df);
  static const Color pastel = Color(0xfff7ebd9);
  static const Color darkBlack = Color(0xff121212);
  static const Color darkModeBlack = Color(0xFF282828);
}
