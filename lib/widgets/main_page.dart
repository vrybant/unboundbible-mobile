import 'package:flutter/material.dart';
import 'package:unboundbible/widgets/bible_page.dart';
import 'package:unboundbible/widgets/titles_page.dart';
import 'package:unboundbible/widgets/shelf_page.dart';
import 'package:unboundbible/widgets/colors_list_page.dart';

class BasicWidget extends StatefulWidget {
  const BasicWidget({Key? key}) : super(key: key);
  @override
  BasicState createState() => BasicState();
}

class BasicState extends State<BasicWidget> {
  var pages = [
    BiblePage(),
    TitlesPage(),
    ShelfPage(),
    ColorsListPage(),
  ];
  int selectedIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      _pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: pages[selectedIndex],
      // body: IndexedStack(
      //   index: selectedIndex,
      //   children: pages,
      // ),
      body: PageView(
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
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
