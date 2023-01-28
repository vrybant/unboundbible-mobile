import 'package:flutter/material.dart';
import 'package:unboundbible/core/tools.dart';

@immutable
class BibleState {
  const BibleState({
    required this.book,
    required this.chapter,
  });

  final int book;
  final int chapter;

  List<String> get content {
    return tools!.get_Chapter;
  }

  List<String> get titles {
    return currBible!.getTitles();
  }

  String get infoString {
    return tools!.getCurrInfo;
  }

  int get chaptersCount {
    return currBible!.chaptersCount(currVerse);
  }

  BibleState copyWith({
    int? book,
    int? chapter,
  }) =>
      BibleState(
        book: book ?? this.book,
        chapter: chapter ?? this.chapter,
      );
}
