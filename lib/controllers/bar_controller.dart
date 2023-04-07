import 'package:mobx/mobx.dart';

part 'bar_controller.g.dart';

class BarController = BarBase with _$BarController;

abstract class BarBase with Store {
  @observable
  int index = 0;

  @action
  void update(int value) {
    index = value;
  }
}
