import 'package:flutter/material.dart';

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
          child: _buildList(context),
        ));
  }

  Widget _buildList(BuildContext context) {
    final lines = []; // ref.watch(shelfProvider.notifier).list;
    final groupIndex = 0; // ref.watch(shelfProvider);
    return ListView.builder(
        itemCount: lines.length,
        itemBuilder: (BuildContext content, int index) {
          var line = lines[index];
          return Container(
            color: Colors.white,
            child: ListTile(
              dense: true,
              title: Text(line, style: TextStyle(fontSize: 24.0)),
//            onTap: () => selectBible(index),
              // leading: Radio<int>(
              //   value: index,
              //   groupValue: groupIndex,
              //   onChanged: (value) {
              //     ref.watch(shelfProvider.notifier).update(index);
              //   },
              // ),
            ),
          );
        });
  }
}
