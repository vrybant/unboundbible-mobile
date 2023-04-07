import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChaptersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Глава"),
          ),
          backgroundColor: Colors.blueAccent,
        ),
        body: Container(
          color: Colors.white,
          child: _buildList(context),
        ));
  }

  Widget _buildList(BuildContext context) {
    final count = 0; // ref.watch(bibleProvider).chaptersCount;
    return ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext content, int index) {
          final number = index + 1;
          return Container(
            color: Colors.white,
            child: ListTile(
              dense: true,
              title: Text(' $number', style: TextStyle(fontSize: 24.0)),
              // onTap: () {
              //   ref.watch(bibleProvider.notifier).update(chapter: number);
              //   ref.context.go('/');
              // },
            ),
          );
        });
  }
}
