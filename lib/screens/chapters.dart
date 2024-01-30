import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:unboundbible/stores/main_store.dart';

class ChaptersPage extends StatelessWidget {
  const ChaptersPage({Key? key, required this.book}) : super(key: key);
  final int book;

  @override
  Widget build(BuildContext context) {
    final title = bibleStore.getTitle(book);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        color: Colors.white,
        child: _listView(context),
      ),
    );
  }

  Widget _listView(BuildContext context) {
    final count = bibleStore.chaptersCount(book);
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext content, int index) {
        final number = index + 1;
        return Container(
          color: Colors.white,
          child: ListTile(
            title: Text(' Глава $number', style: TextStyle(fontSize: 24.0)),
            onTap: () {
              bibleStore.update(book: book, chapter: number);
              context.go('/');
            },
            dense: true,
          ),
        );
      },
    );
  }
}
