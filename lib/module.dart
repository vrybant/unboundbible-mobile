// https://docs.flutter.dev/cookbook/persistence/sqlite
// https://camposha.info/flutter/ru/flutter-sqflite/#gsc.tab=0

// Even on iOS you could write a native plugin that get the asset file path
// and directly open it in read-only mode. Android does not have such ability.

// https://github.com/tekartik/sqflite/blob/master/sqflite_common_ffi/doc/using_ffi_instead_of_sqflite.md
// "In release mode, add sqlite3.dll in same folder as your executable."

import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:collection/collection.dart';

import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'extensions.dart';
import 'lib.dart';

enum FileFormat { unbound, mysword, mybible }

Future main() async {
//  runApp(MyApp());
}

class Module {
  Database? database;

  String filePath;
  late String fileName;
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

  static final _mybibleArray = [
    010, 020, 030, 040, 050, 060, 070, 080, 090, 100, //
    110, 120, 130, 140, 150, 160, 190, 220, 230, 240, //
    250, 260, 290, 300, 310, 330, 340, 350, 360, 370, //
    380, 390, 400, 410, 420, 430, 440, 450, 460, 470, //
    480, 490, 500, 510, 520, 530, 540, 550, 560, 570, //
    580, 590, 600, 610, 620, 630, 640, 650, 660, 670, //
    680, 690, 700, 710, 720, 730, 000, 000, 000, 000, //
    000, 000, 000, 000, 000, 000, 165, 468, 170, 180, //
    462, 464, 466, 467, 270, 280, 315, 320 //
  ];

  Module(this.filePath) {
    if (Platform.isWindows || Platform.isLinux) {
      print("\n *** DESKTOP *** \n ");
      sqfliteFfiInit(); // initialize FFI
//    databaseFactory = databaseFactoryFfi; // Change the default factory
    }

    fileName = basename(filePath);
    final ext = extension(filePath);
    if ((ext == ".mybible") || (ext == ".bbli")) format = FileFormat.mysword;
    if (ext == ".SQLite3") format = FileFormat.mybible;
  }

  Future init() async {
    await _opendatabase();
  }

  Future _opendatabase() async {
    database = await openDatabase(filePath, readOnly: true);

    if ((format == FileFormat.unbound) | (format == FileFormat.mysword)) {
      try {
        final List<Map<String, dynamic>> maps = await database!.query("Details");

        if (maps.isNotEmpty) {
          info = maps[0]["Information"] ?? "";
          info = maps[0]["Description"] ?? info;
          name = maps[0]["Title"] ?? info;
          abbr = maps[0]["Abbreviation"] ?? "";
          copyright = maps[0]["Copyright"] ?? "";
          language = maps[0]["Language"] ?? "";
          strong = (maps[0]["Strong"] ?? 0) > 0;
          embedded = (maps[0]["Embedded"] ?? 0) > 0;
          default_ = (maps[0]["Default"] ?? 0) > 0;

          connected = true;
        }
      } catch (e) {
        debugPrint("$e");
      }
    }

    if (format == FileFormat.mybible) {
      try {
        final List<Map<String, dynamic>> maps = await database!.query("info");

        List.generate(maps.length, (i) {
          final key = maps[i]["name"] ?? "";
          final value = maps[i]["value"] ?? "";

          switch (key) {
            case "description":
              name = value;
              break;
            case "detailed_info":
              info = value;
              break;
            case "language":
              language = value;
              break;
            case "strong_numbers":
              strong = value == "true";
              break;
            case "is_strong":
              strong = value == "true";
              break;
            case "is_footnotes":
              footnotes = value == "true";
              break;
          }
        });
        connected = true;
      } catch (e) {
        debugPrint("$e");
      }
    }

    if (connected) {
      if (name.isEmpty) name = fileName;
      rightToLeft = getRightToLeft(language);
      info = info.removeTags();
      accented = language == "ru";
    }
  }

  static int _unbound2mybible(int id) {
    return (id > 0) && (id < _mybibleArray.length) ? _mybibleArray[id] : id;
  }

  static int _mybible2unbound(int id) {
    return _mybibleArray.firstWhereIndexedOrNull((i, e) => i == id) ?? id;
  }

  int encodeID(int id) {
    return format == FileFormat.mybible ? _unbound2mybible(id) : id;
  }

  int decodeID(int id) {
    return format == FileFormat.mybible ? _mybible2unbound(id) : id;
  }

  bool isNewTestament(int n) {
    return (n >= 40) & (n < 77);
  }

  Future<bool> tableExists(String table) async {
    table = table.toLowerCase();
    var result = false;
    try {
      final List<Map<String, dynamic>> maps = await database!.query("sqlite_master");
      List.generate(maps.length, (i) {
        final name = maps[i]["name"] ?? "";
        if (name.toLowerCase() == table) result = true;
      });
    } catch (e) {
      debugPrint("$e");
    }
    return result;
  }

  prints() {
    print("Information = $info");
    print("Name = $name");
    print("abbr = $abbr");
    print("copyright = $copyright");
    print("language = $language");
    print("Strong = $strong");
    print("Embedded = $embedded");
    print("Default = $default_");
    print("rightToLeft = $rightToLeft");
    print("connected = $connected");
  }
}
