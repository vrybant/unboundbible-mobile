import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:unboundbible/locator.dart';
import 'package:unboundbible/stores/bible_store.dart';

class BiblePage extends StatelessWidget {
  final store = locator<BibleStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: TextButton(
              child: Center(
                child: Text(store.infoString),
              ),
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
                foregroundColor: Colors.white,
              ),
              onPressed: () => context.go('/titles'),
            ),
            backgroundColor: Colors.blueAccent,
          ),
          body: _listView(context),
        );
      },
    );
  }

  Widget _listView(BuildContext context) {
    return Observer(
      builder: (BuildContext context) {
        final lines = store.content;
        return ListView.builder(
          key: ObjectKey(lines.hashCode),
          itemCount: lines.length,
          itemBuilder: (BuildContext content, int index) {
            var line = lines[index];
            return Container(
              color: Colors.white,
              child: ListTile(
                title: Text(line, style: TextStyle(fontSize: 24.0)),
//              onTap: () => context.push('/details'),
              ),
            );
          },
        );
      },
    );
  }
}
