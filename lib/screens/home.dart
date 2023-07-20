import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
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

  List<BottomNavigationBarItem> _navigationItems(BuildContext context) => [
        BottomNavigationBarItem(
          icon: Icon(PlatformIcons(context).home),
          label: 'Bible', // Библия
        ),
        BottomNavigationBarItem(
          icon: Icon(PlatformIcons(context).search),
          label: 'Search', // Поиск
        ),
        BottomNavigationBarItem(
          icon: Icon(PlatformIcons(context).book),
          label: 'Modules', // Перевод
        ),
        BottomNavigationBarItem(
          icon: Icon(PlatformIcons(context).settings),
          label: 'Options', // Настройки
        ),
      ];

  @override
  Widget build(BuildContext context) {
    final _tabController = PlatformTabController(initialIndex: barController.index);
    return Observer(
      builder: (_) => PlatformTabScaffold(
        iosContentPadding: true,
        tabController: _tabController,
        bodyBuilder: (context, index) => IndexedStack(
          index: barController.index,
          children: pages,
        ),
        itemChanged: (value) => barController.update(value),
        items: _navigationItems(context),
        cupertino: (_, __) => CupertinoTabScaffoldData(
          //   Having this property as false (default true) forces it not to use CupertinoTabView which will show
          //   the back button, but does required transitionBetweenRoutes set to false (see above)
          useCupertinoTabView: false,
        ),
        cupertinoTabs: (context, platform) => CupertinoTabBarData(
          iconSize: 22,
        ),
        materialTabs: (_, __) => MaterialNavBarData(
          iconSize: 26,
          selectedFontSize: 12,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.amber[800],
//        backgroundColor: Colors.blue,
        ),
      ),
    );
  }
}
