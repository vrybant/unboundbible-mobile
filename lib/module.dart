// https://docs.flutter.dev/cookbook/persistence/sqlite
// https://camposha.info/flutter/ru/flutter-sqflite/#gsc.tab=0

// Even on iOS you could write a native plugin that get the asset file path
// and directly open it in read-only mode. Android does not have such ability.

import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const fileName = "en.kjv.bbl.unbound";
  final databasesPath = await getDatabasesPath();
  final path = join(databasesPath, fileName);

  await deleteDatabase(path); // always getting a fresh copy from the asset
  final exists = await databaseExists(path);

  if (!exists) {
    // Make sure the parent directory exists
    try {
      await Directory(dirname(databasesPath)).create(recursive: true);
    } catch (_) {}

    // Copy from asset
    ByteData data = await rootBundle.load(join("assets", fileName));
    List<int> bytes =
        data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

    // Write and flush the bytes written
    await File(path).writeAsBytes(bytes, flush: true);
  } else {
    print("Opening existing database");
  }

  var database = openDatabase(path, readOnly: true);

  print("***************\n");
  print(path);

  final db = await database;
  final List<Map<String, dynamic>> result = await db.query("Details");

  if (result.isNotEmpty) {
    print(result[0]['Title']);
    print(result[0]['Abbreviation']);
    print(result[0]['Information']);
  }
  ;

  print(result.length);
  print("~~~~~~~~~~~~~~~\n\n");
}
