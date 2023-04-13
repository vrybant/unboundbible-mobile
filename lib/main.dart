import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:get_it/get_it.dart';

import 'package:unboundbible/core/tools.dart';
import 'package:unboundbible/widgets/chapters_page.dart';
import 'package:unboundbible/widgets/main_page.dart';
import 'package:unboundbible/widgets/titles_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initialization();
  GetIt.I.registerSingleton<Tools>(Tools());

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    await DesktopWindow.setWindowSize(Size(400, 700));
  }

  runApp(UnboundBible());
}

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) => MainPage(),
      routes: [
        GoRoute(
          path: 'titles',
          builder: (context, state) => TitlesPage(),
          routes: [
            GoRoute(
              path: 'chapters',
              builder: (context, state) => ChaptersPage(),
            ),
          ],
        ),
      ],
    ),
  ],
);

class UnboundBible extends StatelessWidget {
  const UnboundBible({Key? key}) : super(key: key);

  static const String _title = 'Unbound Bible';

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
