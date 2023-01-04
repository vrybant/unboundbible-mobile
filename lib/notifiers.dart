import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unboundbible/core/tools.dart';

class ChapterNotifier extends StateNotifier<List<String>> {
  ChapterNotifier() : super([]) {
    update();
  }

  update() {
    state = tools!.get_Chapter();
  }
}

class CurrentNotifier extends StateNotifier<String> {
  CurrentNotifier() : super('') {
    update();
  }

  update() {
    state = tools!.getCurrInfo();
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

class ShelfNotifier extends StateNotifier<List<String>> {
  ShelfNotifier() : super([]) {
    state = tools!.get_Shelf();
  }
}

class TitlesNotifier extends StateNotifier<List<String>> {
  TitlesNotifier() : super([]) {
    update();
  }

  update() {
    state = tools!.get_Titles();
  }
}
