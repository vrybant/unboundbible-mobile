import 'package:mobx/mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:unboundbible/core/tools.dart';

part 'chapter_controller.g.dart';

final chapterController = ChapterController();

class ChapterController = ChapterControllerBase with _$ChapterController;

abstract class ChapterControllerBase with Store {
  @observable
  int book = 1;

  @observable
  int chapter = 1;

  @computed
  String get infoString => GetIt.I<Tools>().getInfo(book, chapter);

  @computed
  List<String> get content => GetIt.I<Tools>().get_Chapter(book, chapter);

  @computed
  int get chaptersCount => GetIt.I<Tools>().chaptersCount(book);

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
