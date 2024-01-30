// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SearchStore on SearchStoreBase, Store {
  Computed<List<String>>? _$contentComputed;

  @override
  List<String> get content =>
      (_$contentComputed ??= Computed<List<String>>(() => super.content,
              name: 'SearchStoreBase.content'))
          .value;

  late final _$stringAtom =
      Atom(name: 'SearchStoreBase.string', context: context);

  @override
  String get string {
    _$stringAtom.reportRead();
    return super.string;
  }

  @override
  set string(String value) {
    _$stringAtom.reportWrite(value, super.string, () {
      super.string = value;
    });
  }

  late final _$SearchStoreBaseActionController =
      ActionController(name: 'SearchStoreBase', context: context);

  @override
  void update(String string) {
    final _$actionInfo = _$SearchStoreBaseActionController.startAction(
        name: 'SearchStoreBase.update');
    try {
      return super.update(string);
    } finally {
      _$SearchStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
string: ${string},
content: ${content}
    ''';
  }
}
