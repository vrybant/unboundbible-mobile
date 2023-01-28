import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unboundbible/providers.dart';

class BiblePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final text = ref.watch(currInfoProvider);
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              print('pressed');
            },
            child: Text(text),
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
    final lines = ref.watch(bibleProvider.notifier).getChapter;
    return ListView.builder(
      itemCount: lines.length,
      itemBuilder: (BuildContext content, int index) {
        var line = lines[index];
        return Container(
          color: Colors.white,
          child: ListTile(
              title: Text(line, style: TextStyle(fontSize: 24.0)),
              onTap: () {
                print('tapped');
              }),
        );
      },
    );
  }
}
