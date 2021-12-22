import 'dart:collection';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'lib.dart';
import 'utils.dart';
import 'extensions.dart';
import 'module.dart';

class Verse {
  int book = 1;
  int chapter = 1;
  int number = 1;
  int count = 1;
}

class Book {
  String title = "";
  String abbr = "";
  int number = 0;
  int id = 0;
  int sorting = 0;
}

class Bible extends Module {
  Bible(String atPath) : super(atPath);

  static Future<Bible> create(String atPath) async {
    final bible = Bible(atPath);
    await bible.opendatabase();
    return bible;
  }
}

class Bibles {
  final List<Bible> _items = [];
  String? _databasesPath;

  set length(int newLength) {
    _items.length = newLength;
  }

  int get length => _items.length;

  Bible operator [](int index) => _items[index];

  void operator []=(int index, Bible value) {
    _items[index] = value;
  }

  void add(Bible element) => _items.add(element);

  static Future<Bibles> create() async {
    final bibles = Bibles();
    bibles._databasesPath = await getDatabasesPath();
    await bibles._load();
    return bibles;
  }

  Future<void> _load() async {
    var files = databaseList;

    for (var file in files) {
      if (file.contains(".bbl.") | file.hasSuffix(".SQLite3")) {
        final filePath = join(_databasesPath!, file);
        var bible = await Bible.create(filePath);
        if (bible.connected) add(bible);
        print(file);
      }
    }
  }
}
