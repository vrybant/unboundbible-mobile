import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:unboundbible/core/tools.dart';

class TitlesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Книга"),
          ),
          backgroundColor: Colors.blueAccent,
        ),
        body: Container(
          color: Colors.white,
          child: _buildList(context),
        ));
  }

  Widget _buildList(BuildContext context) {
    final lines = tools?.getTitles();
    //final currBook = ref.watch(bibleProvider).book;
    //final groupIndex = currBook - 1;
    return ListView.builder(
        itemCount: lines?.length,
        itemBuilder: (BuildContext content, int index) {
          var line = lines![index];
          return Container(
            color: Colors.white,
            child: ListTile(
                dense: true,
                title: Text(line, style: TextStyle(fontSize: 24.0)),
                onTap: () {
                  print(line);
//              ref.read(bibleProvider.notifier).update(book: index + 1);
//              ref.context.go('/titles/chapters');
                }
                //   leading: Radio<int>(
                //       value: index,
                //       groupValue: groupIndex,
                //       onChanged: (value) {
                //         ref.watch(bibleProvider.notifier).updateBook(value! + 1);
                //       }),
                ),
          );
        });
  }
}
