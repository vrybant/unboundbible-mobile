import 'dart:collection';
import 'package:path/path.dart';
import 'lib.dart';
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
  Bible(String atPath) : super(atPath) {
    print("Constructor of Bible Class");
  }

  static Future<Bible> create(String atPath) async {
    final bible = Bible(atPath);
    await bible.opendatabase();
    return bible;
  }
}

extension Bibles<Bible> on List<Bible> {
  init() {
    print("Init Bibles Class");
  }

  Future<void> load() async {
    print("Load Bibles Class");
  }
}
