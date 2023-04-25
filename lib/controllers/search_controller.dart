import 'package:mobx/mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:unboundbible/core/tools.dart';

part 'search_controller.g.dart';

final searchController = SearchController();

class SearchController = SearchControllerBase with _$SearchController;

abstract class SearchControllerBase with Store {
  @observable
  String string = '';

  @computed
  List<String> get content => GetIt.I<Tools>().get_Search(string);

  @action
  void update(String string) {
    this.string = string;
  }
}
