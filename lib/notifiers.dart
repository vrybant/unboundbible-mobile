import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unboundbible/core/tools.dart';
import 'package:unboundbible/core/bible.dart';

class CurrVerseNotifier extends StateNotifier<Verse> {
  CurrVerseNotifier() : super(Verse()) {
    state = currVerse;
  }

  updateBook(int value) {
    currVerse = Verse();
    currVerse.book = value;
    state = currVerse;
  }

  updateChapter(int value) {
    currVerse = Verse();
    currVerse.book = state.book;
    currVerse.chapter = value;
    state = currVerse;
  }
}

class CurrBibleNotifier extends StateNotifier<int> {
  CurrBibleNotifier() : super(0) {
    state = tools!.getCurrBibleIndex();
  }

  update(int value) {
    tools!.setCurrBible(value);
    state = value;
  }
}
