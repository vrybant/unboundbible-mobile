import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'extensions.dart';
import 'bible.dart';
import 'lib.dart';

class Tools {
  List<Bible> bibles = [];
  Bible? currBible;

  Tools() {
    bibles = Bibles.create();
    currBible = bibles[0];
  }

  List<String> get_Chapter(int book, int chapter) {
    List<String> result = [];
    final text = currBible!.getChapter(book, chapter);

    for (var i = 0; i < text.length; i++) {
      final line = " <l>${i + 1}</l> ${text[i]}\n";
      result.add(line.removeTags());
    }

    return result;
  }

  List<String> get_Shelf() {
    List<String> result = [];

    for (var bible in bibles) {
      result.add(bible.name);
    }

    return result;
  }

  setCurrBible(int index) {
    if (index < bibles.length) currBible = bibles[index];
  }

  setCurrBible_byName(String name) {
    if (bibles.length > 0) currBible = bibles[0];

    for (var bible in bibles) {
      if (bible.name == name) {
        currBible = bible;
        break;
      }
    }
  }

  int getCurrBibleIndex() {
    for (var i = 0; i < bibles.length; i++) {
      if (bibles[i] == currBible) return i;
    }
    return 0;
  }

  String getInfo(int book, int chapter) {
    final verse = Verse(book, chapter, 1, 1);
    return currBible!.verseToStr(verse, truncated: true);
  }

  List<String> getTitles() => currBible!.getTitles();

  int chaptersCount(int book) => currBible!.chaptersCount(book);

  //currBible!.loadDatabase();
/*  if (!currBible!.goodLink(currVerse)) {
      currVerse = currBible!.firstVerse;
    } */
}

Future readPreferences() async {
  final prefs = await SharedPreferences.getInstance();

  final int? counter = prefs.getInt('counter');
  final bool? repeatt = prefs.getBool('repeat');
  final double? decimal = prefs.getDouble('decimal');
  final String? action = prefs.getString('action');
  final List<String>? items = prefs.getStringList('items');

  print(counter);
  print(repeatt);
  print(decimal);
  print(action);
  print(items);
}

Future savePreferences() async {
  final prefs = await SharedPreferences.getInstance();

  await prefs.setInt('counter', 10);
  await prefs.setBool('repeat', true);
  await prefs.setDouble('decimal', 1.5);
  await prefs.setString('action', 'Start');
  await prefs.setStringList('items', <String>['Earth', 'Moon', 'Sun']);
}

Future initialization() async {
  await initVariables();

  if (Platform.isAndroid) {
    if (!await Directory(databasesPath!).exists()) {
      await installDatabasesFromAssets();
    }
  }

  await savePreferences();
  await readPreferences();
}
