import 'package:mobx/mobx.dart';
import 'package:unboundbible/core/tools.dart';
import 'package:unboundbible/locator.dart';

part 'bible_store.g.dart';

class BibleStore = BibleStoreBase with _$BibleStore;

abstract class BibleStoreBase with Store {
  @observable
  int book = 1;

  @observable
  int chapter = 1;

  @computed
  String get infoString => locator<Tools>().getInfo(book, chapter);

  @computed
  List<String> get content => locator<Tools>().get_Chapter(book, chapter);

  int chaptersCount(int book) => locator<Tools>().chaptersCount(book);
  String getTitle(int book) => locator<Tools>().getTitle(book);

  @action
  void update({
    int? book,
    int? chapter,
  }) {
    this.book = book ?? this.book;
    this.chapter = chapter ?? 1;
  }

  @action
  void refresh() {
    final temp = book;
    this.book = -1;
    this.book = temp;
  }
}
