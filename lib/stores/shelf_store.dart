import 'package:mobx/mobx.dart';
import 'package:unboundbible/core/tools.dart';
import 'package:unboundbible/locator.dart';
import 'package:unboundbible/stores/bible_store.dart';

part 'shelf_store.g.dart';

class ShelfStore = ShelfStoreBase with _$ShelfStore;

abstract class ShelfStoreBase with Store {
  @observable
  int index = locator<Tools>().getCurrBibleIndex();

  List<String> get content => locator<Tools>().get_Shelf();

  @action
  void update(int value) {
    index = value;
    locator<Tools>().setCurrBible(index);
    locator<BibleStore>().refresh();
  }
}
