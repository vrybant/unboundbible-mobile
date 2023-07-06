import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    SearchPage(),
    ShelfPage(),
    OptionsPage(),
  ];

  final List<BottomNavigationBarItem> _navigationItems = [
    BottomNavigationBarItem(
      icon: isCupertino ? Icon(CupertinoIcons.home) : Icon(Icons.home),
      label: 'Библия',
    ),
    BottomNavigationBarItem(
      icon: isCupertino ? Icon(CupertinoIcons.search) : Icon(Icons.search),
      label: 'Поиск',
    ),
    BottomNavigationBarItem(
      icon: isCupertino ? Icon(CupertinoIcons.book) : Icon(Icons.bookmark_border),
      label: 'Перевод',
    ),
    BottomNavigationBarItem(
      icon: isCupertino ? Icon(CupertinoIcons.settings) : Icon(Icons.settings),
      label: 'Настройки',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Scaffold(
        bottomNavigationBar: isCupertino
            ? CupertinoTabBar(
                onTap: (value) => barController.update(value),
                iconSize: 22,
                items: _navigationItems,
                currentIndex: barController.index,
              )
            : BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.blue,
                iconSize: 26,
                selectedFontSize: 12,
                onTap: (value) => barController.update(value),
                items: _navigationItems,
                currentIndex: barController.index,
                selectedItemColor: Colors.amber[800],
              ),
        body: IndexedStack(
          index: barController.index,
          children: pages,
        ),
      ),
    );
  }
}
