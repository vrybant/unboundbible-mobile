import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import 'package:unboundbible/screens/chapters.dart';
import 'package:unboundbible/screens/home.dart';
import 'package:unboundbible/widgets/titles.dart';

final GoRouter appRoutes = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) => HomePage(),
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
