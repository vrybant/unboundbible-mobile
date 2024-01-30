import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:unboundbible/locator.dart';
import 'package:unboundbible/stores/bible_store.dart';

class ChaptersPage extends StatelessWidget {
  const ChaptersPage({Key? key, required this.book}) : super(key: key);
  final int book;

  @override
  Widget build(BuildContext context) {
    final store = locator<BibleStore>();
    final title = store.getTitle(book);
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
    final store = locator<BibleStore>();
    final count = store.chaptersCount(book);
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext content, int index) {
        final number = index + 1;
        return Container(
          color: Colors.white,
          child: ListTile(
            title: Text(' Глава $number', style: TextStyle(fontSize: 24.0)),
            onTap: () {
              store.update(book: book, chapter: number);
              context.go('/');
            },
            dense: true,
          ),
        );
      },
    );
  }
}
