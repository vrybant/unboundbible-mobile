import 'package:flutter/material.dart';

class ColorsListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ColorsList",
        ),
        backgroundColor: Colors.green,
      ),
      body: Container(
        color: Colors.white,
        child: _buildList(),
      ),
    );
  }

  final List<int> materialIndices = [901, 800, 700, 600, 500, 400, 300, 200, 100, 50, 25, 5];

  Widget _buildList() {
    return ListView.builder(
        itemCount: materialIndices.length,
        itemBuilder: (BuildContext content, int index) {
          int materialIndex = materialIndices[index];
          return Container(
            color: Colors.grey,
            child: ListTile(
              title: Text('$materialIndex', style: TextStyle(fontSize: 24.0)),
              trailing: Icon(Icons.chevron_right),
//            onTap: () => onPush?.call(materialIndex),
            ),
          );
        });
  }
}
