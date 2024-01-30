import 'package:mobx/mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:unboundbible/core/tools.dart';
import 'package:unboundbible/stores/main_store.dart';

part 'shelf_store.g.dart';

final shelfStore = ShelfStore();

class ShelfStore = ShelfStoreBase with _$ShelfStore;

abstract class ShelfStoreBase with Store {
  @observable
  int index = GetIt.I<Tools>().getCurrBibleIndex();

  List<String> get list => GetIt.I<Tools>().get_Shelf();

  @action
  void update(int value) {
    index = value;
    GetIt.I<Tools>().setCurrBible(index);
    bibleStore.refresh();
  }
}
