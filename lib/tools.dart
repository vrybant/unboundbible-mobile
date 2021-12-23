// ignore_for_file: non_constant_identifier_names, curly_braces_in_flow_control_structures

import 'package:flutter/widgets.dart';
import 'lib.dart';
import 'bible.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await copyDefaultsFiles();
  Tools tools = await Tools.create();
  tools.setCurrBible("*");
  final lines = await tools.currBible!.getTitles();
  print("~~~~~~~~~~~~~");
//for (var s in lines) print(s);
//for (var s in text.split("\n")) print(s);
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

    for (var s in text) {
//    result += /*" <l>"*/ i + /*" </l>"*/ " " + s + "\n";
      result += s + "\n";
    }
    return result;
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
