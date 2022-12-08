import 'dart:io';
// import 'dart:js';
//import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'extensions.dart';
import 'utils.dart';

bool getRightToLeft(String language) {
  return language.hasPrefix("he") |
      language.hasPrefix("ara") |
      language.hasPrefix("fa");
}

Future<void> copyFileFromBundle(String fromPath, String toPath) async {
  ByteData data = await rootBundle.load(fromPath);
  List<int> bytes =
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  await File(toPath).writeAsBytes(bytes, flush: true);
}

Future<String> getDatabasesDirectory() async {
  final directory = await getApplicationSupportDirectory();
  final path = directory.parent.path;
  return context.join(path, 'databases');
}

Future<void> copyDefaultsFiles() async {
  final databasesPath = await getDatabasesDirectory();
  var files = databaseList;

  print("~~~ directory ~~~");
  print(databasesPath);

  for (var file in files) {
    final path = join(databasesPath, file);

/*
//  await deleteDatabase(path); // getting a fresh copy from the asset
    try {
      await File(path).delete();
    } catch (e) {
      debugPrint("$e");
    }
*/

    final exists = false; //await File(path).exists();

    if (!exists) {
      // make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {
        //
      }

      try {
        final source = context.join('assets', 'databases', file);
        await copyFileFromBundle(source.toString(), path);
        print(source.toString() + ' ~ ' + path);
      } catch (_) {
        //
      }
    }
  }
}
