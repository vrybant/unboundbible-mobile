import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unboundbible/core/bible.dart';
import 'package:unboundbible/core/tools.dart';
import 'package:unboundbible/notifiers.dart';

final currBibleProvider = StateNotifierProvider<CurrBibleNotifier, int>((ref) {
  return CurrBibleNotifier();
});

final currVerseProvider = StateNotifierProvider<CurrVerseNotifier, Verse>((ref) {
  ref.watch(currBibleProvider);
  return CurrVerseNotifier();
});

final chapterProvider = StateProvider<List<String>>((ref) {
  ref.watch(currBibleProvider);
  ref.watch(currVerseProvider);
  ref.watch(chaptersCountProvider);
  ref.watch(shelfProvider);
  return tools!.get_Chapter();
});

final chaptersCountProvider = StateProvider<int>((ref) {
  ref.watch(currVerseProvider);
  return currBible!.chaptersCount(currVerse);
});

final currInfoProvider = StateProvider<String>((ref) {
  ref.watch(currBibleProvider);
  ref.watch(currVerseProvider);
  return tools!.getCurrInfo();
});

final navigationIndexProvider = StateProvider<int>((_) => 0);

final shelfProvider = StateProvider<List<String>>((_) => tools!.get_Shelf());

final titlesProvider = StateProvider<List<String>>((ref) {
  ref.watch(currBibleProvider);
  return currBible!.getTitles();
});
