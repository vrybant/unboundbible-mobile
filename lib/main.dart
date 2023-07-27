import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:unboundbible/routes.dart';
import 'package:unboundbible/themes.dart';
import 'package:unboundbible/core/tools.dart';

// https://docs.flutter.dev/accessibility-and-localization/internationalization
// https://docs.flutter.dev/resources/platform-adaptations

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
    return PlatformProvider(
      initialPlatform: TargetPlatform.iOS,
      settings: PlatformSettingsData(
        iosUsesMaterialWidgets: true,
        iosUseZeroPaddingForAppbarPlatformIcon: true,
      ),
      builder: (context) => PlatformTheme(
        themeMode: theme_Mode,
        materialLightTheme: lightTheme,
        materialDarkTheme: darkTheme,
        cupertinoLightTheme: cupertinoLightTheme,
        cupertinoDarkTheme: cupertinoDarkTheme,
        matchCupertinoSystemChromeBrightness: true,
        onThemeModeChanged: (themeMode) {
          theme_Mode = themeMode; /* you can save to storage */
        },
        builder: (context) => PlatformApp.router(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: Locale('ru'),
          routerConfig: appRoutes,
          title: _title,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
