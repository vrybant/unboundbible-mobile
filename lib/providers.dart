import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/tools.dart';

final chapterProvider =
    StateNotifierProvider<ChapterNotifier, List<String>>((_) => ChapterNotifier());

class ChapterNotifier extends StateNotifier<List<String>> {
  ChapterNotifier() : super([]) {
    update();
  }

  update() {
    state = tools!.get_Chapter();
  }
}
