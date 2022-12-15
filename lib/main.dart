import 'dart:io';

import 'package:flutter/material.dart';
import 'package:desktop_window/desktop_window.dart';
import 'core/lib.dart';
import 'core/tools.dart';
import 'main_page.dart';

const double textSize = 10;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    await DesktopWindow.setWindowSize(Size(400, 700));
  }

  if (Platform.isAndroid) {
    if (!await Directory(await getDatabasesDirectory()).exists()) {
      await installDatabasesFromAssets();
    }
  }

  tools = await Tools.create();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Unbound Bible';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BasicStatefulWidget(),
    );
  }
}
