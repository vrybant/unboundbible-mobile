import 'package:flutter/material.dart';
import 'core/lib.dart';
import 'core/tools.dart';
import 'main_page.dart';

const double textSize = 10;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
  //   await DesktopWindow.setMaxWindowSize(Size(400, 700));
  // }

  await copyDefaultsFiles();
  tools = await Tools.create();
  tools!.setCurrBible("*");
  lines = await tools!.get_Chapter();

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
