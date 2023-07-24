import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:get_it/get_it.dart';

import 'package:unboundbible/routes.dart';
import 'package:unboundbible/core/tools.dart';

// https://docs.flutter.dev/resources/platform-adaptations

ThemeMode? theme_Mode = ThemeMode.light; // initial brightness

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initialization();
  GetIt.I.registerSingleton<Tools>(Tools());

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    await DesktopWindow.setWindowSize(Size(400, 700));
  }

  runApp(UnboundBible());
}

class UnboundBible extends StatelessWidget {
  const UnboundBible({Key? key}) : super(key: key);

  static const String _title = 'Unbound Bible';

  @override
  Widget build(BuildContext context) {
    final materialLightTheme = ThemeData.light();
    final materialDarkTheme = ThemeData.dark();

    const darkDefaultCupertinoTheme = CupertinoThemeData(brightness: Brightness.dark);
    final cupertinoDarkTheme = MaterialBasedCupertinoThemeData(
      materialTheme: materialDarkTheme.copyWith(
        cupertinoOverrideTheme: CupertinoThemeData(
          brightness: Brightness.dark,
          barBackgroundColor: darkDefaultCupertinoTheme.barBackgroundColor,
          textTheme: CupertinoTextThemeData(
            primaryColor: Colors.white,
            navActionTextStyle: darkDefaultCupertinoTheme.textTheme.navActionTextStyle.copyWith(
              color: const Color(0xF0F9F9F9),
            ),
            navLargeTitleTextStyle: darkDefaultCupertinoTheme.textTheme.navLargeTitleTextStyle
                .copyWith(color: const Color(0xF0F9F9F9)),
          ),
        ),
      ),
    );
    final cupertinoLightTheme = MaterialBasedCupertinoThemeData(materialTheme: materialLightTheme);

    return PlatformProvider(
      //initialPlatform: TargetPlatform.iOS,
      settings: PlatformSettingsData(
        iosUsesMaterialWidgets: true,
        iosUseZeroPaddingForAppbarPlatformIcon: true,
      ),
      builder: (context) => PlatformTheme(
        themeMode: theme_Mode,
        materialLightTheme: materialLightTheme,
        materialDarkTheme: materialDarkTheme,
        cupertinoLightTheme: cupertinoLightTheme,
        cupertinoDarkTheme: cupertinoDarkTheme,
        matchCupertinoSystemChromeBrightness: true,
        onThemeModeChanged: (themeMode) {
          theme_Mode = theme_Mode; /* you can save to storage */
        },
        builder: (context) => PlatformApp.router(
          localizationsDelegates: <LocalizationsDelegate<dynamic>>[
            DefaultMaterialLocalizations.delegate,
            DefaultWidgetsLocalizations.delegate,
            DefaultCupertinoLocalizations.delegate,
          ],
          routerConfig: appRoutes,
          title: _title,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
