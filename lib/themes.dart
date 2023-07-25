import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

ThemeMode? theme_Mode = ThemeMode.light; // initial brightness
//ThemeMode? theme_Mode = ThemeMode.dark;

ThemeData lightTheme = ThemeData(
//useMaterial3: true,
  colorSchemeSeed: Colors.blue,
  brightness: Brightness.light,
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
//primaryColor: Colors.yellow,
);

const cupertinoDefaultDarkTheme = CupertinoThemeData(brightness: Brightness.dark);

final cupertinoDarkTheme = MaterialBasedCupertinoThemeData(
  materialTheme: darkTheme.copyWith(
    cupertinoOverrideTheme: CupertinoThemeData(
      brightness: Brightness.dark,
      barBackgroundColor: cupertinoDefaultDarkTheme.barBackgroundColor,
      textTheme: CupertinoTextThemeData(
        primaryColor: Colors.white,
        navActionTextStyle: cupertinoDefaultDarkTheme.textTheme.navActionTextStyle.copyWith(
          color: const Color(0xF0F9F9F9),
        ),
        navLargeTitleTextStyle: cupertinoDefaultDarkTheme.textTheme.navLargeTitleTextStyle
            .copyWith(color: const Color(0xF0F9F9F9)),
      ),
    ),
  ),
);

final cupertinoLightTheme = MaterialBasedCupertinoThemeData(materialTheme: lightTheme);
