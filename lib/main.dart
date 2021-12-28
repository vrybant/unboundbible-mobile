import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart'; // for desktop
import 'package:desktop_window/desktop_window.dart'; // for desktop
import 'lib.dart';
import "tools.dart";

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

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
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
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 20);

  static final List<Widget> _widgetOptions = <Widget>[
    ListView.builder(
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Sample'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
