import 'dart:ui';

import 'package:flutter/material.dart';

import '../constants/color.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      primaryTextTheme: Theme.of(context).textTheme.apply(
            bodyColor: Colors.pink,
            displayColor: Colors.pink,
          ),
      primarySwatch: isDarkTheme ? primaryWhite : primaryBlack,
      shadowColor: isDarkTheme ? Color(0xFF282828) : Colors.deepPurple,
      primaryColor: isDarkTheme ? Colors.black : Colors.white,
      backgroundColor: isDarkTheme ? Color(0xFF404040) : Color(0xffF1F5FB),
      indicatorColor: isDarkTheme ? Color(0xff0E1D36) : Color(0xffCBDCF8),
      hintColor: isDarkTheme ? Colors.white : Colors.black,
      highlightColor: isDarkTheme ? Color(0xff372901) : Color(0xffFCE192),
      hoverColor: isDarkTheme ? Color(0xff3A3A3B) : Color(0xff4285F4),
      focusColor: isDarkTheme ? Colors.white : Colors.white,
      disabledColor: Colors.grey,
      cardColor: isDarkTheme ? Color(0xFF282828) : Color(0xfff7ebd9),
      canvasColor: isDarkTheme ? Color(0xFF282828) : Color(0xfff7ebd9),
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme ? ColorScheme.dark() : ColorScheme.light()),
      appBarTheme: AppBarTheme(
        backgroundColor: isDarkTheme ? Color(0xff181811) : Color(0xff7cb9df),
        elevation: 5.0,
      ),
    );
  }
}
