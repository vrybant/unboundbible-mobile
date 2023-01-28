import 'package:flutter/material.dart';

@immutable
class BibleState {
  const BibleState({
    required this.book,
    required this.chapter,
  });

  final int book;
  final int chapter;

  BibleState copyWith({
    int? book,
    int? chapter,
  }) =>
      BibleState(
        book: book ?? this.book,
        chapter: chapter ?? this.chapter,
      );
}
