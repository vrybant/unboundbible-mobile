// ignore_for_file: non_constant_identifier_names

import 'extensions.dart';
import 'bible.dart';

class Tools {
  Bible? currBible;
  Verse currVerse = Verse();

  List<Bible> bibles = [];
//List<Commentaries> commentary = [];
//List<Dictionaries> dictionary = [];
//List<References> reference = [];

  Future _init() async {
    bibles = await Bibles.create();
  }

  static Future<Tools> create() async {
    final instance = Tools();
    await instance._init();
    return instance;
  }

  Future<List<String>> get_Chapter() async {
    List<String> result = [];
    final text = await currBible!.getChapter(currVerse);

    for (var i = 0; i < text.length; i++) {
      final line = " <l>${i + 1}</l> ${text[i]}\n";
      result.add(line.removeTags());
    }

    return result;
  }

  setCurrBible(String name) {
    if (bibles.length > 0) currBible = bibles[0];

    for (var bible in bibles) {
      if (bible.name == name) {
        currBible = bible;
        break;
      }
    }

    //currBible!.loadDatabase();
/*  if (!currBible!.goodLink(currVerse)) {
      currVerse = currBible!.firstVerse;
    } */
  }
}
