import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';

part 'locale.g.dart';

final localeModel = LocaleModel();

class LocaleModel = LocaleBase with _$LocaleModel;

abstract class LocaleBase with Store {
  @observable
  Locale? locale;

  @action
  void set(Locale value) {
    locale = value;
  }
}
