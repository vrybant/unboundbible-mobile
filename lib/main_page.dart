import 'package:flutter/material.dart';
import 'bible_page.dart';
import 'colors_list_page.dart';
import 'color_detail_page.dart';

class BasicStatefulWidget extends StatefulWidget {
  const BasicStatefulWidget({Key? key}) : super(key: key);

  @override
  State<BasicStatefulWidget> createState() => _BasicStatefulWidgetState();
}

class _BasicStatefulWidgetState extends State<BasicStatefulWidget> {
  int selectedIndex = 0;

  final pages = [
    BiblePage(),
    ColorsListPage(),
    ColorDetailPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,
        iconSize: 28,
        selectedFontSize: 12,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
