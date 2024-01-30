// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locale.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LocaleModel on LocaleBase, Store {
  late final _$localeAtom = Atom(name: 'LocaleBase.locale', context: context);

  @override
  Locale? get locale {
    _$localeAtom.reportRead();
    return super.locale;
  }

  @override
  set locale(Locale? value) {
    _$localeAtom.reportWrite(value, super.locale, () {
      super.locale = value;
    });
  }

  late final _$LocaleBaseActionController =
      ActionController(name: 'LocaleBase', context: context);

  @override
  void set(Locale value) {
    final _$actionInfo =
        _$LocaleBaseActionController.startAction(name: 'LocaleBase.set');
    try {
      return super.set(value);
    } finally {
      _$LocaleBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
locale: ${locale}
    ''';
  }
}
