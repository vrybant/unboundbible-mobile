import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:unboundbible/routes.dart';
import 'package:unboundbible/stores/bible_store.dart';
import 'package:unboundbible/theme.dart';
import 'package:unboundbible/core/tools.dart';

// https://docs.flutter.dev/accessibility-and-localization/internationalization

void setupLocator() {
  GetIt.I.registerSingleton<Tools>(Tools());
  GetIt.I.registerLazySingleton(() => BibleStore());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initialization();
  setupLocator();

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
    return MaterialApp.router(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale('ru'),
      routerConfig: appRoutes,
      title: _title,
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
