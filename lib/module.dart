// https://docs.flutter.dev/cookbook/persistence/sqlite
// https://camposha.info/flutter/ru/flutter-sqflite/#gsc.tab=0

// Even on iOS you could write a native plugin that get the asset file path
// and directly open it in read-only mode. Android does not have such ability.

import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

enum FileFormat { unbound, mysword, mybible }

class Module {
  Database? database;

  String filePath;
  String? fileName;
  FileFormat format = FileFormat.unbound;

  String name = "";
  String abbr = "";
  String copyright = "";
  String info = "";
  String filetype = "";

  String language = "en";
  bool rightToLeft = true;

  bool connected = false;
  bool loaded = false;
  bool strong = false;
  bool embedded = false;
  bool footnotes = false;
  bool interlinear = false;
  bool default_ = false;
  bool accented = false;
  bool favorite = true;

  Module(this.filePath) {
    fileName = basename(filePath);
    final ext = extension(filePath);
    print(ext);

    if ((ext == ".mybible") || (ext == ".bbli")) {
      format = FileFormat.mysword;
    }
    if (ext == ".SQLite3") {
      format = FileFormat.mybible;
    }

    opendatabase();
//  if !connected { return nil }
  }

  void opendatabase() async {
    await deleteDatabase(filePath); // always getting a fresh copy from the asset

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

    database = await openDatabase(filePath, readOnly: true);

    print("***************\n");
    print(filePath);

    final List<Map<String, dynamic>> result = await database!.query("Details");

    if (result.isNotEmpty) {
      print(result[0]['Title']);
      print(result[0]['Abbreviation']);
      print(result[0]['Information']);
    }

    print(result.length);
    print("~~~~~~~~~~~~~~~\n\n");
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const fileName = "en.kjv.bbl.unbound";
  final databasesPath = await getDatabasesPath();
  final path = join(databasesPath, fileName);
  final m = Module(path);
}
