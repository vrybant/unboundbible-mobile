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
    return tools!.get_Chapter(book, chapter);
  }

  List<String> get titles {
    return tools!.getTitles();
  }

  String get infoString {
    return tools!.getInfo(book, chapter);
  }

  int get chaptersCount {
    return tools!.chaptersCount(book);
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
