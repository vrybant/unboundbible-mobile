// ignore_for_file: non_constant_identifier_names

import 'package:flutter/widgets.dart';
import 'extensions.dart';
import 'lib.dart';
import 'bible.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await copyDefaultsFiles();
  Tools tools = await Tools.create();
  tools.setCurrBible("*");
  final lines = await tools.get_Chapter();
  for (var s in lines.split("\n")) print(s);
}

class Tools {
  Bible? currBible;
  Verse currVerse = Verse();

  List<Bible> bibles = [];
//List<Commentaries> commentary = [];
//List<Dictionaries> dictionary = [];
//List<References> reference = [];

  Future _create() async {
    bibles = await Bibles.create();
  }

  static Future<Tools> create() async {
    final tools = Tools();
    await tools._create();
    return tools;
  }

  Future<String> get_Chapter() async {
    var result = "";
    final text = await currBible!.getChapter(currVerse);

    for (var i = 0; i < text.length; i++) {
      result += " <l>${i + 1}</l> ${text[i]}\n";
    }
    return result.removeTags();
  }

  setCurrBible(String name) {
    currBible = bibles[0];

    for (var bible in bibles) {
      if (bible.name == name) {
        currBible = bible;
        break;
      }
    }

    currBible!.loadDatabase();
/*  if (!currBible!.goodLink(currVerse)) {
      currVerse = currBible!.firstVerse;
    } */
  }
}
