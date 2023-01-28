// ignore_for_file: non_constant_identifier_names

import 'dart:io';
import 'extensions.dart';
import 'bible.dart';
import 'lib.dart';

Tools? tools = null;
Bible? currBible;
Verse currVerse = Verse();

class Tools {
  List<Bible> bibles = [];

  Tools() {
    bibles = Bibles.create();
    currBible = bibles[0];
  }

  List<String> get get_Chapter {
    List<String> result = [];
    final text = currBible!.getChapter(currVerse);

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

  String get getCurrInfo {
    return currBible!.verseToStr(currVerse, truncated: true);
  }

  //currBible!.loadDatabase();
/*  if (!currBible!.goodLink(currVerse)) {
      currVerse = currBible!.firstVerse;
    } */

}

Future initialization() async {
  await initVariables();

  if (Platform.isAndroid) {
    if (!await Directory(databasesPath!).exists()) {
      await installDatabasesFromAssets();
    }
  }

  tools = Tools();
}
