import 'package:mobx/mobx.dart';
import 'package:unboundbible/core/tools.dart';
import 'package:unboundbible/locator.dart';

part 'search_store.g.dart';

class SearchStore = SearchStoreBase with _$SearchStore;

abstract class SearchStoreBase with Store {
  @observable
  String string = '';

  @computed
  List<String> get content => locator<Tools>().get_Search(string);

  @action
  void update(String string) {
    this.string = string;
  }
}
