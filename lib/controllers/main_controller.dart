import 'package:mobx/mobx.dart';
import 'package:unboundbible/core/tools.dart';

part 'main_controller.g.dart';

class MainController = MainControllerBase with _$MainController;

abstract class MainControllerBase with Store {
  @observable
  int book = 1;

  @observable
  int chapter = 1;

  @computed
  String get infoString {
    return tools!.getInfo(book, chapter);
  }

  @computed
  List<String> get content {
    return tools!.get_Chapter(book, chapter);
  }

  @action
  void update({
    int? book,
    int? chapter,
  }) {
    this.book = book ?? this.book;
    this.chapter = chapter ?? 1;
  }
}
