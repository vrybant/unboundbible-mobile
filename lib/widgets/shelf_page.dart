import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:unboundbible/controllers/shelf_controller.dart';

final shelfController = ShelfController();

class ShelfPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
  }

  Widget _listView(BuildContext context) {
    return Observer(
      builder: (_) {
        final lines = shelfController.list;
        final groupIndex = shelfController.index;
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
                    shelfController.update(index);
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
