import 'package:mobx/mobx.dart';

part 'controller.g.dart';

class BarIndex = BarIndexBase with _$BarIndex;

abstract class BarIndexBase with Store {
  @observable
  int value = 0;

  @action
  void update(int value) {
    this.value = value;
  }
}
