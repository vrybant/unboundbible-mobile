import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unboundbible/notifiers.dart';
import 'package:unboundbible/states.dart';

final bibleProvider = StateNotifierProvider<BibleEngine, BibleState>((ref) {
  ref.watch(shelfProvider);
  return BibleEngine();
});

final navigationIndexProvider = StateProvider<int>((_) => 0);

final shelfProvider = StateNotifierProvider<ShelfNotifier, int>((_) => ShelfNotifier());
