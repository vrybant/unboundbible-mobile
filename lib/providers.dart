import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unboundbible/core/tools.dart';
import 'package:unboundbible/notifiers.dart';
import 'package:unboundbible/states.dart';

final currBibleProvider = StateNotifierProvider<CurrBibleNotifier, int>((ref) {
  ref.watch(bibleProvider);
  return CurrBibleNotifier();
});

final bibleProvider = StateNotifierProvider<BibleEngine, BibleState>((ref) {
  return BibleEngine();
});

final navigationIndexProvider = StateProvider<int>((_) => 0);

final shelfProvider = StateProvider<List<String>>((_) => tools!.get_Shelf());

final titlesProvider = StateProvider<List<String>>((ref) {
  ref.watch(currBibleProvider);
  return currBible!.getTitles();
});
