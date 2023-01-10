import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unboundbible/providers.dart';

class ShelfPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Перевод"),
          ),
          backgroundColor: Colors.blueAccent,
        ),
        body: Container(
          color: Colors.white,
          child: _buildList(ref),
        ));
  }

  void _onChanged(WidgetRef ref, int index) {
    ref.read(shelfIndexProvider.notifier).update(index);
    ref.read(titlesProvider.notifier).update();
    ref.read(chapterProvider.notifier).update();
    ref.read(chaptersCountProvider.notifier).update();
    ref.read(currentProvider.notifier).update();
  }

  Widget _buildList(WidgetRef ref) {
    final lines = ref.read(shelfProvider);
    final int groupIndex = ref.watch(shelfIndexProvider);
    return ListView.builder(
        itemCount: lines.length,
        itemBuilder: (BuildContext content, int index) {
          var line = lines[index];
          return Container(
            color: Colors.white,
            child: ListTile(
              dense: true,
              title: Text(line, style: TextStyle(fontSize: 24.0)),
//            onTap: () => selectBible(index),
              leading: Radio<int>(
                value: index,
                groupValue: groupIndex,
                onChanged: (value) => _onChanged(ref, value!),
              ),
            ),
          );
        });
  }
}
