import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:unboundbible/screens/chapters.dart';
import 'package:unboundbible/screens/main.dart';
import 'package:unboundbible/screens/titles.dart';

final GoRouter appRoutes = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) => MainPage(),
      routes: [
        GoRoute(
          path: 'titles',
          builder: (BuildContext context, GoRouterState state) => TitlesPage(),
          routes: [
            GoRoute(
              path: 'chapters',
              builder: (BuildContext context, GoRouterState state) {
                final book = state.extra! as int;
                return ChaptersPage(book: book);
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
