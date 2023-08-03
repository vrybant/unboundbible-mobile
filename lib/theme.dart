import 'package:flutter/material.dart';

ThemeMode? theme_Mode = ThemeMode.light; // initial brightness

ThemeData lightTheme = ThemeData(
//useMaterial3: true,
  colorSchemeSeed: Colors.blue,
  brightness: Brightness.light,
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
//primaryColor: Colors.yellow,
);
