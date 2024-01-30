// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shelf_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ShelfStore on ShelfStoreBase, Store {
  late final _$indexAtom = Atom(name: 'ShelfStoreBase.index', context: context);

  @override
  int get index {
    _$indexAtom.reportRead();
    return super.index;
  }

  @override
  set index(int value) {
    _$indexAtom.reportWrite(value, super.index, () {
      super.index = value;
    });
  }

  late final _$ShelfStoreBaseActionController =
      ActionController(name: 'ShelfStoreBase', context: context);

  @override
  void update(int value) {
    final _$actionInfo = _$ShelfStoreBaseActionController.startAction(
        name: 'ShelfStoreBase.update');
    try {
      return super.update(value);
    } finally {
      _$ShelfStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
index: ${index}
    ''';
  }
}
