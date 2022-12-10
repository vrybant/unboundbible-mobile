import 'package:flutter/material.dart';
import 'core/tools.dart';

class BiblePage extends StatelessWidget {
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

  Widget _buildList() {
    return ListView.builder(
        itemCount: lines!.length,
        itemBuilder: (BuildContext content, int index) {
          var line = lines![index];
          return Container(
            color: Colors.white,
            child: ListTile(
              title: Text(line, style: TextStyle(fontSize: 24.0)),
//            trailing: Icon(Icons.chevron_right),
//            onTap: () => onPush?.call(materialIndex),
            ),
          );
        });
  }
}
