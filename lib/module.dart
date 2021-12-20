// https://docs.flutter.dev/cookbook/persistence/sqlite
// https://camposha.info/flutter/ru/flutter-sqflite/#gsc.tab=0

// Even on iOS you could write a native plugin that get the asset file path
// and directly open it in read-only mode. Android does not have such ability.

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'lib.dart';

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

  Module._constructor(this.filePath) {
    fileName = basename(filePath);
    final ext = extension(filePath);
    print(ext);

    if ((ext == ".mybible") || (ext == ".bbli")) {
      format = FileFormat.mysword;
    }
    if (ext == ".SQLite3") {
      format = FileFormat.mybible;
    }
  }

  static Future<Module> create(String atPath) async {
    final module = Module._constructor(atPath);
    await module._opendatabase();
    return module;
  }

  Future<void> _opendatabase() async {
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
        print(e);
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
        print(e);
      }
    }

    if (connected) {
      if (name.isEmpty) {
        name = fileName!;
      }
      rightToLeft = getRightToLeft(language);
      info = removeTags(info);
      accented = language == "ru";
    }

    print("Information = " + info);
    print("Name = " + name);
    print("abbr = " + abbr);
    print("copyright = " + copyright);
    print("language = " + language);
    print("Strong = " + strong.toString());
    print("Embedded = " + embedded.toString());
    print("Default = " + default_.toString());
    print("rightToLeft = " + rightToLeft.toString());
  }
}
