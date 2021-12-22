import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'extensions.dart';
import 'utils.dart';
import 'bible.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await copyDefaultsFiles();
  List<Bible> bibles = await Bibles.create();
  print("~~~~~~~~~~~~~~~~");
  for (var bible in bibles) {
    print(bible.name);
  }
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
  var files = databaseList;

  for (var file in files) {
    final path = join(databasesPath, file);

    // await deleteDatabase(filePath); // getting a fresh copy from the asset
    final exists = await databaseExists(path);

    if (!exists) {
      // make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      await copyFileFromBundle(join("assets", file), path);
    }
  }
}
