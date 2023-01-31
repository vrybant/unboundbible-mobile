import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:unboundbible/providers.dart';

class BiblePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final info = ref.watch(bibleProvider).infoString;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
              foregroundColor: Colors.white,
            ),
            child: Text(info),
            onPressed: () {
              context.go('/details');
            },
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        color: Colors.white,
        child: _buildList(ref),
      ),
    );
  }

  Widget _buildList(WidgetRef ref) {
    final lines = ref.watch(bibleProvider).content;
    return ListView.builder(
      key: ObjectKey(lines.hashCode),
      itemCount: lines.length,
      itemBuilder: (BuildContext content, int index) {
        var line = lines[index];
        return Container(
          color: Colors.white,
          child: ListTile(
              title: Text(line, style: TextStyle(fontSize: 24.0)),
              onTap: () {
//              ref.context.go('/details');
                ref.context.push('/details');
              }),
        );
      },
    );
  }
}
