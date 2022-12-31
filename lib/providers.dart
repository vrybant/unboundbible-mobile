import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unboundbible/notifiers.dart';

final chapterProvider =
    StateNotifierProvider<ChapterNotifier, List<String>>((_) => ChapterNotifier());

final shelfProvider = StateNotifierProvider<ShelfNotifier, List<String>>((_) => ShelfNotifier());

final shelfIndexProvider =
    StateNotifierProvider<ShelfIndexNotifier, int>((_) => ShelfIndexNotifier());
