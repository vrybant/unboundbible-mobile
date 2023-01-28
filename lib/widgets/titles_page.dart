import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unboundbible/providers.dart';

class TitlesPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Книга"),
          ),
          backgroundColor: Colors.blueAccent,
        ),
        body: Container(
          color: Colors.white,
          child: _buildList(ref),
        ));
  }

  Widget _buildList(WidgetRef ref) {
    final lines = ref.watch(bibleProvider).titles;
    final currBook = ref.watch(bibleProvider).book;
    final groupIndex = currBook - 1;
    return ListView.builder(
        itemCount: lines.length,
        itemBuilder: (BuildContext content, int index) {
          var line = lines[index];
          return Container(
            color: Colors.white,
            child: ListTile(
              dense: true,
              title: Text(line, style: TextStyle(fontSize: 24.0)),
              // onTap: () => select(index),
              leading: Radio<int>(
                  value: index,
                  groupValue: groupIndex,
                  onChanged: (value) {
                    ref.watch(bibleProvider.notifier).updateBook(value! + 1);
                  }),
            ),
          );
        });
  }
}
