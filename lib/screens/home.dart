import 'package:flutter/cupertino.dart';
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

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.blue,
          iconSize: 28,
          selectedFontSize: 12,
          onTap: (value) => barController.update(value),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Библия',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Поиск',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'Перевод',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Настройки',
            ),
          ],
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
