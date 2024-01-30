import 'package:mobx/mobx.dart';

part 'bar_store.g.dart';

final barStore = BarStore();

class BarStore = BarBase with _$BarStore;

abstract class BarBase with Store {
  @observable
  int index = 0;

  @action
  void update(int value) {
    index = value;
  }
}
