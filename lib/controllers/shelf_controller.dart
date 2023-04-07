import 'package:mobx/mobx.dart';
import 'package:unboundbible/core/tools.dart';

part 'shelf_controller.g.dart';

class ShelfController = ShelfControllerBase with _$ShelfController;

abstract class ShelfControllerBase with Store {
  @observable
  int index = tools!.getCurrBibleIndex();

  List<String> get list {
    return tools!.get_Shelf();
  }

  @action
  void update(int value) {
    index = value;
    tools!.setCurrBible(index);
  }
}
