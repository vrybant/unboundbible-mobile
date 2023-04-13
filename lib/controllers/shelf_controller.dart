import 'package:mobx/mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:unboundbible/core/tools.dart';
import 'package:unboundbible/controllers/chapter_controller.dart';

part 'shelf_controller.g.dart';

final shelfController = ShelfController();

class ShelfController = ShelfControllerBase with _$ShelfController;

abstract class ShelfControllerBase with Store {
  @observable
  int index = GetIt.I<Tools>().getCurrBibleIndex();

  List<String> get list => GetIt.I<Tools>().get_Shelf();

  @action
  void update(int value) {
    index = value;
    GetIt.I<Tools>().setCurrBible(index);
    chapterController.refresh();
  }
}
