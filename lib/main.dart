import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:get_it/get_it.dart';
import 'package:unboundbible/routes.dart';
import 'package:unboundbible/core/tools.dart';
import 'package:unboundbible/adaptive.dart';

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
    return isCupertino
        ? CupertinoApp.router(
            routerConfig: appRoutes,
            title: _title,
            theme: CupertinoThemeData(brightness: Brightness.light),
            debugShowCheckedModeBanner: false,
          )
        : MaterialApp.router(
            routerConfig: appRoutes,
            title: _title,
            theme: ThemeData(
              useMaterial3: true,
              colorSchemeSeed: isCupertino ? CupertinoColors.systemGrey : const Color(0xff6750a4),
            ),
            debugShowCheckedModeBanner: false,
          );
  }
}
