import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'extensions.dart';
import 'utils.dart';

String? globalDatabasesDirectory;

String locale() {
  return Platform.localeName; // ru_RU
}

bool getRightToLeft(String language) {
  return language.hasPrefix("he") | language.hasPrefix("ara") | language.hasPrefix("fa");
}

Future<void> copyFileFromBundle(String fromPath, String toPath) async {
  ByteData data = await rootBundle.load(fromPath);
  List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  await File(toPath).writeAsBytes(bytes, flush: true);
}

Future<String> getDatabasesDirectory() async {
  if (Platform.isWindows) {
    return r'C:\Users\Vladimir\Unbound Bible\';
  }
  final directory = await getApplicationSupportDirectory();
  final path = directory.parent.path;
  return context.join(path, 'databases');
}

Future<void> installDatabasesFromAssets() async {
  final databasesPath = await getDatabasesDirectory();
  await Directory(databasesPath).create();

  for (var file in databasesList) {
    final filePath = join(databasesPath, file);

    final source = context.join('assets', 'databases', file);
    try {
      await copyFileFromBundle(source.toString(), filePath);
    } catch (e) {
      debugPrint("$e");
    }
  }
}

Future<void> globalInit() async {
  globalDatabasesDirectory = await getDatabasesDirectory();
}
