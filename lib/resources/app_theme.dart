import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static Color error = Colors.red[700]!;
  static final Color primaryColor = Color(0xff9a2c9f);
  static final Color primaryColorLite = Color(0xff9a2c9f);
  static final Color primarySwatchColor = Color(0xff9a2c9f);
  static final Color primaryDarkColor = Color(0xff9a2c9f);

  static final ThemeData ReqResUserThemeData = ThemeData(
    fontFamily: 'roboto',
    brightness: Brightness.light,
    primarySwatch: Colors.purple,
    primaryColor: primaryDarkColor,
    primaryColorDark: primarySwatchColor,
    accentColor: primaryColor,
  );

  static Gradient purpleGradientLeft = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.topRight,
      colors: [Color(0xFF9428A4), Color(0xfffa6a45)]);

  static Gradient purpleGradientRight = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.topRight,
      colors: [Color(0xfffa6a45), Color(0xFF9428A4)]);

  static Gradient blueGradientLeft = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.topRight,
      colors: [Color(0xff363d9f), Color(0xFF7522A2)]);

  static Gradient whiteGradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.topRight,
      colors: [Color(0xffffffff), Color(0xFFFFFFFF)]);
}
