import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'module.dart';

const fileName = "en.kjv.bbl.unbound";
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await copyDefaultsFiles();
  final databasesPath = await getDatabasesPath();
  final path = join(databasesPath, fileName);
  final module = await Module.create(path);
  print("************************");
  print(module.connected);
}

Future<void> copyDefaultsFiles() async {
  final databasesPath = await getDatabasesPath();
  final filePath = join(databasesPath, fileName);

  // await deleteDatabase(filePath); // getting a fresh copy from the asset
  final exists = await databaseExists(filePath);

  if (!exists) {
    // Make sure the parent directory exists
    try {
      await Directory(dirname(filePath)).create(recursive: true);
    } catch (_) {}

    // Copy from asset
    ByteData data = await rootBundle.load(join("assets", fileName));
    List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    await File(filePath).writeAsBytes(bytes, flush: true);
  } else {
    print("Opening existing database");
  }
}
