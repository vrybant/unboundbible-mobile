import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'extensions.dart';
import 'bible.dart';

const fileName = "en.kjv.bbl.unbound";
//const fileName = "РБО2.SQLite3";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await copyDefaultsFiles();
  final databasesPath = await getDatabasesPath();
  final path = join(databasesPath, fileName);
  final bible = await Bible.create(path);
  bible.prints();
}

bool getRightToLeft(String language) {
  return language.hasPrefix("he") | language.hasPrefix("ara") | language.hasPrefix("fa");
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
