// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bible_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BibleStore on BibleStoreBase, Store {
  Computed<String>? _$infoStringComputed;

  @override
  String get infoString =>
      (_$infoStringComputed ??= Computed<String>(() => super.infoString,
              name: 'BibleStoreBase.infoString'))
          .value;

  late final _$bookAtom = Atom(name: 'BibleStoreBase.book', context: context);

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
      Atom(name: 'BibleStoreBase.chapter', context: context);

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

  late final _$contentAtom =
      Atom(name: 'BibleStoreBase.content', context: context);

  @override
  List<String> get content {
    _$contentAtom.reportRead();
    return super.content;
  }

  @override
  set content(List<String> value) {
    _$contentAtom.reportWrite(value, super.content, () {
      super.content = value;
    });
  }

  late final _$BibleStoreBaseActionController =
      ActionController(name: 'BibleStoreBase', context: context);

  @override
  void update({int? book, int? chapter}) {
    final _$actionInfo = _$BibleStoreBaseActionController.startAction(
        name: 'BibleStoreBase.update');
    try {
      return super.update(book: book, chapter: chapter);
    } finally {
      _$BibleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void refresh() {
    final _$actionInfo = _$BibleStoreBaseActionController.startAction(
        name: 'BibleStoreBase.refresh');
    try {
      return super.refresh();
    } finally {
      _$BibleStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
book: ${book},
chapter: ${chapter},
content: ${content},
infoString: ${infoString}
    ''';
  }
}
