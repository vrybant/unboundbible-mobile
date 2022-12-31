import 'dart:core';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/tools.dart';

final chapterProvider =
    StateNotifierProvider<ChapterNotifier, List<String>>((_) => ChapterNotifier());

class ChapterNotifier extends StateNotifier<List<String>> {
  ChapterNotifier() : super([]) {
    update();
  }

  update() {
    state = tools!.get_Chapter();
  }
}

final shelfProvider = StateNotifierProvider<ShelfNotifier, List<String>>((_) => ShelfNotifier());

class ShelfNotifier extends StateNotifier<List<String>> {
  ShelfNotifier() : super([]) {
    state = tools!.get_Shelf();
  }
}

final shelfIndexProvider =
    StateNotifierProvider<ShelfIndexNotifier, int>((_) => ShelfIndexNotifier());

class ShelfIndexNotifier extends StateNotifier<int> {
  ShelfIndexNotifier() : super(_initValue);
  static final _initValue = tools!.getCurrBibleIndex();

  update(int value) {
    tools!.setCurrBible(value);
    state = value;
  }
}
