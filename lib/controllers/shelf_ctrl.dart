import 'package:mobx/mobx.dart';
import 'package:unboundbible/core/tools.dart';

part 'shelf_ctrl.g.dart';

class ShelfCtrl = ShelfCtrlBase with _$ShelfCtrl;

abstract class ShelfCtrlBase with Store {
  @observable
  int index = tools!.getCurrBibleIndex();

  List<String> get list {
    return tools!.get_Shelf();
  }

  @action
  void update(int index) {
    this.index = index;
    tools!.setCurrBible(index);
  }
}
