import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqlite3/sqlite3.dart';
import 'package:collection/collection.dart';

import 'extensions.dart';
import 'lib.dart';

enum FileFormat { unbound, mysword, mybible }

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
    fileName = basename(filePath);
    final ext = extension(filePath);
    if ((ext == ".mybible") || (ext == ".bbli")) format = FileFormat.mysword;
    if (ext == ".SQLite3") format = FileFormat.mybible;
    _opendatabase();
  }

  _opendatabase() {
    database = sqlite3.open(filePath, mode: OpenMode.readOnly);

    if ((format == FileFormat.unbound) || (format == FileFormat.mysword)) {
      try {
        final maps = database!.select('SELECT * FROM Details');

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
        final maps = database!.select('SELECT * FROM info');

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

  bool tableExists(String table) {
    var result = false;
    try {
      final query = 'SELECT * FROM sqlite_master WHERE type=? AND name=?';
      final map = database!.select(query, ['table', table]);
      result = map.isNotEmpty;
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
