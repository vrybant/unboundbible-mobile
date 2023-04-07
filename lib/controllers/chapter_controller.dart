import 'package:mobx/mobx.dart';
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
  String get infoString => tools!.getInfo(book, chapter);

  @computed
  List<String> get content => tools!.get_Chapter(book, chapter);

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
