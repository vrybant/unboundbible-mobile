import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unboundbible/providers.dart';
import 'package:unboundbible/widgets/bible_page.dart';
import 'package:unboundbible/widgets/chapters_page.dart';
import 'package:unboundbible/widgets/titles_page.dart';
import 'package:unboundbible/widgets/shelf_page.dart';

class BasicWidget extends ConsumerWidget {
  final List<Widget> pages = [
    BiblePage(),
    TitlesPage(),
    ChaptersPage(),
    ShelfPage(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int selectedIndex = ref.watch(navigationIndexProvider);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,
        iconSize: 28,
        selectedFontSize: 12,
        onTap: (value) => ref.read(navigationIndexProvider.notifier).state = value,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Библия',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Книга',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Глава',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Перевод',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.amber[800],
//      onTap: _onTap,
      ),
      body: IndexedStack(
        index: selectedIndex,
        children: pages,
      ),
    );
  }
}
