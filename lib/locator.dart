import 'package:get_it/get_it.dart';
import 'package:unboundbible/stores/bible_store.dart';
import 'package:unboundbible/core/tools.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<Tools>(Tools());
  locator.registerLazySingleton(() => BibleStore());
}
