import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:unboundbible/stores/shelf_store.dart';

class ShelfPage extends StatelessWidget {
  const ShelfPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text("Перевод"),
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
        final lines = shelfStore.list;
        final groupIndex = shelfStore.index;
        return ListView.builder(
          itemCount: lines.length,
          itemBuilder: (_, int index) {
            var line = lines[index];
            return Container(
              color: Colors.white,
              child: ListTile(
                dense: true,
                title: Text(line, style: TextStyle(fontSize: 24.0)),
                leading: Radio<int>(
                  value: index,
                  groupValue: groupIndex,
                  onChanged: (_) {
                    shelfStore.update(index);
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}
