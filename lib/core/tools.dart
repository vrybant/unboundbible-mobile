// ignore_for_file: non_constant_identifier_names

import 'extensions.dart';
import 'bible.dart';

Tools? tools = null;
List<String> lines = [];

class Tools {
  Bible? currBible;
  Verse currVerse = Verse();
  List<Bible> bibles = [];

  Future _init() async {
    bibles = await Bibles.create();
    currBible = bibles[0];
  }

  static Future<Tools> create() async {
    final instance = Tools();
    await instance._init();
    return instance;
  }

  List<String> get_Chapter() {
    print('get_Chapter');

    List<String> result = [];
    final text = currBible!.getChapter(currVerse);

    for (var i = 0; i < text.length; i++) {
      final line = " <l>${i + 1}</l> ${text[i]}\n";
      result.add(line.removeTags());
    }

    return result;
  }

  setCurrBible(int index) {
    print('currBible = $index');
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

    //currBible!.loadDatabase();
/*  if (!currBible!.goodLink(currVerse)) {
      currVerse = currBible!.firstVerse;
    } */
  }
}
