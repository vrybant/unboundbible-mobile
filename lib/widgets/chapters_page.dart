import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unboundbible/providers.dart';

class ChaptersPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Глава"),
          ),
          backgroundColor: Colors.blueAccent,
        ),
        body: Container(
          color: Colors.white,
          child: _buildList(ref),
        ));
  }

  void _onTap(WidgetRef ref, int index) {
    ref.read(chaptersIndexProvider.notifier).update(index);
    ref.read(currentProvider.notifier).update();
    ref.read(chapterProvider.notifier).update();
    ref.read(navigationIndexProvider.notifier).update(0);
  }

  Widget _buildList(WidgetRef ref) {
    final count = ref.watch(chaptersCountProvider);
    return ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext content, int index) {
          return Container(
            color: Colors.white,
            child: ListTile(
              dense: true,
              title: Text(' ${index + 1}', style: TextStyle(fontSize: 24.0)),
              onTap: () => _onTap(ref, index),
            ),
          );
        });
  }
}
