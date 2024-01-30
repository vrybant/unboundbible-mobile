import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:unboundbible/screens/bible.dart';
import 'package:unboundbible/screens/search.dart';
import 'package:unboundbible/screens/shelf.dart';
import 'package:unboundbible/screens/options.dart';
import 'package:unboundbible/stores/bar_store.dart';

class HomePage extends StatelessWidget {
  final List<Widget> pages = [
    BiblePage(),
    SearchPage(),
    ShelfPage(),
    OptionsPage(),
  ];

  List<BottomNavigationBarItem> _navigationItems(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: l.bible,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.search),
        label: l.search,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.book),
        label: l.modules,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: l.options,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.blue,
          iconSize: 26,
          selectedFontSize: 12,
          onTap: (value) => barStore.update(value),
          items: _navigationItems(context),
          currentIndex: barStore.index,
          selectedItemColor: Colors.amber[800],
        ),
        body: IndexedStack(
          index: barStore.index,
          children: pages,
        ),
      ),
    );
  }
}
