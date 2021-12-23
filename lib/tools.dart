// ignore_for_file: non_constant_identifier_names

import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'extensions.dart';
import 'utils.dart';
import 'lib.dart';
import 'bible.dart';

//var tools = Tools()

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await copyDefaultsFiles();
  Tools tools = await Tools.create();

  print("~~~~~~~~~~~~~~~~");
//for (var bible in bibles) print(bible.name);
}

class Tools {
  static Bible? currBible;
  static Verse currVerse = Verse();

  List<Bible> bibles = [];
//List<Commentaries> commentary = [];
//List<Dictionaries> dictionary = [];
//List<References> reference = [];

  Future _create() async {
    bibles = await Bibles.create();
    print("Tools created");
  }

  static Future<Tools> create() async {
    final tools = Tools();
    await tools._create();
    return tools;
  }

  String get_Chapter() {
    var result = "";
    var text = currBible!.getChapter(currVerse);
    var i = 1;
/*
        foreach (var s in text) {
            result += /*" <l>"*/ i + /*" </l>"*/ " " + s + "\n";
            i++;
        }
*/
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
