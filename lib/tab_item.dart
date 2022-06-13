import 'package:flutter/material.dart';

enum TabItem { bible, search, compare }

const Map<TabItem, String> tabName = {
  TabItem.bible: 'Библия',
  TabItem.search: 'Поиск',
  TabItem.compare: 'Сравнение',
};

const Map<TabItem, MaterialColor> activeTabColor = {
  TabItem.bible: Colors.red,
  TabItem.search: Colors.green,
  TabItem.compare: Colors.blue,
};
