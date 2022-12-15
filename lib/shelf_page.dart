import 'package:flutter/material.dart';
import 'core/tools.dart';

class ShelfPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Bible",
          ),
          backgroundColor: Colors.blueAccent,
        ),
        body: Container(
          color: Colors.white,
          child: _buildList(),
        ));
  }

  void selectBible(int index) {
    tools!.setCurrBible(index);
    print(index);
  }

  Widget _buildList() {
    return ListView.builder(
        itemCount: tools!.bibles.length,
        itemBuilder: (BuildContext content, int index) {
          var line = tools!.bibles[index].name;
          return Container(
            color: Colors.white,
            child: ListTile(
              title: Text(line, style: TextStyle(fontSize: 24.0)),
//            trailing: Icon(Icons.chevron_right),
              onTap: () => selectBible(index),
            ),
          );
        });
  }
}
