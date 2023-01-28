import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unboundbible/core/tools.dart';
import 'package:unboundbible/core/bible.dart';
import 'package:unboundbible/states.dart';

class BibleEngine extends StateNotifier<BibleState> {
  BibleEngine()
      : super(
          BibleState(
            book: currVerse.book,
            chapter: currVerse.chapter,
          ),
        );

  void updateBook(int book) {
    state = state.copyWith(
      book: book,
      chapter: 1,
    );
    setCurrVerse();
  }

  void updateChapter(int chapter) {
    state = state.copyWith(
      chapter: chapter,
    );
    setCurrVerse();
  }

  void setCurrVerse() {
    currVerse = Verse();
    currVerse.book = state.book;
    currVerse.chapter = state.chapter;
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
