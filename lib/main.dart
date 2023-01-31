import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:unboundbible/core/tools.dart';
import 'package:unboundbible/widgets/details_page.dart';
import 'package:unboundbible/widgets/main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initialization();

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    await DesktopWindow.setWindowSize(Size(400, 700));
  }

  runApp(
    const ProviderScope(child: UnboundBible()),
  );
}

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) => MainPage(),
      routes: [
        GoRoute(
          path: 'details',
          builder: (BuildContext context, GoRouterState state) => DetailsScreen(),
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
