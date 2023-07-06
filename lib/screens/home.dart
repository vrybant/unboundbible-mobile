import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:unboundbible/core/lib.dart';
import 'package:unboundbible/screens/bible.dart';
import 'package:unboundbible/screens/search.dart';
import 'package:unboundbible/screens/shelf.dart';
import 'package:unboundbible/screens/options.dart';
import 'package:unboundbible/controllers/bar_controller.dart';

class HomePage extends StatelessWidget {
  final List<Widget> pages = [
    BiblePage(),
    Text('Detail'),
    Text('Detail'),
    Text('Detail'),
    // SearchPage(),
    // ShelfPage(),
    // OptionsPage(),
  ];

  final List<BottomNavigationBarItem> _cupertinoNavigationItems = [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      label: 'Библия',
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.search),
      label: 'Поиск',
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.book),
      label: 'Перевод',
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.settings),
      label: 'Настройки',
    ),
  ];

  final List<BottomNavigationBarItem> _materialNavigationItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Библия',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: 'Поиск',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.bookmark_border),
      label: 'Перевод',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Настройки',
    ),
  ];

  // final List<BottomNavigationBarItem> _navigationItems = [
  //   BottomNavigationBarItem(
  //     icon: cupertino ? Icon(CupertinoIcons.home) : Icon(Icons.home),
  //     label: 'Библия',
  //   ),
  //   BottomNavigationBarItem(
  //     icon: cupertino ? Icon(CupertinoIcons.search) : Icon(Icons.search),
  //     label: 'Поиск',
  //   ),
  //   BottomNavigationBarItem(
  //     icon: cupertino ? Icon(CupertinoIcons.book) : Icon(Icons.bookmark_border),
  //     label: 'Перевод',
  //   ),
  //   BottomNavigationBarItem(
  //     icon: cupertino ? Icon(CupertinoIcons.settings) : Icon(Icons.settings),
  //     label: 'Настройки',
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => PlatformScaffold(
        bottomNavBar: PlatformNavBar(
          currentIndex: barController.index,
          itemChanged: (value) => barController.update(value),
          cupertino: (_, __) {
            return CupertinoTabBarData(
              items: _cupertinoNavigationItems,
              iconSize: 22,
              currentIndex: barController.index,
            );
          },
          material: (_, __) {
            return MaterialNavBarData(
              items: _materialNavigationItems,
              type: BottomNavigationBarType.fixed,
              iconSize: 26,
              selectedFontSize: 12,
              backgroundColor: Colors.blue,
              selectedItemColor: Colors.amber[800],
            );
          },
        ),
        body: IndexedStack(
          index: barController.index,
          children: pages,
        ),
      ),
    );
  }
}
