import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:unboundbible/controllers/main_controller.dart';

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
          child: _listView(context),
        ));
  }

  Widget _listView(BuildContext context) {
    return Observer(
      builder: (_) {
        final count = mainController.chaptersCount;
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
                  mainController.update(chapter: number);
                  context.go('/');
                },
              ),
            );
          },
        );
      },
    );
  }
}
