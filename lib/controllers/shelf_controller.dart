import 'package:mobx/mobx.dart';
import 'package:unboundbible/core/tools.dart';
import 'package:unboundbible/controllers/chapter_controller.dart';

part 'shelf_controller.g.dart';

final shelfController = ShelfController();

class ShelfController = ShelfControllerBase with _$ShelfController;

abstract class ShelfControllerBase with Store {
  @observable
  int index = tools!.getCurrBibleIndex();

  List<String> get list => tools!.get_Shelf();

  @action
  void update(int value) {
    index = value;
    tools!.setCurrBible(index);
    chapterController.refresh();
  }
}
