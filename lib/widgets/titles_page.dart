import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:get_it/get_it.dart';

import 'package:unboundbible/controllers/chapter_controller.dart';
import 'package:unboundbible/core/tools.dart';

class TitlesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Книга"),
          ),
          backgroundColor: Colors.blueAccent,
        ),
        body: Container(
          color: Colors.white,
          child: _listView(context),
        ));
  }

  Widget _listView(BuildContext context) {
    final lines = GetIt.I<Tools>().getTitles();
    return ListView.builder(
      itemCount: lines.length,
      itemBuilder: (BuildContext content, int index) {
        var line = lines[index];
        return Container(
          color: Colors.white,
          child: ListTile(
            dense: true,
            title: Text(line, style: TextStyle(fontSize: 24.0)),
            onTap: () {
              chapterController.update(book: index + 1);
              context.go('/');
            },
          ),
        );
      },
    );
  }
}
