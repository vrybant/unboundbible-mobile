import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'utils.dart';
import 'extensions.dart';
import 'module.dart';
import 'lib.dart';

class Verse {
  int book = 1;
  int chapter = 1;
  int number = 1;
  int count = 1;
  Verse(this.book, this.chapter, this.number, this.count);
}

class Book {
  String title;
  String abbr;
  int number;
  int id;
  int sorting;
  Book(this.title, this.abbr, this.number, this.id, this.sorting);
}

class BibleAlias {
  late String bible, book, chapter, verse, text, books, number, name, abbr;
}

class UnboundAlias extends BibleAlias {
  UnboundAlias() {
    bible = "Bible";
    book = "Book";
    chapter = "Chapter";
    verse = "Verse";
    text = "Scripture";
    books = "Books";
    number = "Number";
    name = "Name";
    abbr = "Abbreviation";
  }
}

class MybibleAlias extends UnboundAlias {
  MybibleAlias() {
    bible = "verses";
    book = "book_number";
    chapter = "chapter";
    verse = "verse";
    text = "text";
    books = "books";
    number = "book_number";
    name = "long_name";
    abbr = "short_name";
  }
}

const titlesArray = [
  "", "Genesis", "Exodus", "Leviticus", "Numbers", "Deuteronomy", "Joshua", "Judges", //
  "Ruth", "1 Samuel", "2 Samuel", "1 Kings", "2 Kings", "1 Chronicles", "2 Chronicles", //
  "Ezra", "Nehemiah", "Esther", "Job", "Psalms", "Proverbs", "Ecclesiastes", "Song of Songs", //
  "Isaiah", "Jeremiah", "Lamentations", "Ezekiel", "Daniel", "Hosea", "Joel", "Amos", //
  "Obadiah", "Jonah", "Micah", "Nahum", "Habakkuk", "Zephaniah", "Haggai", "Zechariah",
  "Malachi", "Matthew", "Mark", "Luke", "John", "Acts", "Romans", "1 Corinthians", //
  "2 Corinthians", "Galatians", "Ephesians", "Philippians", "Colossians", //
  "1 Thessalonians", "2 Thessalonians", "1 Timothy", "2 Timothy", "Titus", "Philemon", //
  "Hebrews", "James", "1 Peter", "2 Peter", "1 John", "2 John", "3 John", "Jude", "Revelation"
];

const abbrevArray = [
  "", "Gen.", "Ex.", "Lev.", "Num.", "Deut.", "Josh.", "Judg.", "Ruth", "1 Sam.", "2 Sam.", //
  "1 Kin.", "2 Kin.", "1 Chr.", "2 Chr.", "Ezra", "Neh.", "Esth.", "Job", "Ps.", "Prov.", //
  "Eccl.", "Song", "Is.", "Jer.", "Lam.", "Ezek.", "Dan.", "Hos.", "Joel", "Amos", "Obad.", //
  "Jon.", "Mic.", "Nah.", "Hab.", "Zeph.", "Hag.", "Zech.", "Mal.", "Matt.", "Mark", "Luke", //
  "John", "Acts", "Rom.", "1 Cor.", "2 Cor.", "Gal.", "Eph.", "Phil.", "Col.", "1 Thess.", //
  "2 Thess.", "1 Tim.", "2 Tim.", "Titus", "Philem.", "Heb.", "James", "1 Pet.", "2 Pet.", //
  "1 John", "2 John", "3 John", "Jude", "Rev." //
];

class Bible extends Module {
  List<Book> books = [];
  BibleAlias z = UnboundAlias();

  Bible(String atPath) : super(atPath) {
    if (format == FileFormat.mybible) z = MybibleAlias();
    if (connected && !tableExists(z.bible)) connected = false;
    if (connected) loadDatabase();
//  prints();
  }

  loadUnboundDatabase() {
    try {
      final query = "SELECT * FROM ${z.books}";
      final maps = database!.select(query);

      List.generate(maps.length, (i) {
        final id = maps[i][z.number] ?? 0;
        final name = maps[i][z.name] ?? "";
        final abbr = maps[i][z.abbr] ?? "";

        if (id > 0) {
          final book = Book(name, abbr, decodeID(id), id, id);
          books.add(book);
          loaded = true;
        }
      });

      connected = true;
    } catch (e) {
      debugPrint("$e");
    }
//  print("load database: $fileName");
  }

  loadMyswordDatabase() {
    try {
      final query = "SELECT DISTINCT ${z.book} FROM ${z.bible}";
      final maps = database!.select(query);

      List.generate(maps.length, (i) {
        final num = maps[i][z.book] ?? 0;

        if ((num > 0) & (num <= 66)) {
          final title = titlesArray[num];
          final abbr = abbrevArray[num];
          final book = Book(title, abbr, num, num, num);
          books.add(book);
          loaded = true;
        }
      });

      connected = true;
    } catch (e) {
      debugPrint("$e");
    }
    print("loadMyswordDatabase: $fileName");
  }

  loadDatabase() {
    if (loaded) return;
    if (format == FileFormat.mysword) {
      loadMyswordDatabase();
    } else {
      loadUnboundDatabase();
    }
  }

  List<String> getChapter(int book, int chapter) {
    List<String> result = [];
    var id = encodeID(book).toString();
    // var nt = isNewTestament(verse.book);

    try {
      final query = "SELECT * FROM ${z.bible} WHERE ${z.book}=? AND ${z.chapter}=?";
      final maps = database!.select(query, ['$id', '${chapter}']);

      List.generate(maps.length, (i) {
        final line = maps[i][z.text];

        if (line != null) {
          var text = line; // = preparation(line, format: format, nt: nt, purge: false)
          result.add(text);
        }
      });
    } catch (e) {
      debugPrint("$e");
    }

    return result;
  }

  List<String> getTitles() {
    List<String> result = [];
    for (var book in books) result.add(book.title);
    return result;
  }

  int chaptersCount(int book) {
    var result = 0;
    final id = encodeID(book);
    try {
      final query = "SELECT MAX(${z.chapter}) AS Count FROM ${z.bible} WHERE ${z.book} = ?";
      final map = database!.select(query, ['$id']);
      result = map[0]['Count'] ?? 0;
    } catch (e) {
      debugPrint("$e");
    }
    return result;
  }

  Book? bookByNum(int n) {
    for (var book in books) if (book.number == n) return book;
    return null;
  }

  String verseToStr(Verse verse, {bool full = true, bool truncated = false}) {
    var book = bookByNum(verse.book);
    if (book == null) return '';

    final title = full ? book.title : book.abbr;
    final space = title.contains('.') ? '' : ' ';

    var result = '${title}${space}${verse.chapter}';
    if ((truncated) || (verse.number != 0)) return result;

    result += ':${verse.number}';
    if (verse.count > 1) result += '- ${verse.number + verse.count - 1}';

    return result;
  }
}

extension Bibles on List<Bible> {
  static List<Bible> create() {
    List<Bible> instance = [];
    instance._init();
    return instance;
  }

  void _init() {
    for (var file in databasesList) {
      if (file.contains(".bbl.") | file.hasSuffix(".SQLite3")) {
        final filePath = join(databasesPath!, file);
        final bible = Bible(filePath);
        if (bible.connected) add(bible);
      }
    }
  }
}
