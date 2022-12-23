// ignore_for_file: non_constant_identifier_names

import 'package:flutter/foundation.dart';
import 'extensions.dart';
import 'bible.dart';

class Data extends ChangeNotifier {
  int _count = 5;
  int get count => _count;
  Tools? tools = null;

  Data() {
    tools = Tools();
    print(" ~ counter ~ ");
  }

  void increment() {
    _count++;
    notifyListeners();
  }
}

class Tools {
  Bible? currBible;
  Verse currVerse = Verse();
  List<Bible> bibles = [];

  Tools() {
    bibles.init();
    print(" ~ tools ~ ");
    print("${bibles.length}");
    currBible = bibles[0];
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
