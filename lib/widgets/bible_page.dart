import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BiblePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final info = ref.watch(bibleProvider).infoString;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
              foregroundColor: Colors.white,
            ),
            child: Text("Bible"),
            onPressed: () {
              context.go('/titles');
            },
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        color: Colors.white,
        child: _buildList(context),
      ),
    );
  }

  Widget _buildList(BuildContext context) {
    final lines = []; // ref.watch(bibleProvider).content;
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
//              ref.context.push('/details');
              }),
        );
      },
    );
  }
}
