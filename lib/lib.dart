import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'module.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const fileName = "en.kjv.bbl.unbound";
  final databasesPath = await getDatabasesPath();
  final path = join(databasesPath, fileName);
  final m = Module(path);
}
