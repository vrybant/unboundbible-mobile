// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ChapterController on ChapterControllerBase, Store {
  Computed<String>? _$infoStringComputed;

  @override
  String get infoString =>
      (_$infoStringComputed ??= Computed<String>(() => super.infoString,
              name: 'ChapterControllerBase.infoString'))
          .value;
  Computed<List<String>>? _$contentComputed;

  @override
  List<String> get content =>
      (_$contentComputed ??= Computed<List<String>>(() => super.content,
              name: 'ChapterControllerBase.content'))
          .value;

  late final _$bookAtom =
      Atom(name: 'ChapterControllerBase.book', context: context);

  @override
  int get book {
    _$bookAtom.reportRead();
    return super.book;
  }

  @override
  set book(int value) {
    _$bookAtom.reportWrite(value, super.book, () {
      super.book = value;
    });
  }

  late final _$chapterAtom =
      Atom(name: 'ChapterControllerBase.chapter', context: context);

  @override
  int get chapter {
    _$chapterAtom.reportRead();
    return super.chapter;
  }

  @override
  set chapter(int value) {
    _$chapterAtom.reportWrite(value, super.chapter, () {
      super.chapter = value;
    });
  }

  late final _$ChapterControllerBaseActionController =
      ActionController(name: 'ChapterControllerBase', context: context);

  @override
  void update({int? book, int? chapter}) {
    final _$actionInfo = _$ChapterControllerBaseActionController.startAction(
        name: 'ChapterControllerBase.update');
    try {
      return super.update(book: book, chapter: chapter);
    } finally {
      _$ChapterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void refresh() {
    final _$actionInfo = _$ChapterControllerBaseActionController.startAction(
        name: 'ChapterControllerBase.refresh');
    try {
      return super.refresh();
    } finally {
      _$ChapterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
book: ${book},
chapter: ${chapter},
infoString: ${infoString},
content: ${content}
    ''';
  }
}
