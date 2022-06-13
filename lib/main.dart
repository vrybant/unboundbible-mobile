import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart'; // for desktop
import 'package:desktop_window/desktop_window.dart'; // for desktop
import 'lib.dart';
import "tools.dart";
import 'tab_item.dart';
import 'bottom_navigation.dart';
import 'tab_navigator.dart';

const double textSize = 24;
List<String> lines = [];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    await DesktopWindow.setMaxWindowSize(Size(400, 700));
    sqfliteFfiInit(); // initialize FFI
    databaseFactory = databaseFactoryFfi; // change the default factory
  }

  await copyDefaultsFiles();
  Tools tools = await Tools.create();
  tools.setCurrBible("*");
  lines = await tools.get_Chapter();
//for (var s in lines.split("\n")) print("$s");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Unbound Bible';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  var _currentTab = TabItem.bible;
  int _selectedIndex = 0;

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

  static const TextStyle optionStyle = TextStyle(fontSize: 20);

  static final List<Widget> _widgetOptions = <Widget>[
    ListView.builder(
      padding: EdgeInsets.only(top: 10),
//    padding: EdgeInsets.symmetric(horizontal: 10),
      itemCount: lines.length,
      itemBuilder: (BuildContext context, int index) {
        return Text(lines[index], style: optionStyle);
      },
    ),
    Text(
      'Business',
      style: optionStyle,
    ),
    Text(
      'School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_currentTab]!.currentState!.maybePop();
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
//      appBar: AppBar(
//        backgroundColor: Colors.blue,
//        toolbarHeight: 20,
//      ),

//        body: Center(
//          child: _widgetOptions.elementAt(_selectedIndex),
//        ),

        body: Stack(children: <Widget>[
          _buildOffstageNavigator(TabItem.bible),
          _buildOffstageNavigator(TabItem.search),
          _buildOffstageNavigator(TabItem.compare),
        ]),

        bottomNavigationBar: BottomNavigation(
          currentTab: _currentTab,
          onSelectTab: _selectTab,
        ),
      ),
    );
  }

  Widget _buildOffstageNavigator(TabItem tabItem) {
    return Offstage(
      offstage: _currentTab != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem],
        tabItem: tabItem,
      ),
    );
  }
}
