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

  Widget _buildList(WidgetRef ref) {
    final count = ref.watch(chaptersCountProvider);
    return ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext content, int index) {
          final number = index + 1;
          return Container(
            color: Colors.white,
            child: ListTile(
              dense: true,
              title: Text(' $number', style: TextStyle(fontSize: 24.0)),
              onTap: () {
                ref.watch(currVerseProvider.notifier).updateChapter(number);
                ref.watch(navigationIndexProvider.notifier).state = 0;
              },
            ),
          );
        });
  }
}
