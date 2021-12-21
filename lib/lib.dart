import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'module.dart';

const fileName = "en.kjv.bbl.unbound";
//const fileName = "РБО2.SQLite3";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await copyDefaultsFiles();
  final databasesPath = await getDatabasesPath();
  final path = join(databasesPath, fileName);
  final module = await Module.create(path);
  print("********");
  print("connected = " + module.connected.toString());
}

bool getRightToLeft(String language) {
  return language.startsWith("he") | language.startsWith("ara") | language.startsWith("fa");
}

String removeTags(String str) {
  String s = '';
  bool l = true;

  str.split('').forEach((c) {
    if (c == '<') l = false;
    if (l) s += c;
    if (c == '>') l = true;
  });

  return s;
}

Future<void> copyFileFromBundle(String fromPath, String toPath) async {
  ByteData data = await rootBundle.load(fromPath);
  List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  await File(toPath).writeAsBytes(bytes, flush: true);
  print(fromPath);
  print(toPath);
}

Future<void> copyDefaultsFiles() async {
  final databasesPath = await getDatabasesPath();
  final filePath = join(databasesPath, fileName);

  await deleteDatabase(filePath); // getting a fresh copy from the asset
  final exists = await databaseExists(filePath);

  if (!exists) {
    // make sure the parent directory exists
    try {
      await Directory(dirname(filePath)).create(recursive: true);
    } catch (_) {}

    await copyFileFromBundle(join("assets", fileName), filePath);
  }
}
