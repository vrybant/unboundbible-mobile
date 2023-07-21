import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
      icon: Icon(Icons.home),
      label: 'Bible', // Библия
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: 'Search', // Поиск
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.book),
      label: 'Modules', // Перевод
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Options', // Настройки
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Scaffold(
        bottomNavigationBar: BottomNavigationBar(
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
