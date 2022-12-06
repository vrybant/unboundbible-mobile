import 'package:flutter/material.dart';
import 'tab_item.dart';
import 'bible_page.dart';
import 'colors_list_page.dart';
import 'color_detail_page.dart';

class BasicStatefulWidget extends StatefulWidget {
  const BasicStatefulWidget({Key? key}) : super(key: key);

  @override
  State<BasicStatefulWidget> createState() => _BasicStatefulWidgetState();
}

class _BasicStatefulWidgetState extends State<BasicStatefulWidget> {
  var _currentTab = TabItem.bible;
  int _selectedIndex = 0;

  final screens = [
    BiblePage(),
    ColorsListPage(),
    ColorDetailPage(),
  ];

  final _navigatorKeys = {
    TabItem.bible: GlobalKey<NavigatorState>(),
    TabItem.search: GlobalKey<NavigatorState>(),
    TabItem.compare: GlobalKey<NavigatorState>(),
  };

  void _selectTab(TabItem tabItem) {
    if (tabItem == _currentTab) {
      // pop to first route
      _navigatorKeys[tabItem]!.currentState!.popUntil((route) => route.isFirst);
    } else {
      setState(() => _currentTab = tabItem);
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab = !await _navigatorKeys[_currentTab]!.currentState!.maybePop();
        if (isFirstRouteInCurrentTab) {
          // if not on the 'main' tab
          if (_currentTab != TabItem.bible) {
            // select 'main' tab
            _selectTab(TabItem.bible);
            // back button handled by app
            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        body: Center(
          child: screens.elementAt(_selectedIndex),
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
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
