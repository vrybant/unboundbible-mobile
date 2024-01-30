import 'package:get_it/get_it.dart';
import 'package:unboundbible/stores/bible_store.dart';
import 'package:unboundbible/core/tools.dart';
import 'package:unboundbible/stores/search_store.dart';
import 'package:unboundbible/stores/shelf_store.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<Tools>(Tools());
  locator.registerLazySingleton(() => BibleStore());
  locator.registerLazySingleton(() => SearchStore());
  locator.registerLazySingleton(() => ShelfStore());
}
