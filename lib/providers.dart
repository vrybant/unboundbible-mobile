import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unboundbible/notifiers.dart';

final chapterProvider =
    StateNotifierProvider<ChapterNotifier, List<String>>((_) => ChapterNotifier());

final chaptersCountProvider =
    StateNotifierProvider<ChaptersCountNotifier, int>((_) => ChaptersCountNotifier());

final chaptersIndexProvider =
    StateNotifierProvider<ChaptersIndexNotifier, int>((_) => ChaptersIndexNotifier());

final currentProvider = StateNotifierProvider<CurrentNotifier, String>((_) => CurrentNotifier());

final navigationIndexProvider = StateProvider<int>((_) => 0);

final shelfIndexProvider =
    StateNotifierProvider<ShelfIndexNotifier, int>((_) => ShelfIndexNotifier());

final shelfProvider = StateNotifierProvider<ShelfNotifier, List<String>>((_) => ShelfNotifier());

final titlesProvider = StateNotifierProvider<TitlesNotifier, List<String>>((_) => TitlesNotifier());

final titlesIndexProvider =
    StateNotifierProvider<TitlesIndexNotifier, int>((_) => TitlesIndexNotifier());
