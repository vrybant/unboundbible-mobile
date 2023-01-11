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

class ShelfIndexNotifier extends StateNotifier<int> {
  ShelfIndexNotifier() : super(_initValue);
  static final _initValue = tools!.getCurrBibleIndex();

  update(int value) {
    tools!.setCurrBible(value);
    state = value;
  }
}
