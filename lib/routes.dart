import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:unboundbible/widgets/chapters_page.dart';
import 'package:unboundbible/widgets/main_page.dart';
import 'package:unboundbible/widgets/titles_page.dart';

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
