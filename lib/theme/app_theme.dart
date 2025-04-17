import 'package:bofa_client/theme/color_const.dart';

import 'app_typography.dart';
import 'package:flutter/material.dart';

ThemeData appTheme({ColorScheme? colorScheme, bool isDark = false}) {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(color: AppColor.black)),
    navigationBarTheme: const NavigationBarThemeData(
      indicatorColor: Colors.transparent,
      backgroundColor: Colors.white,
      elevation: 20,
    ),
    colorScheme: colorScheme,
    //colorSchemeSeed: Colors.purple,
    brightness: colorScheme != null
        ? null
        : isDark
            ? Brightness.dark
            : Brightness.light,
    useMaterial3: false,
    fontFamily: defaultFontFamily,
  );
}
