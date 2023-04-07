// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shelf_ctrl.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ShelfCtrl on ShelfCtrlBase, Store {
  late final _$indexAtom = Atom(name: 'ShelfCtrlBase.index', context: context);

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

  late final _$ShelfCtrlBaseActionController =
      ActionController(name: 'ShelfCtrlBase', context: context);

  @override
  void update(int index) {
    final _$actionInfo = _$ShelfCtrlBaseActionController.startAction(
        name: 'ShelfCtrlBase.update');
    try {
      return super.update(index);
    } finally {
      _$ShelfCtrlBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
index: ${index}
    ''';
  }
}
