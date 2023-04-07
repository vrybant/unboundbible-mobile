// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MainController on MainControllerBase, Store {
  Computed<String>? _$infoStringComputed;

  @override
  String get infoString =>
      (_$infoStringComputed ??= Computed<String>(() => super.infoString,
              name: 'MainControllerBase.infoString'))
          .value;
  Computed<List<String>>? _$contentComputed;

  @override
  List<String> get content =>
      (_$contentComputed ??= Computed<List<String>>(() => super.content,
              name: 'MainControllerBase.content'))
          .value;

  late final _$bookAtom =
      Atom(name: 'MainControllerBase.book', context: context);

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
      Atom(name: 'MainControllerBase.chapter', context: context);

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

  late final _$MainControllerBaseActionController =
      ActionController(name: 'MainControllerBase', context: context);

  @override
  void update({int? book, int? chapter}) {
    final _$actionInfo = _$MainControllerBaseActionController.startAction(
        name: 'MainControllerBase.update');
    try {
      return super.update(book: book, chapter: chapter);
    } finally {
      _$MainControllerBaseActionController.endAction(_$actionInfo);
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
