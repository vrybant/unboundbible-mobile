import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:unboundbible/controllers/main_controller.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        final info = mainController.infoString;
        return Scaffold(
          appBar: AppBar(
            title: Center(
              child: TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                  foregroundColor: Colors.white,
                ),
                child: Text(info),
                onPressed: () {
                  context.go('/titles');
                },
              ),
            ),
            backgroundColor: Colors.blueAccent,
          ),
          body: Container(
            color: Colors.white,
            child: _listView(context),
          ),
        );
      },
    );
  }

  Widget _listView(BuildContext context) {
    return Observer(
      builder: (_) {
        final lines = mainController.content;
        return ListView.builder(
          key: ObjectKey(lines.hashCode),
          itemCount: lines.length,
          itemBuilder: (BuildContext content, int index) {
            var line = lines[index];
            return Container(
              color: Colors.white,
              child: ListTile(
                  title: Text(line, style: TextStyle(fontSize: 24.0)),
                  onTap: () {
//                ref.context.push('/details');
                  }),
            );
          },
        );
      },
    );
  }
}
